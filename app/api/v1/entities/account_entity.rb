# encoding: utf-8

module Entities

  class Account < Grape::Entity
    expose :id
    expose :name
    expose :created_at, as: :createdAt
  end

  class AccountType < Grape::Entity
    expose :id, if: lambda { |type, options| options[:fields].include?(:id) }
    expose :name, if: lambda { |type, options| options[:fields].include?(:name) }
  end

end
