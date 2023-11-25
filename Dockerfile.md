### 다중 플랫폼 아티팩트를 빌드하는 방법
##### Docker CLI 플러그인 설치
```
docker buildx create --use
```
##### Buildx로 다중 플랫폼 이미지 빌드
```
docker buildx build --platform linux/amd64,linux/arm64 -t anti1346/jenkinsindocker:latest .
```
#### 빌드된 이미지 확인
```
docker images
```
#### 다중 플랫폼 이미지 정보 확인
```
docker inspect anti1346/jenkinsindocker:latest --format='{{.Architecture}}'
```
##### 도커 허브에 이미지 업로드 (PUSH)
```
docker push anti1346/jenkinsindocker:latest
```
##### 도커 허브에서 이미지 다운로드 (PULL)
```
docker pull anti1346/jenkinsindocker:latest
```
