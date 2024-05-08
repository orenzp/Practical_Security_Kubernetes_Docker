# Docker workshop steps

1. Build the current dockerfile (so we can see the difference between before and after) `docker build -t app --file dockerfile .`
s
1. Run the app image in docker. Use `docker run -d -it -p 3000:3000 --rm --name app app`. This will run the docker image in the background.

2. Check to see your can access the application website via: [http](http://localhost:3000/)

3. Write down the size of the new image using `docker images app\*`

4. Scan new image with `docker scout quickview app` and write down the number of vulnerability's.

5. Create .dockerignore file based on your project development language - Hint you can use CoPilot.

6. Update dockerfile by adding multistage build. Use node:lts-slim as the base for the second stage.

7. Configure docker image to start by default as none-root (id 1000)

8. Run docker build to create secure image, `docker build -t app-secured --file dockerfile .`

9.  Check secure image size `docker images app\*` and compare with previous image

10. Scan new image with `docker scout quickview app-secured` and compare with previses image

11. Run the app-secure image in docker to check default user ID is not root. Use `docker run -d -it -p 3000:3000 --rm --name app-secured app-secured`. This will run the docker image in the background.

12. Check to see your can access the application website via: [http](http://localhost:3000/)