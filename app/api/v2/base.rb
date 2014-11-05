# encoding: UTF-8

require 'models/account'
require 'api/v2/entities/account_entity'
require 'api/v2/account_api.rb'
require 'api/v2/account_type_api.rb'

module API

  module V2

    class Base < Grape::API
      version 'v2', :using => :header, :vendor => 'alienlabz', :format => :json
      format :json

      mount API::V2::Account => '/'
      mount API::V2::AccountType => '/'
    end

  end

end
