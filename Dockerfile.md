### 다중 플랫폼 아티팩트를 빌드하는 방법
##### Docker CLI 플러그인 설치
```
docker buildx create --use
```
##### Buildx로 빌드
```
docker buildx build -t anti1346/jenkinsindocker:latest --platform linux/amd64,linux/arm64 .
```
#### 다중 플랫폼 이미지 확인
```
docker images
```
