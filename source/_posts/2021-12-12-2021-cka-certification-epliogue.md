---
title: 2021년 CKA 취득 후기
categories:
- Kubernetes
date: 2021-12-12 21:45:56
cover: /img/2021-12-12-2021-cka-certification-epliogue/thumbnail.jpg
thumbnail: /img/2021-12-12-2021-cka-certification-epliogue/thumbnail.jpg
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
- Linux 환경에서 커맨드를 입력하며 진행하다 보니 특정 문제에서 잘못된 조작을 할 경우 해당 문제 뿐만 아니라 다른 문제들까지 영향을 미칠 수 있어요. (이 이야기는 밑에서 다시 할게요)
