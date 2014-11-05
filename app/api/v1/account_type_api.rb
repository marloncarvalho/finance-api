# encoding: utf-8

module API

  module V1

    class AccountType < Grape::API

      resource 'types' do

        desc 'List all Types.'
        get do
          range = headers['Range']
          total_entries = 0

          unless range.nil?
            status 206
            types = Models::Account::Type.paginate(page: range.split('-')[0], per_page: range.split('-')[1])
            total_entries = types.total_entries
          else
            status 200
            types = Models::Account::Type.all
            total_entries = Models::Account::Type.count
            range = "1-#{total_entries}"
          end

          header 'Content-Range', "#{range}/#{total_entries}"
          present types, with: Entities::AccountType, fields: parse_fields(Models::Account::Type, params[:fields].try(:split, ','))
        end

        desc 'Find a specific Type.'
        get ':id' do
          present Models::Account::Type.get!(params[:id]), with: Entities::Account::Type
        end

        desc 'Create a new Type.'
        params do
          requires :name, type: String, desc: 'Account Type name.'
        end
        post do
          type = Models::Account::Type.create(:name => params[:name])
          header 'Location', "/types/#{type.id}"
          present type, with: Entities::Account::Type
        end

        desc 'Update a existing Type or Create a New One.'
        params do
          requires :name, type: String, desc: 'Account Type name.'
        end
        put ':id' do
          type = Models::Account::Type.get(params[:id])
          if type.nil?
            status 201
            type = Models::Account::Type.create(:id => params[:id], :name => params[:name])
            header 'Location', "/types/#{type.id}"
            present  type, with: Entities::Account::Type
          else
            status 200
            type.update(:name => params[:name])
            present type, with: Entities::Account::Type
          end
        end

        desc 'Delete a Type.'
        delete ':id' do
          status 204
          Models::Account::Type.get!(params[:id]).destroy
        end

        desc 'Update a existing Type.'
        params do
          requires :name, type: String, desc: 'Account Type name.'
        end
        patch ':id' do
          type = Models::Account::Type.get!(params[:id])
          type.update(:name => params[:name])
          present type, with: Entities::Account::Type
        end

      end

    end

  end

end

