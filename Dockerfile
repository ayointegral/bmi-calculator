FROM node:16.18.1-alpine as nodeapp
RUN apk add --no-cache git
WORKDIR /app
COPY . .
# RUN npm install
# RUN npm run build
# # RUN npm prune --production
# CMD ["npm", "start"]
EXPOSE 3000

FROM nodeapp as nodeapp-dev
RUN apk update && apk upgrade && apk add --no-cache bash

FROM nodeapp-dev
RUN npm install