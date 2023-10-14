### verify values.yaml (modify it - as per need)

### Helm Dependency Update
helm dependency build

### note if you see below error: 
Error: no repository definition for https://kubernetes.github.io/ingress-nginx. Please add the missing repos via 'helm repo add'
### then please delete 'Chart.lock' file

### Helm Upgrade (or Install)
helm upgrade -i ingress-nginx . -n ingress-nginx --create-namespace -f ./values.yaml

### Verify 
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx

### Verify in browser (this should give nginx 404 index page)
http://REPLACE-SVC-IP:80
https://REPLACE-SVC-IP:443