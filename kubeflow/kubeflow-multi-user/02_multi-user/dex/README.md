
kustomize build ./overlays/istio | kubectl apply -f -  

kubectl delete pod `REPLACE-POD-NAME` -n auth --force --grace-period=0