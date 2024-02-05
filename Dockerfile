# Stage 1: Build
# Use an official Node.js runtime as a parent image
FROM node:18-alpine as build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock if using Yarn)
COPY package*.json ./

# Install any dependencies
RUN npm install

# Copy the rest of your application's code
COPY . .

# Build your application
RUN npm run build

# Stage 2: Runtime
# Use an official Node.js runtime as a parent image for the runtime stage
FROM node:18-alpine as runtime

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock if using Yarn)
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy built assets from the build stage
COPY --from=build /usr/src/app/dist ./dist

# Your app binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD ["node", "dist/main"]
