# oidc 생성 명령어
```
eksctl utils associate-iam-oidc-provider --approve --cluster <클러스터 이름>
```
<br>
iam_policy.json
```
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Effect":"Allow",
          "Principal":{
             "Federated":"arn:aws:iam::<사용자 아이디>:oidc-provider/<OIDC URI>"
          },
          "Action":"sts:AssumeRoleWithWebIdentity",
          "Condition":{
             "StringEquals":{
                "<OIDC URI>:aud":"sts.amazonaws.com",
                "<OIDC URI>:sub":"system:serviceaccount:kube-system:aws-load-balancer-controller"
             }
          }
       }
    ]
 }
```

IAM 권한 생성
```
aws iam create-policy \
    --policy-name LoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```


정책 연결 [ 권한 추가 ]
```
AdministratorAccess
```
```
ElasticLoadBalancingFullAccess
```
