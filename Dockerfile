FROM node:20.12.2
WORKDIR /app

ENV NPM_CONFIG_CACHE=/tmp/.npm
ENV NODE_ENV=development

COPY app/package.json package.json
COPY app/package-lock.json package-lock.json 
RUN npm ci

COPY app/. .
EXPOSE 8080
CMD ["make", "dev"]
