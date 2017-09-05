FROM node:8.4-alpine
COPY ./ /usr/src/app
WORKDIR /usr/src/app
RUN npm install --dev \
  && npm build
EXPOSE 80
ENV API_ENDPOINT=https://company-service-api.herokuapp.com/
ENV NODE_ENV=production
ENV PORT=80
CMD ["npm", "start"]
