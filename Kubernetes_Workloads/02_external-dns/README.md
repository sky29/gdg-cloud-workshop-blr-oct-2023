
### Create Cloudflare Credentails (API token) with appropriate permissions:

https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/cloudflare.md#creating-cloudflare-credentials


### Update Helm values.yaml (as per need)

### note if you see below error: 
Error: no repository definition for https://kubernetes.github.io/ingress-nginx. Please add the missing repos via 'helm repo add'
### then please delete 'Chart.lock' file

### Helm Dependency Update

helm dependency build


### Helm Upgrade (or Install)

helm upgrade -i external-dns . -n external-dns --create-namespace -f ./values.yaml


### Verify

#### below command should show ready status (1/1) for external-dns pods

kubectl get pods -n external-dns

#### check the logs of external-dns pod and ensure there are no dns connection (or credential) error

kubectl logs <REPLACE-POD-NAME> -n external-dns


#### ---------

#### Testing: run sample nginx and test external-dns against it

cd extra/samples

kubectl create ns nginx

# update domain in sample-nginx-service.yaml

kubectl apply -f sample-nginx-service.yaml -n nginx

##### wait for nginx pod running and kubernetes service (load balancer) ip get's populated, then check the logs of external-dns pod, you should see new dns entries in external-dns pod logs and also clouflare console

#### 3 records in cloudflare (with 2 TXT records): 
#### https://github.com/kubernetes-sigs/external-dns/issues/3167
#### https://github.com/kubernetes-sigs/external-dns/blob/master/docs/registry.md


kubectl logs <REPLACE-POD-NAME> -n external-dns

#### access the new dns in browser (wait for some time if it doesn't open)


#### cleanup sample nginx

kubectl delete -f sample-nginx-service.yaml -n nginx

kubectl delete ns nginx

#### clean the dns records manually in cloudflare console (if you used "policy: upsert-only" in values.yaml)