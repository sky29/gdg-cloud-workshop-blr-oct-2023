### Update Helm values.yaml (as per need)

### Helm Dependency Update

helm dependency build


### Helm Install (note: cert-manager has CRDs & CRDs won't get installed as part of upgrade command)

helm install cert-manager . -n cert-manager --create-namespace -f ./values.yaml 


### verify:

#### should show cert-manager related CRDs (like clusterissuer etc.)

kubectl get crds | grep cert 

#### all pods should be running and ready stage (1/1)

kubectl get pods -n cert-manager

#### verify cert-manager pod logs

kubectl logs `REPLACE-POD-NAME` -n cert-manager

