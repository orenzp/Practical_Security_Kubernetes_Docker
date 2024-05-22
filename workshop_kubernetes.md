# Docker workshop steps

In this workshop we will take the app and secure-app images we created and see how we can improve the image security on the kubernetes level.

1. Set your kubectl context to target the docker desktop kubernetes instance, you can use this command `kubectl config set-context docker-desktop`
2. Make sure you are in the demo folder of this workship git repo.
3. Apply deployment.yaml to run regular image *app* on the local kubernetes cluster. you can use command `kubectl apply -f deployment.yaml` this will create 3 kubernetes resources: deployment, service and secret. 
4. Check to see that the pod is up and running `kubectl get pods -n default`

## Security context on the POD level.
1. Check to see under which user that pod is running `kubectl exe -it *PodName* -- id`
2. Now lets configure the deployment to prevent ccontainer from running as Root by removing the comment in the deployment.yaml under line 22.
3. If you check the describtion of the pod now using `kubectl describe pod *PodName*` you will see that the pod failed with error "Error: container has runAsNonRoot and image will run as root"
4. Edit deployment.yaml and uncomment line 20 and 21, Replace "app" with "app-secured line 25 and save the changes
5. Apply the changes `kubectl apply -f deployment.yaml` and check to see that the pod is up and running.

## Security context on the Contianer level.
1. In deployment.yaml uncomment the lines 35, 36 and 37. Save and apply the changes `kubectl apply -f deployment.yaml`
2. Connect to the pod with `kubectl exe -it *PodName* -- id` and check to see if you can create a file or a folder on the container.