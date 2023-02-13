FROM node:16
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install
RUN echo "jenkins ALL=NOPASSWD:ALL">> /etc/sudoers
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
