# company-service-ui

> UI for the company service API

## Getting started

For testing and production purposes, it is easier to run it in Docker:
`docker-compose up -d --build ui`

For development purposes, it is nice to have hot reloading. For 
that to work, we need to run it natively:

``` bash
npm install
npm build
npm run dev
```

## Build examples

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For detailed explanation on how things work, checkout the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).

## Deployment

We are deploying to Heroku using Docker.

1. Make sure that you have committed everything to GIT. 
2. You should probably also consider tagging it in GIT as well.
3. Build the Docker image:
`docker build -t company-service-ui ui`
4. Tag the image with the Heroku repository address:
`docker tag company-service-ui:latest registry.heroku.com/company-service-ui/web`
5. Push it to Heroku:
`docker push registry.heroku.com/company-service-ui/web`
