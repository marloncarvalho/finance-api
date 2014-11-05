# encoding: utf-8

module Entities

  class Account < Grape::Entity
    expose :id
    expose :name
    expose :created_at, as: :createdAt

    class Type < Grape::Entity
      expose :id
      expose :name
    end

  end

end
