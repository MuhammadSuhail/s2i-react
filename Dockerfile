
# scala-server
FROM node:4



# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 1337

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
