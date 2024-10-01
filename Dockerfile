# Use an official Node.js image as a base
FROM node:18-alpine AS base

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (if you have it)
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Use a lightweight image for the production environment
FROM node:18-alpine AS production

# Set the working directory
WORKDIR /app

# Copy the built Next.js app from the previous stage
COPY --from=base /app ./

# Expose the port that your app will run on
EXPOSE 3000

# Set environment variables for production
ENV NODE_ENV=production

# Start the Next.js app
CMD ["npm", "start"]
