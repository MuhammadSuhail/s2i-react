
FROM node
LABEL io.k8s.description="S2I to build a React application" \
      io.k8s.display-name="React builder" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      io.openshift.expose-services="8080:1337" \
      io.openshift.tags="JavaScript,React"


# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root
COPY ./s2i/bin/ /usr/libexec/s2i
#RUN apt-get update
#RUN apt-get install  nano -y
#RUN npm install npm@latest -g
RUN npm install -g create-react-app
#RUN npm install -g react-scripts
# This default user is created in the openshift/base-centos7 image
USER 1000

# TODO: Set the default port for applications built using this image
EXPOSE 1337
RUN mkdir /home/node/app
WORKDIR /home/node/app

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
