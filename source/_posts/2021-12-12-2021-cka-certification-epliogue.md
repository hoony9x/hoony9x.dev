---
title: 2021년 CKA 취득 후기
categories:
- Kubernetes
date: 2021-12-12 21:45:56
updated: 2022-07-23 23:25:55
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

> ## 2022년 7월 23일 내용 추가
>
> Linux Foundation 에서는 2022년 6월 25일을 기준으로 Test Platform 의 변경이 있었습니다.
>
> 이와 관련하여 자세한 내용은 아래 링크를 참고해 주시기 바랍니다.
> - https://training.linuxfoundation.org/bridge-migration-2021/
>
> 이제 시험 환경으로 전용 브라우저인 ["PSI Secure Browser"](https://tca.psiexams.com/portal/testdelivery/sb_rpnow_download.jsp) 를 사용한다고 합니다.
> - 여기서 중요한 변경 사항으로, **더 이상 "필요한 내용들을 미리 Chrome Bookmark 에 추가해두는 것" 을 할 수 없습니다.**
> - 위 링크의 내용에도 **"Use of personal bookmarks will no longer be permitted"** 라고 명시되어 있습니다.
> - 앞으로 CKA/CKAD/CKS 를 준비하실 경우 이 변경사항을 꼭 참고해 주세요.

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

## CKA 시험 응시 신청하기

CKA 시험 신청(및 비용 결제)은 [여기](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/) 링크를 통해 할 수 있어요.

![CKA 신청 페이지](/img/2021-12-12-2021-cka-certification-epliogue/8e6189e2-3dc9-4978-9465-44b50774382d.jpg)

2021년 12월 12일 기준 응시료는 "USD 375" 에요. (7월부터인가 USD 300 에서 인상되었다고 해요)
- 다만 할인 코드를 입력하면 응시료 할인을 받을 수 있어요.
  - 위 강의를 들으면 강의 내용 중에 (아마도 20% 정도) 할인을 받을 수 있는 코드를 얻을 수 있어요.
  - 그리고 아주 가끔 50% 할인을 받을 수 있는 코드가 뜨기도 해요. (보통 블랙프라이데이 쯤에 뜨고 그 이외 기간에도 가끔 떠요)
    - 저도 50% 할인 쿠폰이 떴을 때 잽싸게 결제했어요.

![CKA Order Confirmation](/img/2021-12-12-2021-cka-certification-epliogue/11994fb4-14e2-4b80-9c40-50c6fe418ae3.jpg)

![CKA Scheduling Instructions](/img/2021-12-12-2021-cka-certification-epliogue/02bc2679-4018-4aac-9b7a-ade0251da79c.jpg)

결제를 하면 이렇게 결제 확인 메일과 시험 응시 신청 안내 메일을 같이 받을 수 있어요.
- 이제 보니 결제는 9월 말에 했네요.

시험의 신청 및 주의사항은 Instruction 에 다 나와있는데요, 기억나는 것들을 적어보면 아래와 같아요.
- 시험의 예약은 안내된 가이드라인을 통해서 하실 수 있는데, TimeZone 을 한국 시간 (UTC +09:00) 으로 설정해야 한국 시간 기준으로 응시 일정을 잡을 수 있어요.
- 시험 예약 후 **취소는 응시 일정을 기준으로 24시간 전까지만 가능**해요.
  - 예약 일정으로부터 남은 시간이 **24시간보다 적으면 취소가 불가능**해요.
  - 이런 경우에 **응시를 하지 않을 경우 no-show 로 처리**돼요.
- 시험은 2번의 기회가 주어지며, 첫 시도에서 불합격 시 1회의 무료 재시험을 볼 수 있는 형태에요. 단, 아래의 경우에는 무료 재시험을 볼 수 없어요.
  - no-show 를 한 경우
  - 부정행위 시도 및 적발된 경우
  - 2번째 시험을 결제일로부터 1년 이내에 볼 수 없는 경우

이외의 것은 아래에서 따로 적을게요.

## 시험 준비는 어떻게 했나요? (+ 시험 환경은 어떤가요?)

우선 시험 환경에 대해서 이야기를 드릴게요.
- CKA 응시 중에는 시험 시스템 화면(문제와 Linux CLI 로 구성되어 있어요)과 1개의 추가 탭을 열 수 있어요. (즉, 총 2개의 탭)
  - 추가 탭에서는 아래 URL(및 해당 URL 의 하위 경로)에 해당하는 사이트만 접근이 가능해요.
    - https://kubernetes.io/docs
    - https://github.com/kubernetes
  - K8s docs 의 search 의 경우 검색 시도 시 해당 URL 에서 벗어나게 되는데요, 이 행위가 허용되는지 여부는 시험 시작 전 감독관에게 확인이 필요해요.
- 컴퓨터 1대만 사용이 가능하고, 응시를 하는 장소 (책상 등)에는 책 등 다른 것들이 있으면 안 돼요.
- 껌이나 먹을 것 등의 취식이 불가능하며, 물은 마실 수 있는데 반드시 투명한 액체여야 하고 투명한 페트병에 들어 있어야 해요.
  - 즉, 보리차나 이온음료 등 불투명 액체는 시험 중 마실 수 없어요.
- 응시 중에는 그 누구도 응시 장소(방 등)에 들어오면 안 돼요.
  - 만약 본인의 방이 누군가가 들어올 확률이 높다(e.g. 본가에서 있는데 갑자기 누군가가 들어온다던지)면 아예 스터디룸을 하나 빌리는 것을 추천해요.
- 시험 중 화장실을 갈 수는 있지만, 화장실에 가 있는 중에도 타이머는 계속 돌아가요.
- 시험 전 신분 확인 과정을 거치는데, **웬만하면 여권을 지참**하세요. 여권이 없을 경우 절차가 복잡해집니다.

위의 시험 환경 이야기 중에는 "시험 중 접근할 수 있는 사이트가 제한됨" 이란 이야기를 했어요.
- 즉, 구글링을 할 수 없고, 공식 사이트 내 docs 와 kubernetes github 페이지만 사용할 수 있어요.
- Docs 에 검색창이 있긴 한데, 개인적인 경험상 **매번 검색하면서 내용을 찾으면 시간이 부족할 수 있어요.**
  - 따라서, **필요한 내용들을 미리 Chrome Bookmark 에 추가해두는 것을 강력하게 추천**해드려요.
  - 저가 추가해뒀던 Bookmark 내용은 아래에 있어요.

> ### Kubernetes Docs
> - [bash auto-completion on Linux](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-linux/)
> - [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
> - [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/)
> - [Persistent Volume Claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)
> - [Installing Addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/)
> - [Pods](https://kubernetes.io/docs/concepts/workloads/pods/)
> - [Static Pods](https://kubernetes.io/docs/concepts/workloads/pods/#static-pods)
> - [Assigning Pods to Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)
> - [Taints and Tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)
> - [Service](https://kubernetes.io/docs/concepts/services-networking/service/)
> - [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
> - [Upgrading kubeadm clusters](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
> - [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
> - [Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
> - [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
> - [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
> - [Certificate Signing Requests](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#create-certificatesigningrequest)
> - [ETCD](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/)
> - [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
> - [Configure a Pod to Use a ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
> - [Declare Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
> - [JSONPath Support](https://kubernetes.io/docs/reference/kubectl/jsonpath/)
> - [Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)
> - [Configure Memory and CPU Quotas for a Namespace](https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/quota-memory-cpu-namespace/)
> - [Debug Running Pods](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/#ephemeral-container)
> - [Customizing DNS Service](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/)
> - [Use an HTTP Proxy to Access the Kubernetes API](https://kubernetes.io/docs/tasks/extend-kubernetes/http-proxy-access-api/)
> - [Debugging DNS Resolution](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)
> - [Logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
> - [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
> - [Define Environment Variables for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)
> - [Communicate Between Containers in the Same Pod Using a Shared Volume](https://kubernetes.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/)
> - [Network Plugins](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/)
> - [Auditing](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/)
> - [Application Introspection and Debugging](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/)
> - [Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
> - [kubelet](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/)
> - [Field Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/field-selectors/)
> - [Overview of kubectl](https://kubernetes.io/docs/reference/kubectl/overview/#custom-columns)
> - [Affinity and anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)
> - [Managing Secrets using kubectl](https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/)
> - [Kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)
> - [Managing Resources for Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
> - [Certificates](https://kubernetes.io/docs/tasks/administer-cluster/certificates/)
> - [Manage TLS Certificates in a Cluster](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/)
> - [Certificate Management with kubeadm](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/)
> - [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
> - [Labels and Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
> - [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
> - [kubeadm token](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-token/)
>
> ### Kubernetes GitHub Repositories
> - [Demonstrate how to use secure communication by juampynr](https://github.com/kubernetes/website/pull/26700/files)
> - [Add example to restore snapshot by juampynr](https://github.com/kubernetes/website/pull/26701/files)

시험 전에 저는 KodeKloud 의 mock exam 을 2번 반복했어요.

그리고 시험을 결제하면 [killer.sh](https://killer.sh/) 에서 CKA Simulator 를 사용해 볼 수 있어요.

![killer.sh 메인화면](/img/2021-12-12-2021-cka-certification-epliogue/a3344212-f0e8-49fe-af55-c41922b85202.jpg)

이 시뮬레이터의 경우 실제 CKA 에서 나올 수 있을 법한 문제들을 많이 담고 있어요.
- 실제 시험은 여기에 있는 문제 수보다는 적어요.
- 실제 시험은 시뮬레이터의 난이도보다 쉬워요.

전 이 시뮬레이터를 2회 반복해서 풀어봤어요.

이정도 준비하고 나서 일단 에라 모르겠다 하고 시험을 쳤고, 생각보다 무난하게 테스트를 통과하여 CKA 를 취득할 수 있었어요.
- 이 시험은 66점 이상을 받으면 통과에요. 너무 부담 가지지 않으셔도 돼요.

## 꿀팁 또는 주의사항이 있을까요?

시험 대부분의 과정은 yaml 파일을 작성하는 것이에요. 따라서 아무래도 yaml 을 빠르게 작성하는 것이 중요해요.
- 물론 처음부터 끝까지 직접 작성해야 하는 것은 아니에요.
- `kubectl run sample --image=nginx:latest --dry-run=client -o yaml > sample.yaml` 과 같은 커맨드로 yaml 의 틀을 생성할 수도 있고
- K8s 문서에 sample yaml 들이 있는 페이지들이 있는데, 이들을 미리 북마크에 등록해두고 시험 중에 해당 내용을 빠르게 가져온 후 필요한 부분만 바꿔서 사용하는 방법을 택하시면 돼요.

`kubectl` command 를 계속 사용하게 되는데, Imperative Commands 를 익혀 두시면 간단한 pod 생성 등은 yaml 작성할 필요 없이 빠르게 할 수 있어요.
- [Managing Kubernetes Objects Using Imperative Commands](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-command/)

실제 시험은 여러 개의 K8s cluster 들이 존재해요. (이는 `killer.sh` 시뮬레이터에서도 미리 체험할 수 있어요)
- 그래서 각 문제마다 `kubectl config use-context <context-name>` 과 같이 사용해야 할 context 가 명시되어 있어요.
- 반드시 각 문제를 풀 때 위의 커맨드를 실행해줘야 해요.
  - 이를 까먹고 그대로 문제를 풀 경우 엉뚱한 cluster 에 조작을 가하게 돼요.
  - 경우에 따라 멀쩡하게 풀었던 문제가 다 날아갈 수 있어요.
- [2021년 9월 기준 시험 환경 Cluster 정보](https://sysnet4admin.gitbook.io/k8s/certification/cka-ckad-cks)

그리고 `killer.sh` 에 나오는 문제들을 어떻게 해결하는지 잘 숙지해 두면 실제 시험에 많은 도움이 될 것이라고 생각해요.

## 마치며

CKA 자격증은 개인적으로 Kubernetes 에 관심을 가지면서 준비를 하게 되었는데요, 이를 통해서 Kubernetes 에 대한 이해가 조금은 더 늘어난 것 같아요.

꼭 자격증 취득이 아니더라도, Kubernetes 공부 측면으로도 좋다고 생각해요.

자격증을 준비하시는 분들께 이 글이 도움이 되길 바랄게요.

![CKA Certificate - Kihoon Han](/img/2021-12-12-2021-cka-certification-epliogue/cka-certificate-kihoon-han.jpg)