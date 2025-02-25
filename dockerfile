# Use Node.js 20 official lightweight image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Set environment variable to disable telemetry
ENV EXPO_NO_TELEMETRY=1

# Expose Metro Bundler and Expo ports
EXPOSE 8081 19000 19001 19002

# Start the Expo development server
CMD ["npx", "expo", "start", "--tunnel"]
