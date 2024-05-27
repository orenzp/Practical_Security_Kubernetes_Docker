# Workshop - Deploy and configure AKV2K8S

In this workshop we will install AKV2K8S and configure AKV2K8S to create kubernetes secret as well as inject a key vault secret using AKV2K8S demo application.

## Install and configure AKV2K8S

1. Add AKV2K8S Helm repository to your local computer

```bash
helm repo add spv-charts https://charts.spvapi.no
helm repo update
```

2. Install AKV2K8S helm chart to its dedicate namespace, make sure to replace the Tenant, Client ID and Secret

```bash
helm upgrade --install akv2k8s spv-charts/akv2k8s \
      --namespace akv2k8s \
      --create-namespace \
      --set global.keyVaultAuth=environment \
      --set global.env.AZURE_TENANT_ID=<GetTenantIDFromTeamChat> \
      --set global.env.AZURE_CLIENT_ID=<GetClientIDFromTeamChat> \
      --set global.env.AZURE_CLIENT_SECRET=<GetSecretFromTeamChat>
```

3. Add a kubernetes label to default namespace to enable secret inject feature `kubectl label namespace default azure-key-vault-env-injection=enabled`. This is step is require to any namespace that will require Env-Inject.

## Configure AKV2K8S secret retrival

1. Change directory to the akv2k8s folder
2. Apply manifest akvs-secret-sync.yaml to create a kubernetes secret directly from Azure Key Vault. Run `kubectl apply -f akvs-secret-sync.yaml`
3. Check to see if the secret name 'my-secret-from-akv' was created. `kubectl get secret`
4. Retrieve secret BASE64 value to decod the secret. `kubectl get secret my-secret-from-akv -o jsonpath="{.data.secret-value}" | base64 --decode`
NOTE: akv2k8s will sync updated objects from keyvault every 30 minutes to update then

## Configure AKV2K8S secret injects

1. Apply manifest akvs-secret-inject.yaml to create a secret for injection. `kubectl apply -f akvs-secret-inject.yaml`
2. Appply manifest secret-deployment.yaml to create a deployment that will pull the secret directly to the application. `kubectl apply -f secret-deployment.yaml`
3. Retrieve the logs from the pod created in previous step `kubectl logs -n default akvs-secret-app-Random-Number` and you should see the value of the secret.
   