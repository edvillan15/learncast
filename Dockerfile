FROM node:16-alpine
RUN npm install -g vite
RUN npm install -g pnpm
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
#RUN npm install -g @sveltejs/kit
#RUN mkdir /apps
WORKDIR /apps
#RUN git config --global --add safe.directory /srv/app
#USER node
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
COPY ./package.json ./pnpm-lock.yaml ./
ENV PATH /apps/node_modules/.bin:$PATH
RUN pnpm install
COPY ./ .
RUN pnpm run build
EXPOSE 5173
EXPOSE 4173
CMD ["pnpm", "preview"]