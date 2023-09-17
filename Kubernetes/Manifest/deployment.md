```
apiVersion: apps/v1
kind: Deployment

metadata:
  name: <deployment 이름>
  namespace: <namespace 이름>
  labels:
    <key> : <value>  
    
spec:
  replicas: <생성할 파드 수>
  selector:
    matchLabels:
      <key> : <value>
      
  template:
    metadata:
      labels:
        <key> : <value>
        
    spec:
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
