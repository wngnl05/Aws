# Namespace
```
kubectl create namespace <네임스페이스 이름>
```
<br>

# Deployment.yaml
```
apiVersion: apps/v1
kind: Deployment

metadata:
  name: <deployment 이름>
  namespace: <namespace 이름>
  labels:
    <key> : <value>  # Deployment가 관리하는 Pod를 선택하기 위한 레이블
    
spec:
  replicas: <생성할 파드 수>
  selector:
    matchLabels:
      <key> : <value> # Deployment가 관리하는 Pod를 선택하기 위한 레이블
      
  template:
    metadata:
      labels:
        <Pod Key> : <Pod Value> # 각 Pod에 할당되는 레이블
        
    spec:
      nodeSelector:
        <Node key>: <Node Value>

      containers:
      - name: <컨테이너 이름>
        image: <Docekr 이미지 경로>
        ports:
        - containerPort: <애플리케이션 포트>

        resources:
          limits:
            cpu: 500m
          requests:
            cpu: 200m
```
<br><br>

# service.yaml
```
apiVersion: v1
kind: Service
metadata:
  name: <서비스 이름>
  namespace: <네임스페이스 이름>
spec:
  selector:
    <key>: <value>
  ports:
  - port: 80
    targetPort: <애플리케이션 포트>
    protocol: TCP
  type: NodePort
```
<br><br>

# ingress.yaml
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: <ingress 이름>
  namespace: <네임스페이스 이름>
  annotations:
    alb.ingress.kubernetes.io/load-balancer-name: <ALB 이름>
    alb.ingress.kubernetes.io/scheme: <>
    alb.ingress.kubernetes.io/subnets: <서브넷 아이디>, <서브넷 아이디>
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/healthcheck-path: <>

spec:
  ingressClassName: alb
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: <서비스 이름>
            port:
              number: 80
```
<br><br>

# Code
```
kubectl get deployment -A
```
```
kubectl get deployment -n <네임스페이스 이름>
```
```
kubectl describe deployment -n <네임스페이스 이름>
```
```
kubectl describe pod <파드 이름> -n <네임스페이스 이름>
```
