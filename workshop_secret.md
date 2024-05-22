# Workshop - improving kubernetes secret usage


1. 
```bash
helm u upgrade --install akv2k8s spv-charts/akv2k8s \
      --namespace akv2k8s \
      --create-namespace \
      --set global.keyVaultAuth=environment \
      --set global.env.AZURE_TENANT_ID=e741d71c-c6b6-47b0-803c-0f3b32b07556 \
      --set global.env.AZURE_CLIENT_ID= \
      --set global.env.AZURE_CLIENT_SECRET=
```
2. `kubectl label namespace default azure-key-vault-env-injection=enabled`
