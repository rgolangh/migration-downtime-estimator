FROM registry.access.redhat.com/ubi9/nginx-124:latest
COPY index.html /opt/app-root/src/
CMD ["nginx", "-g", "daemon off;"]
