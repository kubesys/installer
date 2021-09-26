kubectl apply -f exportor.yaml
kubectl apply -f grafana-dashboards-configmaps.yaml
kubectl apply -f grafana-datasources-configmaps.yaml
kubectl apply -f grafana.yaml
kubectl apply -f loki.yaml
kubectl apply -f prometheus.yaml
