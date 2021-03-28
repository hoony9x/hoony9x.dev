---
title: 2020 M1 MacBook Pro 리뷰 - SW 호환성 
categories:
- Electronic Device
date: 2021-03-28 18:13:58
updated: 2021-03-28 21:10:31
cover: /img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/Apple_new-m1-chip-graphic_11102020_big.jpg.large_2x.jpg
thumbnail: /img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/Apple_new-m1-chip-graphic_11102020_big.jpg.large_2x.jpg
tags:
- apple
- macbook
- m1
---

이 글에서는 M1 맥을 사용하면서 확인한 개발 관련 SW 호환성 문제애 대해서 이야기하려고 해요.

간단하게 적으려고 하며, 자세한 내용은 적지 않았어요.

시간이 될 때마다 호환성 해결 여부를 확인해서 본 포스트에 업데이트하려고 해요.

<!-- more -->

> Image Thumbnail 출처: [Apple Korea 보도자료 "Apple, M1칩을 공개하다"](https://www.apple.com/kr/newsroom/2020/11/apple-unleashes-m1/)

<hr/>

## 2021년 3월 28일 기준

### Web browsers - Chrome, Firefox, MS Edge, Safari

Safari 는 애플이 만든 것이니 당연히(?) M1 native 환경으로 잘 돌아가요.

나머지 3개 브라우저도 현재 M1 native 환경으로 잘 돌아가네요.

![Chrome Version](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/chrome_version.jpg)

### JDK

현재는 [Azul Systems 에서 만든 OpenJDK](https://www.azul.com/downloads/zulu-community/?package=jdk) 가 M1 (`arm64`) 을 지원하고 있어요.

다른 JDK 는 `amd64` 만 지원하고 있어서 설치 시 Rosetta2 를 이용하여 실행되게 됩니다.

![JDK 16](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/jdk16.jpg)

![JDK 15](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/jdk15.jpg)

![JDK 11](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/jdk11.jpg)

![JDK 8](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/jdk8.jpg)

![JDK 목록](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/jdk_list.png)

Homebrew 사용자분들은 `brew search zulu` 로 설치 가능한 zulu jdk 를 확인할 수 있어요.

### Docker Desktop

Docker Desktop 의 정식 버전은 아직 실행할 수 없으며, 실행 시도 시 아래와 같은 오류 메세지와 함께 종료됩니다.

![Docker Desktop 실행 불가 화면](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/docker_original_unable_to_launch.png)

실행할 수 있는 방법이 아예 없는 것은 아닌데요, [Apple Silicon Tech Preview](https://docs.docker.com/docker-for-mac/apple-m1/) 를 설치하시면 실행 가능합니다.

지금은 RC 2 버전까지 나와있는데요, 곧 M1 에서 사용 가능한 정식 버전이 나오려나 봐요.
- 아직까지 몇 가지 문제가 남아 있는 것으로 보여요.
- 해당 문제들은 "Known issues" 부분을 보시면 됩니다.

`docker version` 입력 시 다음과 같이 나오게 됩니다.

![Docker Version Command](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/docker_version_cmd.jpg)

### IntelliJ IDEA 등 JetBrains 사의 IDE 제품들

현재 IntelliJ IDEA 는 M1 을 정식 지원하고 있어요.

![IntelliJ IDEA 정보](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/intellij_idea_about.png)

"Runtime Version" 부분에 맨 끝을 보면 `aarch64` 라고 표기된 것을 볼 수 있어요.

다른 제품은 확인해보지는 않았는데, 아마 다 M1 을 정식 지원하지 않을까 생각하고 있어요.


### Homebrew

[공식 홈페이지의 설치 가이드](https://brew.sh/index_ko) 를 따라 설치하면 잘 설치 됩니다.

다만, Intel Mac 과는 다르게 `/opt/homebrew` 경로에 설치가 되게 됩니다.

### RAM 사용량에 따른 SWAP 사용량

확실히 Intel Mac 에 비해서 SWAP 을 공격적으로 사용하는 느낌이 들어요.

RAM 을 많이 사용하는 것을 한번 띄워봤는데요, 아래와 같이 SWAP 사용량이 확 느는 것을 볼 수 있었어요.

![SWAP usage 1](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/swap_usage_1.jpg)

![SWAP usage 2](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/swap_usage_2.jpg)

<hr/>

## 기타사항

M1 Mac 에서 돌아가는 App 이 native 로 돌아가는지 rosetta2 를 이용하여 돌아가는지 확인할 수 있어요.

![Activity Monitor](/img/2021-03-28-2020-m1-macbook-pro-review-sw-compatibility/top_status.png)

위와 같이 "활성 상태 보기" (영어 설정에서는 "activity monitor") 를 통해 볼 수 있어요.
- "아키텍쳐" 부분이 Intel 이면 rosetta2 로 실행 중인 것이며, Apple 이면 native 로 실행 중인 것입니다.

글은 여기서 마치려고 해요. 추가할 내용이 있을 때마다 여기에 추가하려고 합니다.