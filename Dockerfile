FROM node:20-alpine
RUN apk add --no-cache git python3 make g++
WORKDIR /app
ENV NODE_OPTIONS="--max-old-space-size=512"
ENV SERVER_PORT=8080
RUN git clone --depth 1 https://github.com/EvolutionAPI/evolution-api.git . \
  && npm install --omit=dev --no-audit --no-fund \
  && npm install --no-save esbuild@0.25.12
EXPOSE 8080
CMD ["npm", "run", "start:prod"]
