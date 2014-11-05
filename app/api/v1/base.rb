# encoding: UTF-8

require 'models/account'
require 'api/v1/entities/account_entity'
require 'api/v1/account_api.rb'
require 'api/v1/account_type_api.rb'

module API

  module V1

    class Base < Grape::API
      version 'v1', :using => :header, :vendor => 'alienlabz', :format => :json
      default_format :json

      rescue_from DataMapper::ObjectNotFoundError do |e|
        error_response(message: 'Resource not found.', status: 404)
      end

      mount API::V1::Account => '/'
      mount API::V1::AccountType => '/'
    end

  end

end
