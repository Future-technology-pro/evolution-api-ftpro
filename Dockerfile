FROM node:20-alpine
RUN apk add --no-cache git python3 make g++
WORKDIR /app
RUN git clone --depth 1 https://github.com/EvolutionAPI/evolution-api.git . && npm install --omit=dev
ENV SERVER_PORT=8080
EXPOSE 8080
CMD ["npm", "run", "start:prod"]
