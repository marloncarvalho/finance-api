# encoding: utf-8

module API

  module V2

    class AccountType < Grape::API

      resource 'types' do

        desc 'List all Types.'
        get do
          'Merdinha'
        end

      end

    end

  end

end
