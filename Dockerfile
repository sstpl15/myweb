# Use a lightweight base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the HTML, CSS, and any other assets to the container
COPY . .

# Expose port 80 to allow external access
EXPOSE 80

# Command to start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
