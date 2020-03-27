FROM node:12.13-alpine as dist
WORKDIR /tmp/
COPY package.json package-lock.json tsconfig.json tsconfig.build.json ./
COPY src/ src/
COPY scripts/ scripts/
RUN npm install
RUN npm run build

# -- finish building sources

FROM node:12.13-alpine as node_modules
WORKDIR /tmp/
COPY package.json package-lock.json ./
RUN npm install --production

# -- finish installing prod dependencies

FROM node:12.13-alpine
USER node
RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node --from=node_modules /tmp/node_modules ./node_modules
COPY --chown=node:node --from=dist /tmp/dist ./dist
COPY --chown=node:node package.json package-lock.json tsconfig.json ./
COPY --chown=node:node scripts/ ./scripts

RUN chmod 755 /home/node/app/scripts/start.sh

ENV NODE_ENV production
ENV RUN_MIGRATIONS true

EXPOSE 5000

ENTRYPOINT ["sh", "/home/node/app/scripts/start.sh"]