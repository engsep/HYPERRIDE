FROM nodered/node-red:latest
EXPOSE 1880
USER 0
COPY node-red/data/package*.json /data
COPY node-red/dist .
WORKDIR /data
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
COPY node-red/data/*.js* /data
WORKDIR /usr/src/node-red
COPY public /public
