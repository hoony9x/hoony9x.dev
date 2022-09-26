---
title: R2DBC 와 Jasync SQL (MySQL) 사용 시 Long 에서 Integer 로 ClassCastException 발생하는 문제 해결하기
categories:
- R2DBC
date: 2022-09-26 14:00:00
cover: /img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/8a04bea1-4067-4e5c-b027-9e8e1eaf6088.png
thumbnail: /img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/8a04bea1-4067-4e5c-b027-9e8e1eaf6088.png
tags:
- r2dbc
- spring-data-r2dbc
- jasync-sql
---

최근에 Spring WebFlux 를 공부하면서 Spring WebFlux + R2DBC 조합으로 구조를 잡고 있었어요.

DB 는 MySQL base 여서 드라이버로는 [`jasync-sql`](https://github.com/jasync-sql/jasync-sql) 를 사용했는데, 특정 동작 (`Delete`) 수행 시 내부에서 `ClassCastException` 이 계속 발생했어요.

이번 글에서는 원인이 무엇이었고 어떻게 해결했는지 이야기해보려고 해요.

<!-- more -->

## 라이브러리 버전 정보
- `spring-boot-starter-data-r2dbc`: `2.7.3`
- `spring-boot-starter-webflux`: `2.7.3`
- `jasync-r2dbc-mysql`: `2.1.1`

![Gradle Dependencies](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/4b9db39f-029e-464f-9209-4db42da7ae25.png)

## 이 문제를 만나게 된 배경

Spring WebFlux + R2DBC 조합으로 간단한 Todo CRUD 코드를 작성하고 있었어요.

흔히 Spring 에서 하는 방식인 Controller -> Service -> DB (여기서는 Repository 이용) 구조로 작성을 하고 있었는데요,

```kotlin
@Service
class TodoService(
    private val todoRepository: TodoRepository
) {
    fun getAllTodos(): Flow<Todo> {
        return todoRepository.findAll().asFlow()
    }

    @Transactional
    suspend fun addTodo(title: String, content: String): Todo {
        val newTodo = Todo(
            title = title,
            content = content
        )

        return todoRepository.save(newTodo).awaitFirst()
    }

    @Transactional
    suspend fun deleteTodo(id: String) {
        todoRepository.deleteById(id).awaitFirstOrNull()
    }
}
```

문제는 `todoRepository.deleteById(id)` 에서 발생했어요.

아래 에러 메시지는 이 코드를 실행했을 때 나왔어요.

```
java.lang.ClassCastException: class java.lang.Long cannot be cast to class java.lang.Integer (java.lang.Long and java.lang.Integer are in module java.base of loader 'bootstrap')
	at java.base/java.util.stream.Collectors.lambda$summingInt$19(Collectors.java:681) ~[na:na]
	Suppressed: reactor.core.publisher.FluxOnAssembly$OnAssemblyException: 
Error has been observed at the following site(s):
	*__checkpoint ⇢ Handler dev.hoony9x.todo.TodoController#deleteTodo(String, Continuation) [DispatcherHandler]
	*__checkpoint ⇢ HTTP DELETE "/todo/343ca7d4-ae95-41a4-bdba-f4c3c85842ab" [ExceptionHandlingWebHandler]
Original Stack Trace:
		at java.base/java.util.stream.Collectors.lambda$summingInt$19(Collectors.java:681) ~[na:na]
		at reactor.core.publisher.MonoStreamCollector$StreamCollectorSubscriber.onNext(MonoStreamCollector.java:132) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxFlatMap$FlatMapMain.tryEmitScalar(FluxFlatMap.java:488) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxFlatMap$FlatMapMain.onNext(FluxFlatMap.java:421) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxMap$MapSubscriber.onNext(FluxMap.java:122) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxOnErrorResume$ResumeSubscriber.onNext(FluxOnErrorResume.java:79) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxMap$MapSubscriber.onNext(FluxMap.java:122) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxConcatMap$ConcatMapImmediate.innerNext(FluxConcatMap.java:282) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.FluxConcatMap$ConcatMapInner.onNext(FluxConcatMap.java:863) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.Operators$MonoSubscriber.complete(Operators.java:1816) ~[reactor-core-3.4.22.jar:3.4.22]
		at reactor.core.publisher.MonoCompletionStage.lambda$subscribe$0(MonoCompletionStage.java:83) ~[reactor-core-3.4.22.jar:3.4.22]
		at java.base/java.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture.java:863) ~[na:na]
		at java.base/java.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(CompletableFuture.java:841) ~[na:na]
		at java.base/java.util.concurrent.CompletableFuture.postComplete(CompletableFuture.java:510) ~[na:na]
		at java.base/java.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2147) ~[na:na]
		at com.github.jasync.sql.db.util.FutureUtilsKt.success(FutureUtils.kt:16) ~[jasync-pool-2.1.1.jar:na]
		at com.github.jasync.sql.db.mysql.MySQLConnection.succeedQueryPromise$lambda-12(MySQLConnection.kt:359) ~[jasync-mysql-2.1.1.jar:na]
		at java.base/java.util.Optional.ifPresent(Optional.java:178) ~[na:na]
		at com.github.jasync.sql.db.mysql.MySQLConnection.succeedQueryPromise(MySQLConnection.kt:358) ~[jasync-mysql-2.1.1.jar:na]
		at com.github.jasync.sql.db.mysql.MySQLConnection.onOk(MySQLConnection.kt:227) ~[jasync-mysql-2.1.1.jar:na]
		at com.github.jasync.sql.db.mysql.codec.MySQLConnectionHandler.channelRead0(MySQLConnectionHandler.kt:119) ~[jasync-mysql-2.1.1.jar:na]
		at io.netty.channel.SimpleChannelInboundHandler.channelRead(SimpleChannelInboundHandler.java:99) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:379) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:365) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.fireChannelRead(AbstractChannelHandlerContext.java:357) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.handler.codec.ByteToMessageDecoder.fireChannelRead(ByteToMessageDecoder.java:327) ~[netty-codec-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.handler.codec.ByteToMessageDecoder.channelRead(ByteToMessageDecoder.java:299) ~[netty-codec-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:379) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:365) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.fireChannelRead(AbstractChannelHandlerContext.java:357) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.DefaultChannelPipeline$HeadContext.channelRead(DefaultChannelPipeline.java:1410) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:379) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:365) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.DefaultChannelPipeline.fireChannelRead(DefaultChannelPipeline.java:919) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.nio.AbstractNioByteChannel$NioByteUnsafe.read(AbstractNioByteChannel.java:166) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.nio.NioEventLoop.processSelectedKey(NioEventLoop.java:722) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.nio.NioEventLoop.processSelectedKeysOptimized(NioEventLoop.java:658) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.nio.NioEventLoop.processSelectedKeys(NioEventLoop.java:584) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.channel.nio.NioEventLoop.run(NioEventLoop.java:496) ~[netty-transport-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.util.concurrent.SingleThreadEventExecutor$4.run(SingleThreadEventExecutor.java:997) ~[netty-common-4.1.79.Final.jar:4.1.79.Final]
		at io.netty.util.internal.ThreadExecutorMap$2.run(ThreadExecutorMap.java:74) ~[netty-common-4.1.79.Final.jar:4.1.79.Final]
		at java.base/java.lang.Thread.run(Thread.java:833) ~[na:na]
```

대략 보니 `java.base/java.util.stream.Collectors.lambda$summingInt$19(Collectors.java:681)` 가 눈에 띄네요. 그럼 한번 문제의 원인을 확인하러 가볼게요.

## 라이브러리 코드를 타고 들어가 볼게요.

![Collectors.java:681](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/275a2288-a70c-49c2-9a9b-4af5ce016d78.png)

음... 저것만 보고는 또 잘 모르겠어요. 사용처를 한번 볼게요.

![Usage of Collectors.java:681](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/df18a46c-efa6-48c6-8f98-de82c0d2afed.png)

3군데의 사용처가 나오는데, 디버깅을 해본 결과 (이 글에서는 생략했어요) 가장 아래에 있는 `DefaultDatabaseClient.java` 에서 사용이 되었어요.
- 저 코드는 `org.springframework:spring-r2dbc:5.3.22` 에 포함되어 있어요.
    - 패키지명까지 포함한 클래스명은 `org.springframework.r2dbc.core.DefaultDatabaseClient` 에요.

저 코드로 가볼게요.

![DefaultDatabaseClient.java:195](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/466edf08-f9a9-40c6-9612-f1f1653ea83b.png)

코드를 보면 194번째 라인의 `flatMap(Result::getRowsUpdated)` 의 결과를 받아서 `collect` 를 하는 것 같은데, `flatMap` 부분에서 넘어오는 값이 `Long` 타입인 것 같아요.

그럼 한번 `getRowsUpdated` 를 보러 가보도록 할게요.

![Result.java:43](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/564202b2-4d57-46f6-ba4a-9b87cb612fa9.png)

Interface 코드네요.
- `io.r2dbc:r2dbc-spi:0.9.1.RELEASE` 에 있어요.
    - 패키지명까지 포함한 클래스명은 `io.r2dbc.spi.Result` 에요.

얘를 실제로 구현한 코드가 뭔지를 볼게요.

![JasyncResult.kt:43](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/d12c9827-e820-45c3-bbcc-3b829b0b79f4.png)

`JasyncResult` 가 나오네요.
- 저 코드는 `com.github.jasync-sql:jasync-r2dbc-mysql:2.1.1` 에 포함되어 있어요.

그런데 뭔가 이상해요.
- `Result.getRowsUpdated()` 의 return type 은 `Publisher<Integer>` 이어야 하는데
- `JasyncResult.getRowsUpdated()` 의 return type 은 `Publisher<Long>` 이에요.

타입이 다른데 어떻게 저 라이브러리(`jasync-sql`)는 정상적으로 배포가 된 것일까요? 한번 저 라이브러리를 Clone 받아 볼게요.

![JasyncResult.kt in official repository](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/6ffe436f-30f5-4f38-afaa-30b960900941.png)

얘가 구현한 Interface method 를 찾아볼게요.

![Result.java used by jasync-sql](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/92c3bd47-f76d-4dcc-a15d-2f69bd04df8a.png)

오잉? 여기서는 return type 이 `Publisher<Long>` 으로 둘 다 일치해요.

그래서 저 부분이 언제 변경되었는지 확인을 해 봤어요.
- [해당 변경이 발생한 Commit](https://github.com/jasync-sql/jasync-sql/commit/3ee3abacfa4f19733ac7c994ad68423cf893d2d4#diff-1f5bd413a672564aa12439a09952600d8350d6ee95abbcfb6f6ca1362c411762)
- R2DBC 1.0.0 으로 버전업을 하면서 같이 변경이 되었네요.
- 그래서 다시 확인을 해 봤더니 `io.r2dbc:r2dbc-spi` 의 버전이 변경되면서 return type 도 변경된 것 같아요.

그래서 강제로 `io.r2dbc:r2dbc-spi:1.0.0.RELEASE` 버전을 지정하고 다시 시도해 봤어요. 하지만 똑같은 곳에서 오류가 발생하고 있었어요.

그래서 또 코드를 열어 봤어요.

![DefaultDatabaseClient.java:195](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/a5f4a7ee-16ab-4ee5-91a5-0e2114c91a1b.png)

아까와는 달리 빨간줄이 그어져 있어요. 확인해 보니 `Result.java` 와 `JasyncResult.kt` 의 `getRowsUpdated()` return type 은 일치했지만 아직도 `summingInt` 를 시도하고 있네요.

그래서 이번에는 Spring 코드를 확인해 봤어요.
- [2022년 9월 25일 기준 최신 Commit 에 있는 DefaultDatabaseClient.java 코드](https://github.com/spring-projects/spring-framework/blob/f31eb2dcf9f03148907ea49c209144753c96573a/spring-r2dbc/src/main/java/org/springframework/r2dbc/core/DefaultDatabaseClient.java)
- [문제의 method](https://github.com/spring-projects/spring-framework/blob/f31eb2dcf9f03148907ea49c209144753c96573a/spring-r2dbc/src/main/java/org/springframework/r2dbc/core/DefaultDatabaseClient.java#L194-L200)

어라? 여기는 `summingLong` 을 하고 있어요.
- 그래서 라이브러리를 전부 다 최신 버전으로 업데이트를 한 후 다시 실험을 해 봤어요. (실험 과정은 생략)
- 그런데 또 똑같은 오류가 발생하네요.

글 작성 시점을 기준으로 정식 릴리즈의 최신 버전은 `5.3.23` 이에요. 코드를 보러 가볼게요.
- https://github.com/spring-projects/spring-framework/tree/5.3.x
- [문제의 method](https://github.com/spring-projects/spring-framework/blob/5.3.x/spring-r2dbc/src/main/java/org/springframework/r2dbc/core/DefaultDatabaseClient.java#L191-L196)

![DefaultDatabaseClient.java:195](/img/2022-09-26-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/921ec088-ea6a-4b1d-aae7-df900945a597.png)

네... 정식 릴리즈에 반영이 안되었네요.
- `master` branch 에는 이미 merge 되어 있지만 이 반영 내용은 언제 릴리즈가 될까요?

## 그래서 해결은 어떻게 했나요?

결과적으로 해결 방법은 다소 허무하기도 한데요, 위에서 언급했던 "`matster` branch 에는 반영되었으나 릴리즈에 미반영된 내용" 이 적용된 pre-release 버전을 가져와서 해결했어요.

Gradle 기준으로 아래와 같은 내용 적용이 필요해요.
- maven repository 로 `https://repo.spring.io/snapshot` 을 추가.
- 그리고 `org.springframework:spring-r2dbc:6.0.0-SNAPSHOT` 를 dependencies 에 추가.

대략 `build.gradle.kts` 에 아래와 같이 추가하면 돼요.

```kotlin
repositories {
    maven(url = "https://repo.spring.io/snapshot")
}

dependencies {
    implementation("org.springframework:spring-r2dbc:6.0.0-SNAPSHOT")
}
```

여기까지 적용하고 나면 드디어 `ClassCastException` 은 사라지게 될 것이에요.

## 마치며

이 이슈는 최근 들어 발생한 것인지 구글링을 해봐도 원하는 내용이 잘 나오지가 않았어요.

혹시나 R2DBC 와 jasync-sql 을 사용하시는 분들이 있고 본 Issue 를 겪고 있다면 도움이 되길 바랄게요.