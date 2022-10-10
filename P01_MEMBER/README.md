# :four_leaf_clover: 회원관리 시스템 제작 보고서 제출
## WD2A 4조 4OREVER
![AI가 만든 팀의 아이콘](4orever.png)
## :clipboard: 개발환경
* 
* 
* 
* 
* 

## 📢: 소개
### 
#### Spring boot
* JAVA 8
* Spring MVC
* Spring Boot Security
* Spring Boot Actuator
* Spring Data JPA
* Spring Boot Batch
* Spring AOP
* spring cloud stream

#### Build tool
* Gradle

#### Database
* Mysql
* Redis

#### AWS
* EC2
* S3

#### Message Queue
* Kafka

#### CI
* Travis CI

### 프론트엔드
* Javascript
* Thymeleaf
* jQuery

## :clipboard: 주요 키워드
* REST API
* 시큐리티
* 배치
* 스케줄링
* HTTP 통신
* JPA
* 페이징
* 트랜잭션
* 예외처리
* Git 버전관리
* AWS EC2 배포
* Message Queue
* Event Driven Architecture

## :clipboard: 성능 테스팅 도구
* K6
* Grafana
* InfluxDB

## :clipboard: 로그 분석 도구
* ELK Stack
  * Elasticsearch, Logstash, Kibana, Filebeats

## :factory: 시스템 구조
<img src="https://user-images.githubusercontent.com/40568894/136735965-4b807c84-02b4-4410-8bb1-771840a04102.jpeg" width="80%" height="80%">

## :link: API 서버 (Producer)
* [API 서버](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/api-server) 

## :link: order 서버 (Consumer)
* [order 서버](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/order-server)

## :link: product-purchase-count 서버 (Consumer)
* [product-purchase-count 서버](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/product-purchase-count-server) 

## :link: mail 서버 (Consumer)
* [mail 서버](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/mail-server)

## :link: product-purchase-count-batch 서버
* [product-purchase-count-batch 서버](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/product-purchase-count-batch)

## :link: redis-update-batch 서버
* [redis-update-batch 서버](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/batch-server)

## :link: 공통 모듈
* app 공통 모듈
  * [app 공통 모듈](https://github.com/didrlgus/springboot-shoppingmall/tree/master/app/common)

* lib 공통 모듈
  * [redis 공통 모듈](https://github.com/didrlgus/springboot-shoppingmall/tree/master/lib/redis)
  * [kafka 공통 모듈](https://github.com/didrlgus/springboot-shoppingmall/tree/master/lib/kafka)

## :link: redis update 권한 서버
* [redis update 권한 서버 Repository](https://github.com/didrlgus/redis-update-server)

## :link: Trouble Shooting
* [trouble shooting 기록](https://github.com/didrlgus/springboot-shoppingmall/issues?q=is%3Aissue+is%3Aopen+label%3Atroubleshooting)

## :link: 성능 테스트
* [초기 성능 테스트 결과](https://github.com/didrlgus/springboot-shoppingmall/issues/5)
* [메인화면 API 캐시 적용 전, 후 성능 테스트 비교 결과](https://github.com/didrlgus/springboot-shoppingmall/issues/21)
* [서버를 2대 돌리면 얼마나 더 많은 트래픽을 감당할 수 있을까?](https://github.com/didrlgus/springboot-shoppingmall/issues/46)

## :link: ERD 설계
* [shopping mall ERD](https://github.com/didrlgus/springboot-shoppingmall/issues/1)

## :link: Rest API 문서
* [shopping mall API 문서](https://github.com/didrlgus/springboot-shoppingmall/issues/58)


---------------------------------------------------------------------------------------------------------------------------------------------
## :pushpin: 방법

## :pushpin: commit 규칙

## :pushpin: Coding Conventions

### 변수, 함수, 인스턴스
변수, 함수, 인스턴스를 작성할 때는 소문자로 시작하는 camelCase `카멜 케이스`를 사용합니다.
```
ex) int camelCase = 0;
```

### 함수명 작성
함수명을 작성할 때는 동사 + 명사 형태로 구성합니다.
```
ex) getUserInformation()
```

### Class, Constructor, Package
Class, Constructor, Package를 작성할 때는 Pascal Case`=upper 카멜 케이스`를 사용합니다.
```
ex) CamelCase
```

### 주석 규칙
한줄은 //로 적고, 그 이상은 /** */로 주석을 작성합니다.
```
// 한 줄 주석일 때
/**
* 여러 줄
* 주석일 때
*/
```

### 함수에 대한 주석
함수의 전체 기능에 대한 설명과 함수의 파라미터에 대한 설명을 적어줍니다.
```
/**
* @param {Int} x
* @param {String} y
* @param {Boolean} z
* @return N
*/
```

<br>
👑🧔🏻‍♀️[인성] 
👧🏻[유진] 
👦🏻[정수]
👨🏻‍🦱[태권]
🧒🏻[규태]
🧑🏻[성혁]
