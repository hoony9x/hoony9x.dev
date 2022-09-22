---
title: R2DBC 와 Jasync SQL (MySQL) 사용 시 Long 에서 Integer 로 ClassCastException 발생하는 문제 해결하기
categories:
- R2DBC
date: 2022-09-22 14:00:00
cover: /img/2022-09-22-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/8a04bea1-4067-4e5c-b027-9e8e1eaf6088.png
thumbnail: /img/2022-09-22-fix-class-cast-exception-at-r2dbc-with-jasync-mysql/8a04bea1-4067-4e5c-b027-9e8e1eaf6088.png
tags:
- r2dbc
- spring-data-r2dbc
- jasync-sql
---

최근에 사내에서 신규 프로젝트를 진행하면서 Spring WebFlux + R2DBC 조합으로 구조를 잡고 있었어요.

DB 는 MySQL base 여서 드라이버로는 [`jasync-sql`](https://github.com/jasync-sql/jasync-sql) 를 사용했는데, 특정 동작 (`Delete`) 수행 시 내부에서 `ClassCastException` 이 계속 발생했어요.

이번 글에서는 원인이 무엇이었고 어떻게 해결했는지 이야기해보려고 해요.

<!-- more -->