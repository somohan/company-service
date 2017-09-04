require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/json'
require './config/environments'
require './models/company'

get '/company' do
  @companies = Company.all
  json @companies
end

get '/company/:id' do
  begin
    @company = Company.find(params['id'])
    json @company
  rescue ActiveRecord::RecordNotFound
    status 404
    json nil
  end
end

post '/company' do
  required_fields = %w(name cvr address city countryCode)
  required_fields.each {|field|
    unless params[field]
      status 400
      return json 'message' => "Required parameter #{field} is missing"
    end
  }
  company = Company.new
  company.name = params['name']
  company.cvr = params['cvr']
  company.address = params['address']
  company.city = params['city']
  company.countryCode = params['countryCode']
  company.phoneNumber = params['phoneNumber']
  company.save
  json 'message' => 'Company was created', 'id' => company.__id__
end

put '/company/:id' do
  error 500, 'Updates are not supported'
end

