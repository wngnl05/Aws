# Albcontroller를 생성하기전에
Alb를 생성할려면 서브넷에 태그를 추가해줘야 합니다.
퍼블릭 서브넷   // value는 1로 지정
```
kubernetes.io/role/elb
```
프라이빗 서브넷   // value는 1로 지정
```
kubernetes.io/role/internal-elb
```
<br><br>

# oidc 생성 명령어
```
eksctl utils associate-iam-oidc-provider --approve --cluster <클러스터 이름>
```
<br>

# Loadbalancer-policy.md에서 정책을 생성해주세요.
<br>
<br>

# service-account.yaml을 다운로드 해줍니다.
```
curl -o service-account.yaml https://raw.githubusercontent.com/jinhyeokhyeok/Aws/main/Kubernetes/Alb_controller/service-account.yaml
```
```
kubectl apply -f service-account.yaml
```
<br>

# Helm 설치 스크립트를 다운로드하고 실행 권한을 부여합니다.
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh
# Helm 리포지토리를 추가하고 업데이트합니다.
helm repo add eks https://aws.github.io/eks-charts
helm repo update
```
<br>

# AWS Load Balancer Controller를 지정한 네임스페이스에 설치합니다.
```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=<클러스터 이름> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller
```
<br><br><br>

# AwsloadbalncerConrtroller 설치되었는지 확인하는 방법
```
kubectl get pods -n kube-system | grep aws-load-balancer-controller
```
```
helm list -n kube-system
```
```
kubectl get events -n kube-system | grep aws-load-balancer-controller
```
<br>

# Alb-controller를 삭제하는 방법
```
helm uninstall aws-load-balancer-controller -n kube-system
```
