# encoding: UTF-8
require 'api/v1/base'
require 'api/v2/base'

module API

  class Base < Grape::API

    helpers do

      def parse_fields(klazz, fields)
        fields ? fields.map { |field| field.to_sym } : klazz.properties.map { |field|  field.name.to_sym }
      end

    end

    mount API::V1::Base
    mount API::V2::Base
  end

end
