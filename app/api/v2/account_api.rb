# encoding: utf-8

module API

  module V2

    class Account < Grape::API

      resource :accounts do

        desc 'List all Accounts.'
        get do
          'List All Accounts.'
        end

        desc 'Find a specific Account.'
        get ':id' do
          'Find Account.'
        end

        desc 'Create a new Account.'
        params do
          requires :name, type: String, desc: 'Account name.'
          requires :type, type: Hash do
            requires :id, type: Integer
          end
        end
        post do
          'Create a new Account.'
          Models::Account.create(
              :name => params[:name],
              :created_at => Time.now,
              :type => Models::Account::Type.get(params[:type][:id])
          )
        end

        desc 'Update a existing Account or Create a New One.'
        params do
          requires :name, type: String, desc: 'Account name.'
          optional :type, type: Integer, desc: 'Account Type.'
        end
        put ':id' do
          'Update or Create Account'
        end

        desc 'Delete an Account.'
        delete ':id' do
          'Delete an Account.'
        end

      end

    end

  end

end
