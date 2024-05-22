# Docker workshop steps

In this workshop we will take the app and secure-app images we created and see how we can improve the image security on the kubernetes level.

1. Set your kubectl context to target the docker desktop kubernetes instance, you can use this command `kubectl config set-context docker-desktop`
2. Make sure you are in the demo folder of this workship git repo.
3. Apply deployment.yaml to run regular image *app* on the local kubernetes cluster. you can use command `kubectl apply -f deployment.yaml` this will create 3 kubernetes resources: deployment, service and secret. 
4. Check to see that the pod is up and running `kubectl get pods -n default`

## Security contexts on the POD level.
5. Check to see under which user that pod is running `kubectl exe -it *PodName* -- id`
6. Now lets configure the deployment to prevent ccontainer from running as Root by removing the comment in the deployment.yaml under line 22.
7. If you check the describtion of the pod now using `kubectl describe pod *PodName*` you will see that the pod failed to start due to security issue.