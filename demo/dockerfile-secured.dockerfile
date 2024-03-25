# Use an official Node.js runtime as the base image
FROM node:14 as builder

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Start a new, final stage to keep our image small and secure
FROM node:14-alpine

# Create a non-root user and give it ownership of the app directory
USER node

# Set the working directory
WORKDIR /app

# Copy the build output from the previous stage
COPY --chown=node:node --from=builder /app .

# Expose port 3000 for the application
EXPOSE 3000

# Define the command to run the application
CMD [ "node", "index.js" ]

# Build the docker image
# docker build -t app-secured --file dockerfile-secured .
# docker run -d -it -p 3000:3000 --rm app-secured
# docker scout quickview app-secured