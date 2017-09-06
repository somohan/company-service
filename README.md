# company-service

## Getting started
You can get this entire project running locally by issuing the following commands:

``` bash
docker-compose build
docker-compose run --rm api bundle install
docker-compose run --rm api rake db:migrate
docker-compose up -d
```

Look into the api and ui folder for more detailed information about each of those projects.

**UI project has been deployed to:**
https://company-service-ui.herokuapp.com/

**API project has been deployed to:**
https://company-service-api.herokuapp.com/
