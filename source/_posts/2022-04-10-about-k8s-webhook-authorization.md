---
title: Kubernetes Webhook Authorization 에 관하여
categories:
- Kubernetes
date: 2022-04-10 17:00:00
cover: /img/2022-04-10-about-k8s-webhook-authorization/kubernetes.svg
thumbnail: /img/2022-04-10-about-k8s-webhook-authorization/kubernetes.svg
tags:
- kubernetes
- kube-apiserver
- authorization
---

Kubernetes API 에 접근하기 위해서는 [인증](https://kubernetes.io/docs/reference/access-authn-authz/authentication/)과 [인가](https://kubernetes.io/docs/reference/access-authn-authz/authorization/) 단계를 거쳐야 해요.

그 중에서 인가(Authorization) 의 경우 Kubernetes 상에서는 4가지 방법이 제공되고 있어요.
- Role Based Access Control
- Attribute Based Access Control
- Node Authorization
- Webhook Authorization

이번에는 ["Webhook Authorization"](https://kubernetes.io/docs/reference/access-authn-authz/webhook/) 에 대해서 이야기를 해보려고 해요.

<!-- more -->

## (Recap) Authorization 에 사용되는 attributes 들

공식 문서에 있는 ["Review Your Request Attributes"](https://kubernetes.io/docs/reference/access-authn-authz/authorization/#review-your-request-attributes) 에서는 아래의 속성들만이 인가 과정에서 사용된다고 이야기하고 있어요.
- `user`
- `group`
- `extra`
- `API`
- `Request Path`
- `API Request Verb`
- `HTTP Request Verb (Method)`
- `Resource`
- `Subresource`
- `Namespace`
- `API Group`

## Webhook Authorization 의 동작 흐름

`kube-apiserver` 에서 [인증](https://kubernetes.io/docs/reference/access-authn-authz/authentication/) 과정을 통과하고 나면 인가 단계에 진입하게 돼요.

Webhook Authorization 의 경우 인가 단계에 진입 시 "사전에 정의된 별도의 API 서버" 로 아래 정보와 함께 `POST` 요청을 보내고 있어요.
- 현재 인증된 사용자 정보 (`user`, `group`)
- 해당 사용자가 접근하고자 하는 resource 정보 (`namespace`, `verb`, `group`, `resource`)

[Kubernetes Docs](https://kubernetes.io/docs/reference/access-authn-authz/webhook/#request-payloads) 에 있는 예시는 아래와 같아요.

```json
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "spec": {
    "resourceAttributes": {
      "namespace": "kittensandponies",
      "verb": "get",
      "group": "unicorn.example.org",
      "resource": "pods"
    },
    "user": "jane",
    "group": [
      "group1",
      "group2"
    ]
  }
}
```

"사전에 정의된 별도의 API 서버" 는 위의 요청을 받아서 인가 Yes/No 여부를 아래와 같은 형태로 응답으로 주게 돼요.

```json
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "status": {
    "allowed": true
  }
}
```

위의 예시는 인가 Yes 에 대한 응답이에요. No 일 경우에는 응답을 주는 방법이 2가지가 있다고 해요.

첫 번째 방법의 경우 아래와 같이 응답을 주게 돼요. (주로 선호되는 방식이라고 해요)

```json
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "status": {
    "allowed": false,
    "reason": "user does not have read access to the namespace"
  }
}
```

두 번째 방법의 경우 아래와 같이 응답을 주게 돼요.

```json
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "status": {
    "allowed": false,
    "denied": true,
    "reason": "user does not have read access to the namespace"
  }
}
```

**`denied` 부분이 있냐 없냐의 차이**가 있어요.
- Kubernetes Authorizer 는 여러 개를 같이 사용할 수 있어요.
  - 예를 들어, RBAC Authorizer 에서 인가 여부를 결정하지 않고 다음 Authorizer 로 넘겨줄 수 있어요.
- Webhook Authorization 역시 **인가 여부를 결정하지 않고 ("no opinion") 다음 Authorizer 로 결정을 넘길 수 있어요**.
  - 다음 Authorizer 로 결정을 넘기지 않고 현재 단계에서 확실하게 No 를 결정할 경우 `denided: true` 를 명시하게 돼요.

## RBAC, ABAC 과의 비교

RBAC, ABAC 은 사용 방법은 다르지만 "미리 정의된 설정" 에 의한 filtering 이라는 공통점이 있다고 생각해요
- 뇌피셜이에요
- 그래서 같은 요청에 대해서는 동일한 인가 결과가 나오게 될 것이에요.

하지만 Webhook Authorizer 의 경우 "사전에 정의된 별도의 API 서버" 구현에 따라 인가 여부를 동적으로 결정할 수 있을 것으로 보여요.
- e.g. 짧은 시간 내에 Pod list 를 너무 많이 조회하면 일정 시간 동안 인가 결과를 No 로 내려주기 (rate limiting)

