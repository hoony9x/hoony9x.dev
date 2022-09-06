---
title: M1 Mac 에서 Podman 으로 Container Image 빌드하기
categories:
- Container
date: 2022-07-21 22:30:00
cover: /img/2022-07-21-build-container-image-on-m1-mac-with-podman/podman.svg
thumbnail: /img/2022-07-21-build-container-image-on-m1-mac-with-podman/podman.svg
tags:
- container
- podman
---

이번 글에서는 M1 Mac 에서 Podman 으로 Container Image (Docker Image) 빌드에 관하여 이야기하려고 해요.

<!-- more -->

M1 Mac 이 출시된 이후로 압도적인 성능에 감탄하여 M1 으로 넘어가신 분들이 많이 있는 것으로 보여요.

다 좋은데, 이미지 빌드 및 실행과 관련하여 로컬(M1)에서 작업 시 몇 가지 문제가 있어요.
- M1 은 `arm64`, 일반적인 서버 환경은 `amd64` architecture 입니다.
  - AWS 나 GCP 에는 `arm64` 인스턴스가 있기는 하지만, 아직까지는 `amd64` 가 대부분이죠.
- 이로 인해서 이미지 빌드 및 푸시 시에 아래와 같은 문제가 발생할 수 있어요.
  - `arm64` architecture 가 아닌 Base Image 로 `Dockerfile` 을 이용하여 빌드 시 architecture 문제로 빌드 실패할 수 있어요.
    - `Dockerfile` 내 `RUN` command 존재 시 거의 실패한다고 생각하시면 편해요.
  - 혹시나 빌드가 성공하더라도, 빌드 완료된 이미지는 `arm64` architecture 에요.
    - 이 이미지는 Container Registry (e.g. Docker Hub) 로 푸시가 가능하지만, 서버 환경에서는 architecture 차이로 인해 실행이 안될 수 있어요.

따라서, 아래의 사항들을 준수해야 로컬(M1)에서 `amd64` 이미지를 문제 없이 빌드할 수 있어요.

아래의 내용들은 [Podman](https://podman.io/) 을 기준으로 작성되었어요.
- 저는 Docker Desktop 가 유료화가 된 이후 (개인은 여전히 무료이지만 회사에서는 쓰지 못하기에) 사용하지 않고 있어요.

## Step 1. Base Image Pull & Image Build 시 적절한 `platform` (Architecture) 지정하기.

일반적으로는 `Dockerfile` 을 이용한 빌드 시 아래와 같이 커맨드를 작성해요.

```
$ podman build -t <CONTAINER IMAGE REGISTRY>:<CONTAINER IMAGE TAG> <DOCKERFILE PATH>
```

하지만 위와 같이 입력 시 architecture 가 맞지 않아 Base Image 를 가져오는 단계에서부터 실패할 수 있어요.

이를 해결하기 위해 아래와 같이 직접 architecture 를 지정해 주면 돼요.

```
$ podman build --platform linux/amd64 -t <CONTAINER IMAGE REGISTRY>:<CONTAINER IMAGE TAG> <DOCKERFILE PATH>
```

`--platform linux/amd64` 를 추가한 것을 볼 수 있어요.
- 서버 환경은 linux 이기 때문에 요렇게 지정해야 해요. (혹시나 서버 환경이 linux 가 아니라면... 저는 모르겠어요.)

여기까지 하면 Base Image 를 가져오는 것은 잘 하고, 빌드도 잘 되는 듯 하지만 `RUN` 이 들어간 부분에서 실패할 것이에요.
- 아마도 `exec format error` 라는 에러 메시지를 보게 될 것이에요.

## Step 2. `amd64` instruction 이 실행될 수 있도록 설정하기

> Podman 에 있는 Podman Machine 을 사용한다는 가정 하에 작성했어요.

Linux 가 아닌 다른 플랫폼에서는 container 환경의 실행을 위해 일반적으로 VM 을 띄우게 돼요.
- Mac 도 마찬가지로 VM 을 띄우고 그 VM 에서 container 를 실행하는 형태에요.

그런데 이 VM 이 M1 Mac 에서는 `arm64` architecture 라서 `RUN` command 단계에서 에러가 발생해요.

다행히 해외의 어떤 용자 분께서 해결 방법을 제시해 주셨어요.
- [원글 보러가기](https://edofic.com/posts/2021-09-12-podman-m1-amd64/)

아래의 command 들을 순서대로 입력해 보세요.

```
>> podman machine ssh
$ sudo -i
# rpm-ostree install qemu-user-static
# systemctl reboot
```

그리고 다시 시도하면 아까 에러가 나던 부분에서 더 이상 에러가 발생하지 않는 것을 볼 수 있어요.
- Apple 의 Rosetta2 처럼 내부적으로 emulation 을 해서 `amd64` instruction 을 실행하는 것으로 보여요.

여기까지 하면 무사히 Container Image 를 빌드 완료하게 될 것이에요.

## 추가 정보

이렇게 빌드한 이미지는 대부분의 Container Image Registry 에 잘 푸시가 될 것이에요.

하지만, 간혹 Registry 에 따라 [OCI format](https://github.com/opencontainers/image-spec) 을 지원하지 않아 푸시가 되지 않을 수 있어요.

이 경우, 아래와 같이 `--format docker` 옵션을 추가해서 빌드를 하면 잘 될 거에요.

```
$ podman build --platform linux/amd64 --format docker -t <CONTAINER IMAGE REGISTRY>:<CONTAINER IMAGE TAG> <DOCKERFILE PATH>
```

## 마치며

가능하다면 Docker Desktop 을 사용하는 쪽이 속 편하긴 한데, 경우에 따라 저걸 사용하지 못하는 경우가 있어요.
- 회사 환경이라 돈을 주고 써야 하는데 회사에서 안사준다던지... (저는 그런 케이스는 아니에요)

위와 같은 상황에 처하신 분들께 이 글이 도움이 되었으면 좋겠어요.
