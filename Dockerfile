FROM node:18.12.0-alpine3.15
RUN apk add bash --no-cache
RUN apk add --update alpine-sdk
RUN apk update
WORKDIR /app
ADD . /app

COPY package*.json /app/
RUN npm install 
RUN npm run build
EXPOSE 3000
ENTRYPOINT [ "/bin/bash", "-c", "npm start" ]
