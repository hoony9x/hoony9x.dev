---
title: 2022년 CKAD 취득 후기
categories:
- Kubernetes
date: 2022-05-15 14:30:00
cover: /img/2022-05-15-2022-ckad-certification-epliogue/ckad-certificate-kihoon-han.jpg
thumbnail: /img/2022-05-15-2022-ckad-certification-epliogue/ckad-certificate-kihoon-han.jpg 
tags:
- kubernetes
- cncf
- linux foundation
- ckad
- certification
---

[작년에 CKA 를 취득](/2021/12/12/2021-cka-certification-epliogue/)한 이후에 한동안 미루고 미루다가 또 최근에 CKAD 를 취득했어요.

이번 글에서는 CKAD 자격증 준비 과정 및 후기에 대한 이야기를 하려고 해요.

대부분의 내용은 CKA 준비 후기에 적힌 글과 유사해요. 그래서 해당 글을 먼저 보고 오시는 것을 추천드려요.

<!-- more -->

## Overview

CKAD 는 글자 그대로 Certified Kubernetes Application Developer 에서 볼 수 있듯이, K8s cluster 를 이용하여 Application 을 운영하는 부분에 초점을 맞추고 있다고 생각해요.
- [이전 CKA 글](/2021/12/12/2021-cka-certification-epliogue/)에서도 비슷한 표현을 했어요
- 차이점이라면, CKA 는 Cluster 자체의 운영 및 관리에 초점을 맞춘다면 **CKAD 는 Cluster 를 사용하는 측면**에 초점을 맞추고 있어요.

CKAD 도 역시 자격증 취득이 목적이 아니더라도 해당 범위에 해당하는 내용을 공부하는 것으로 K8s 를 사용하는 데 필요한 지식을 학습할 수 있어서 좋았어요.

[이전 CKA 글](/2021/12/12/2021-cka-certification-epliogue/)에서는 시험에는 아래와 같은 내용이 나왔다고 적었어요.

> 시험에는 주로 아래와 같은 내용이 나왔어요. (구체적인 문제 내용은 적을 수 없어요)
> - Pod, Deployment 등 container 를 띄워보기
> - Network Policy 설정 (일종의 ACL 설정)
> - K8s cluster 설치하기
> - Pod troubleshooting
>   - e.g. 기동 자체가 안되는 상황을 해결
>   - e.g. 기동은 되나 기동하자마자 죽어버리는 문제를 해결
> - Cluster troubleshooting
>   - e.g. K8s Worker node 장애 상황 해결
>   - e.g. K8s control plane 장애 상황 해결
> - etc...

CKAD 에도 나오는 문제의 형태는 비슷한데, 아래와 같은 차이점이 있었어요.
- Cluster 의 운영 및 관리에 관한 문제는 나오지 않아요.
  - e.g. K8s Cluster 설치, Cluster troubleshooting 등
    - 다만, 주제에 따라 이 범위가 좀 모호한 내용들이 있어요. (e.g. "Network Policy" 같은 것)
- 대신, Application Developer 의 입장에서 필요한 내용들이 등장해요. (이 내용들은 CKA 에서는 나오지 않았어요)
  - e.g. Container Image build (`Dockerfile` 사용), Helm Chart

구체적인 "Exam details" 는 [이 링크](https://www.cncf.io/certification/ckad/)를 통해 들어가시면 확인할 수 있어요.

그리고 CKAD 시험도 마찬가지로 [아래의 CKA 글](/2021/12/12/2021-cka-certification-epliogue/)에서 이야기 드렸던 바와 같이 **사전에 준비된 Linux 환경에서 CLI 를 통해 진행**돼요.

> 그리고 이 시험은 (이미 알고 계시겠지만) 단순히 주어진 문제에 대해서 선택지를 고르거나 단답형/서술형으로 답을 적는 형식이 아니에요.
> - 시험은 **사전에 준비된 Linux 환경에서 CLI 를 통해 진행**돼요.
> - 문제의 지시에 따라 응시자는 위에서 언급한 예시와 같은 작업을 진행해야 해요.
> - Linux 환경에서 커맨드를 입력하며 진행하다 보니 특정 문제에서 잘못된 조작을 할 경우 해당 문제 뿐만 아니라 다른 문제들까지 영향을 미칠 수 있어요.
>   - (이 이야기는 밑에서 다시 할게요)

## 학습은 어떻게 했나요?

CKA 때와 마찬가지로 Udemy 의 강의를 들었어요.
- [\[Udemy\] Kubernetes Certified Application Developer (CKAD) with Tests](https://www.udemy.com/course/certified-kubernetes-application-developer/)

![Kubernetes Certified Application Developer (CKAD) with Tests](/img/2022-05-15-2022-ckad-certification-epliogue/de372a7a-f240-4167-a397-9f7bab31a0bd.png)

다만, CKA 와 겹치는 내용이 많아서 이미 알고 있던 내용들은 빠르게 넘겼어요. 그래서 실제로 강의 수강에 투자한 시간은 1주일도 안되긴 해요.

이 강의도 정가는 10만원 조금 안되는 가격으로 떠있는데, Chrome 시크릿 모드 등을 켜고 들어가면 1만원대로 할인된 가격에 결제를 할 수 있어요.
- 간혹 할인된 가격이 안뜨는 경우가 있는데, 몇번 다시 접속하다 보면 새로 뜨기도 해요.
- 할인된 가격이 계속 안뜬다면, 음... 화이팅(?!)

이 강의도 CKA 강의와 마찬가지로 [KodeKloud](https://kodekloud.com/) 라는 곳에서 CKA 시험 환경과 유사한 CLI 환경에서 연습문제를 풀 수 있는 쿠폰을 제공하고 있어요.

이번에도 강의에 딸려 있는 Practice Test 들을 1번씩 풀어봤어요.

## CKAD 시험 응시 신청하기

CKAD 시험 신청(및 비용 결제)은 [여기](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/) 링크를 통해 할 수 있어요.

2022년 5월 15일 기준 응시료는 "USD 375" 에요. (CKA 와 동일)
- 가끔 가다 뜨는 할인 코드를 입력하면 응시료 할인을 받을 수 있어요.
  - 저는 작년에 [CNCF Cyber Monday](https://www.google.com/search?q=cncf+cyber+monday&oq=cncf+cyber+monday&aqs=chrome..69i57j0i30l2.3993j0j1&sourceid=chrome&ie=UTF-8) 행사 때 50% 할인 쿠폰을 얻어다가 결제를 했어요.
  - 보통 블랙프라이데이 쯤에 뜨고, 올해도 1달 전쯤인가 50% 할인 쿠폰이 떴던 것으로 기억해요.

시험의 신청 및 주의사항은 Instruction 에 다 나와있고, CKA 때와 동일해요.

> 시험의 신청 및 주의사항은 Instruction 에 다 나와있는데요, 기억나는 것들을 적어보면 아래와 같아요.
> - 시험의 예약은 안내된 가이드라인을 통해서 하실 수 있는데, TimeZone 을 한국 시간 (UTC +09:00) 으로 설정해야 한국 시간 기준으로 응시 일정을 잡을 수 있어요.
> - 시험 예약 후 **취소는 응시 일정을 기준으로 24시간 전까지만 가능**해요.
>   - 예약 일정으로부터 남은 시간이 **24시간보다 적으면 취소가 불가능**해요.
>   - 이런 경우에 **응시를 하지 않을 경우 no-show 로 처리**돼요.
> - 시험은 2번의 기회가 주어지며, 첫 시도에서 불합격 시 1회의 무료 재시험을 볼 수 있는 형태에요. 단, 아래의 경우에는 무료 재시험을 볼 수 없어요.
>   - no-show 를 한 경우
>   - 부정행위 시도 및 적발된 경우
>   - 2번째 시험을 결제일로부터 1년 이내에 볼 수 없는 경우

## 시험 준비는 어떻게 했나요? (+ 시험 환경은 어떤가요?)

[이전 CKA 글](/2021/12/12/2021-cka-certification-epliogue/)의 **"시험 준비는 어떻게 했나요? (+ 시험 환경은 어떤가요?)"** 부분을 참고해 주세요.
- 저는 CKA 응시할 때 사용했던 북마크 목록을 그대로 사용했어요. (따로 CKAD 를 위한 내용을 북마크 추가하지 않았어요.)

그리고 이번엔 여유 시간이 별로 없어서 KodeKloud 의 mock exam 과 [killer.sh](https://killer.sh/) 에서 CKAD Simulator 는 1번씩만 풀어봤어요.

## 꿀팁 또는 주의사항이 있을까요?

이 역시 [이전 CKA 글](/2021/12/12/2021-cka-certification-epliogue/)의 **"꿀팁 또는 주의사항이 있을까요?"** 과 동일해요.

## 마치며

이 자격증 또한 꼭 자격증 취득이 아니더라도, Kubernetes 공부 측면으로도 좋다고 생각해요.

그리고 개인적인 소감으로는 CKA 보다 쉬웠어요.
- CKAD 응시의 경우 20분 정도 남겨놨을 때 더 이상 할게 아예 없어서 그냥 시험을 일찍 끝냈어요.
- 점수도 CKA 때보다 더 높게 나왔어요.

자격증을 준비하시는 분들께 이 글이 도움이 되길 바랄게요.

![CKAD Certificate - Kihoon Han](/img/2022-05-15-2022-ckad-certification-epliogue/ckad-certificate-kihoon-han.jpg)