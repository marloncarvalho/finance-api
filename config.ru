$:.unshift "./app"

require 'rack/cors'

require 'pg'
require 'rubygems'
require 'grape'
require 'rack'
require 'grape-entity'
require 'data_mapper'
require  'dm-migrations'
require 'will_paginate'
require 'will_paginate/data_mapper'

require 'api/base.rb'

DataMapper::Logger.new($stdout, :debug)
DataMapper::Model.raise_on_save_failure = true
DataMapper.setup(:default, 'postgres://marloncarvalho@localhost:5432/finance')
DataMapper::finalize

#DataMapper.auto_migrate!

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options, :patch]
  end
end

run API::Base