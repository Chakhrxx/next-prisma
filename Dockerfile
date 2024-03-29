# Use the official Node.js v19.x image as the base image
FROM node:19 as develop

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and pnpm-lock.yaml to the container
COPY package.json   ./
COPY pnpm-lock.yaml ./
COPY .  ./

# Install pnpm globally
RUN npm install -g pnpm

# Install project dependencies using pnpm
RUN pnpm install       

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the NextJS application
EXPOSE 3000  

# Start the application in development mode
CMD ["pnpm", "run", "start:dev"]