# Use a base image with a web server installed, for example, nginx
FROM nginx:alpine

# Copy the HTML files to the web server directory
COPY . /usr/share/nginx/html

# Expose port 8805
EXPOSE 8805

# Command to start the web server (nginx in this case) and listen on port 8805
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf", "-p", "/etc/nginx", "-g", "http.port=8805;"]
