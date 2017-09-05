require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'logger'
require './config/environments'
require './models/company'

logger = Logger.new(STDOUT)

before do
  request.body.rewind
  body = request.body.read
  if body
    logger.debug body
    begin
      @request_payload = JSON.parse body
    rescue JSON::ParserError
      logger.debug 'Failed to parse JSON'
      # ignored
    end
  end
end

get '/company' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET'
  @companies = Company.all
  json @companies
end

get '/company/:id' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET'
  begin
    @company = Company.find(params['id'])
    json @company
  rescue ActiveRecord::RecordNotFound
    status 404
    json nil
  end
end

options '/company' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'POST'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
  halt 200
end

post '/company' do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'POST'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type'

  data = Hash.new
  fields = %w(name cvr address city countryCode phoneNumber)
  fields.each {|field|
    data.store(field, params[field] || @request_payload[field])
  }

  required_fields = %w(name cvr address city countryCode)
  required_fields.each {|field|
    unless data[field]
      status 400
      logger.debug "Required parameter #{field} is missing"
      return json 'message' => "Required parameter #{field} is missing"
    end
  }
  company = Company.new
  company.name = data['name']
  company.cvr = data['cvr']
  company.address = data['address']
  company.city = data['city']
  company.countryCode = data['countryCode']
  company.phoneNumber = data['phoneNumber']
  company.save
  json 'message' => 'Company was created', 'id' => company.__id__
end

put '/company/:id' do
  error 500, 'Updates are not supported'
end

