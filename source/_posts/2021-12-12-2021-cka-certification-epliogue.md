---
title: 2021년 CKA 취득 후기
categories:
- Kubernetes
date: 2021-12-12 21:45:56
cover: /img/2021-12-12-2021-cka-certification-epliogue/cka-certificate-kihoon-han.jpg
thumbnail: /img/2021-12-12-2021-cka-certification-epliogue/cka-certificate-kihoon-han.jpg
tags:
- kubernetes
- cncf
- linux foundation
- cka
- certification
---

최근(2021년 10월 말)에 CKA 자격증을 취득했었는데, 계속 미루다가 이제서야 후기를 작성했어요.

이번 글에서는 CKA 자격증 준비 과정 및 후기에 대한 이야기를 하려고 해요.

<!-- more -->

## Overview

CKA 는 글자 그대로 Certified Kubernetes Administrator 에서 볼 수 있듯이, K8s cluster 의 운영 및 관리 부분에 초점을 맞추고 있다고 생각해요.

다만, 꼭 자격증 취득이 목적이 아니더라도 CKA 범위에 해당하는 내용을 공부하는 것으로 K8s 의 전반적인 구조를 학습할 수 있어서 개인적으로 많은 도움이 되었어요.

시험에는 주로 아래와 같은 내용이 나왔어요. (구체적인 문제 내용은 적을 수 없어요)
- Pod, Deployment 등 container 를 띄워보기
- Network Policy 설정 (일종의 ACL 설정)
- K8s cluster 설치하기
- Pod troubleshooting
  - e.g. 기동 자체가 안되는 상황을 해결
  - e.g. 기동은 되나 기동하자마자 죽어버리는 문제를 해결
- Cluster troubleshooting
  - e.g. K8s Worker node 장애 상황 해결
  - e.g. K8s control plane 장애 상황 해결
- etc...

구체적인 "Exam details" 는 [이 링크](https://www.cncf.io/certification/cka/)를 통해 들어가시면 확인할 수 있어요.

그리고 이 시험은 (이미 알고 계시겠지만) 단순히 주어진 문제에 대해서 선택지를 고르거나 단답형/서술형으로 답을 적는 형식이 아니에요.
- 시험은 **사전에 준비된 Linux 환경에서 CLI 를 통해 진행**돼요.
- 문제의 지시에 따라 응시자는 위에서 언급한 예시와 같은 작업을 진행해야 해요.
- Linux 환경에서 커맨드를 입력하며 진행하다 보니 특정 문제에서 잘못된 조작을 할 경우 해당 문제 뿐만 아니라 다른 문제들까지 영향을 미칠 수 있어요.
  - (이 이야기는 밑에서 다시 할게요)


## 학습은 어떻게 했나요?

구글에 CKA 키워드로 검색을 하면 하나같이 추천하는 강의가 있어요.
- [\[Udemy\] Certified Kubernetes Administrator (CKA) with Practice Tests](https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/)

![Certified Kubernetes Administrator (CKA) with Practice Tests](/img/2021-12-12-2021-cka-certification-epliogue/78a13131-d773-416d-80c1-72a9fc0e92c0.jpg)

위 강의가 마치 바이블처럼 여겨지고 있어요.

정가는 10만원 조금 안되는 가격에 올라와 있는데, 사실상 상시 할인을 하고 있다고 봐도 돼요.
- Chrome 시크릿 모드를 켜고 들어가면 할인 가격이 잘 뜨니, 할인 가격에 결제를 하시면 돼요.

이 강의는 K8s 의 Core concepts 부터 시작해서 세부 영역까지 다루고 있는데요, 특히 Networking 부분은 강의 시간만 3시간에 달하고 위 강의에서 가장 자세하게 설명을 해주고 있어요.
- 위 링크에서 강의 컨텐츠 목록을 보면 대략 어떤 내용이 있는지 보실 수 있어요.

그리고, 이 강의를 결제하시면 [KodeKloud](https://kodekloud.com/) 라는 곳에서 CKA 시험 환경과 유사한 CLI 환경에서 연습문제를 풀 수 있는 쿠폰을 제공하고 있어요.
- 사실상 강의와 한 세트에요.
- 강의를 듣다 보면 중간 중간 Practice Test 가 있는데, 이 연습문제는 위 사이트에서 진행하게 돼요.
- 그리고, 강의 마지막쯤에 Mock Exam 이라고 해서 실제 시험을 대비한 연습문제도 제공을 하고 있어요.
  - Practice Test 는 매 문제마다 바로 정답 여부를 알 수 있어요.
  - Mock Exam 은 실제 CKA 시험과 유사하게 각 문제에 대한 정답을 바로 알려주지 않고, 한 번에 채점을 진행해줘요.

원래 계획은 이 강의를 2번 돌려보려고 했는데, (저의 게으름 탓인지) 2번까지 볼 시간은 없어서 강의 자체는 1번만 들었어요.

그리고 강의에 딸려 있는 Practice Test 들도 1번씩만 풀었습니다.

