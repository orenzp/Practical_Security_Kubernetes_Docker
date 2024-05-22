# Docker workshop steps

In this workshop we will go over the steps on how to improve the security of a simple docker file

As well as minimizing the size of the docker image we created.

1. Build the current dockerfile (so we can see the difference between before and after) 
   `docker build -t app --file dockerfile .`

2. Run the app image in docker. Use `docker run -d -it -p 3000:3000 --rm --name app app`. This will run the docker image in the background so we can connect to it.

3. Check to see your can access the application website via: [http](http://localhost:3000/)

4. Write down the size of the new image using command `docker images app\*`. ( You can use docker desktop dashboard to get the image size as well)

5. Run the following command to see under which user the docker image is running under.
   `docker exec -it app ids`

6. Scan new image with `docker scout quickview app` and write down the number of vulnerability's. Write down the name of image tag showed in the *"Updated base image"* of the scout quickview output.

7. Create .dockerignore file based on your project development language - Hint you can use CoPilot.

8. Update dockerfile by adding multistage build. Use the tag that was showen in the *"Updated base image"* for docker scount.

9. Configure docker image to start by default as none-root. NodeJS images come with a built in "node" user with the id of 1000.

10. Run docker build to create secure image, `docker build -t app-secured --file dockerfile .`

11. Check secure image size `docker images app\*` and compare with previous app image

12. Scan new image with `docker scout quickview app-secured` and compare with previous app image.

13. Run the app-secure image in docker to check default user ID is not root. Use `docker run -d -it -p 3000:3000 --rm --name app-secured app-secured`. This will run the docker image in the background.

14. Check to see your can access the application website via: [http](http://localhost:3000/)
15. Cleanup docker by running command `docker stop app`