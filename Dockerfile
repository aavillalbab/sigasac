FROM node:latest

# install pm2
RUN npm install pm2 -g

WORKDIR /opt/sigasac
COPY docker/pm2/ecosystem.config.js .

WORKDIR /opt/sigasac/db
COPY db .
RUN npm install && npm run build

WORKDIR /opt/sigasac/utils
COPY utils .
RUN npm install && npm run build

WORKDIR /opt/sigasac/main
COPY main .
RUN npm install && npm run build

WORKDIR /opt/sigasac/users
COPY users .
RUN npm install && npm run build

WORKDIR /opt/sigasac/configurations
COPY configurations .
RUN npm install && npm run build

WORKDIR /opt/sigasac/data
COPY data .
RUN npm install && npm run build

EXPOSE 3000 3001 3002 3003

CMD ["pm2-runtime", "/opt/sigasac/ecosystem.config.js"]

# docker build -t sigasac:v1.0.0 .
# docker run -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 -d sigasac:v1.0.0
