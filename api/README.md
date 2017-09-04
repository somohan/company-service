# Company service API

## Getting started
You can run the service using Docker: 

```
docker-compose up -d --build
docker-compose run --rm api rake db:migrate
```

...or you can go ahead and do it the hard way:

### Install dependencies
```
bundle install
```

### Install DB
```
rake db:migrate
```

### Run the API
```
ruby service.rb
```
