FROM node:14.17.5-alpine3.12 as builder

COPY package*.json ./
RUN npm config set unsafe-perm true
RUN npm install -g typescript
RUN npm install -g ts-node
#USER node
RUN npm install

COPY . .
RUN npm run build

EXPOSE 8081
CMD [ "npm", "run", "start" ]
#RUN npm run start