FROM node:20.12.2
WORKDIR /app

ENV NPM_CONFIG_CACHE=/tmp/.npm
ENV NODE_ENV=development

COPY app/package.json app/package-lock.json ./
RUN npm ci

ENV PATH="/app/node_modules/.bin:${PATH}" 
RUN npm install -g sequelize-cli

COPY app/. ./
EXPOSE 8080
CMD ["make", "dev"]