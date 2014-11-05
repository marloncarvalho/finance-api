module Models

  # Accounts.
   class Account
     include DataMapper::Resource

     property :id,                    Serial
     property :name,             String
     property :created_at,  DateTime
     belongs_to :type, :required => false

     # Account Type.
     class Type
       include DataMapper::Resource

       property :id,          Serial
       property :name,  String
     end

   end

end