# Deployment란 ?
코드 배포를 세밀하게 제어할 수 있는 object입니다. pod 복제, 배포 일시중지, 재개 및 롤백이 가능하도록 도와줍니다.
<br>

# deployment.yaml 파일을 이용해서 deployment를 생성하는 코드
```
kubectl apply -f deployment.yaml
```
<br>

# deployment 이름을 이용해서 deployment를 삭제하는 코드
```
kubectl delete deployment <deployment 이름> -n <네임스페이스 이름>
```
<br>
 
# 특정 네임스페이스에 있는 deployment 출력하기
```
kubectl get deployment -n <네임스페이스 이름>
```
<br>
 
# 모든 deployment 출력하기
```
kubectl get deployment -A
```
