# Cluster 다운로드
```
curl -o cluster.yaml 
```
<br>
<br>

# Node Group 추가
```
managedNodeGroups:
  - name: <노드그룹 이름>
    instanceName: <인스턴스 이름>
    instanceType: <인스턴스 타입>
    minSize: <최소 노드 수>
    maxSize: <최대 노드 수>
    desiredCapacity: <생성할 노드 수>
    privateNetworking: true
    
    subnets:
      - <서브넷 아이디>
      - <서브넷 아이디>
      - <서브넷 아이디>
      - <서브넷 아이디>
    
    iam:
      withAddonPolicies:
        imageBuilder: true
        autoScaler: true
        awsLoadBalancerController: true
        cloudWatch: true
    labels:
      <key>: <value>
```
<br>

Cluster 생성 & 삭제
```
eksctl create cluster -f cluster.yaml
```
```
eksctl delete cluster <클러스터 이름>
```
