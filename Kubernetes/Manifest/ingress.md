## ingress.yaml 파일을 이용해서 deployment를 생성하는 코드
```
kubectl apply -f deployment.yaml
```
<br>

## ingress 이름을 이용해서 deployment를 삭제하는 코드
```
kubectl delete deployment <deployment 이름> -n <네임스페이스 이름>
```
<br>
 
## 특정 네임스페이스에 있는 ingress 출력하기
```
kubectl get deployment -n <네임스페이스 이름>
```
<br>
 
## 모든 ingress 출력하기
```
kubectl get deployment -A
```
