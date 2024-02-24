# Use a base image with a web server installed, for example, nginx
FROM nginx:alpine

# Copy the HTML files to the web server directory
COPY . /usr/share/nginx/html

# Command to start the web server (nginx in this case) and listen on the default port 80
CMD ["nginx", "-g", "daemon off;"]
