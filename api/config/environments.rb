configure :production, :development do
  if ENV['DATABASE_URL']
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  else
    ActiveRecord::Base.establish_connection(
        :adapter => ENV['DB_ADAPTER'] || 'postgresql',
        :host     => ENV['DB_HOST'] || 'localhost',
        :username => ENV['DB_USER'] || 'company_service',
        :password => ENV['DB_PASS'] || 'pass',
        :database => ENV['DB_DB_NAME'] || 'company_service',
        :encoding => 'utf8'
    )
  end
end
