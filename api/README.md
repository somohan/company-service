# Company service API

## Getting started
You can run the service using Docker: 

```
docker-compose up -d --build
docker-compose run --rm api bundle install
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
...or while developing `rerun ruby service.rb`. 
**rerun** needs to be installed first though. 
On Ubuntu this is done by running `sudo apt install rerun`.


## Testing the API

All methods can be tested from CLI, if you have curl installed.
The following examples assume that you have the API running at 
port 4567 locally (which will be the case, if you have started 
it locally using Docker).

### List companies
```
curl -i http://localhost:4567/company
```

### View company (with ID: 1)
```
curl -i http://localhost:4567/company/1
```

### Add company
```
curl -i -X POST http://localhost:4567/company \
-H 'Content-Type: application/json' \
-d '{"name":"test", "cvr": 12345678, "address": "Some address", "city": "Some city", "countryCode": "DK", "phoneNumber": "98989898"}'
```