# Company service API

## Getting started
You can run the service using Docker: 

```
docker-compose up -d --build
docker-compose run --rm api rake db:migrate
```

...or you can go ahead and do it the hard way. 
This assumes that you are running a Debian- 
or Ubuntu based system with apt.

### Install dependencies
```
sudo apt-get install -y ruby-pg libpq-dev
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
