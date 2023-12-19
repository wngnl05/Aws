# Public NodeGroup
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
      - <리전>a-pub
      - <리전>b-pub
    
    iam:
      withAddonPolicies:
        imageBuilder: true
        autoScaler: true
        awsLoadBalancerController: true
        cloudWatch: true
    labels:
      <key>: <value>
```

# Private NodeGroup
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
      - <리전>a-priv
      - <리전>b-priv
    
    iam:
      withAddonPolicies:
        imageBuilder: true
        autoScaler: true
        awsLoadBalancerController: true
        cloudWatch: true
    labels:
      <key>: <value>
```
