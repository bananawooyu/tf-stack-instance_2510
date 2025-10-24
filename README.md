# tf-stack-instance_2510

AWS EC2 인스턴스를 배포하는 Terraform Stack입니다.

## 개요

이 스택은 네트워크 스택에서 생성된 VPC, 서브넷, 보안 그룹을 참조하여 EC2 인스턴스를 배포합니다. Terraform Remote State를 통해 네트워크 스택의 출력값을 가져와 사용합니다.

## 구성 요소

### 컴포넌트
- **Remote State**: 네트워크 스택의 출력값을 가져오는 컴포넌트
- **Instance**: EC2 인스턴스를 생성하는 컴포넌트

### 생성되는 리소스
- EC2 인스턴스 (Ubuntu 24.04 LTS)
- 프라이빗 서브넷에 배포
- 네트워크 스택의 보안 그룹 및 키 페어 사용

## 의존성

이 스택은 다음 네트워크 스택에 의존합니다:
- [tf-stack-network_2510](https://github.com/bananawooyu/tf-stack-network_2510.git)

## 네트워크 스택 참조

Terraform Cloud의 Remote State를 통해 다음 값들을 참조합니다:
- VPC ID
- 프라이빗 서브넷 ID 목록
- 보안 그룹 ID 목록
- 키 페어 이름

## 배포 환경

- **Development**: 
  - 워크스페이스: `tf-stack-instance_2510-development`
  - 네트워크 참조: `tf-stack-network_2510-development`
- **Production**: 
  - 워크스페이스: `tf-stack-instance_2510-production`
  - 네트워크 참조: `tf-stack-network_2510-production`

## 인스턴스 설정

- **AMI**: Ubuntu 24.04 LTS (최신)
- **인스턴스 타입**: t2.micro (기본값)
- **서브넷당 인스턴스 수**: 1개 (기본값)
- **배치**: 프라이빗 서브넷

## 출력값

- `instance_ids`: 리전별 EC2 인스턴스 ID 목록
- `instance_private_dns`: 리전별 EC2 인스턴스 프라이빗 DNS 이름 목록

## 배포 순서

1. **네트워크 스택을 먼저 배포** (필수)
2. 이 인스턴스 스택 배포

## 사용법

```bash
# 초기화
terraform init

# 계획 확인
terraform plan

# 배포
terraform apply
```

## 태그

모든 리소스에는 다음 태그가 적용됩니다:
- `Stack`: tf-stack-instance_2510
- `Environment`: dev/prod (환경에 따라)
- `createdby`: jaehyeun.park
- `schedule`: workhour
- `name`: pjh-stack-test

## 연관 스택

- [tf-stack-network_2510](https://github.com/bananawooyu/tf-stack-network_2510.git): 이 스택이 참조하는 네트워크 스택