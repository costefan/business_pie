class Service
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :description, type: String
  field :cost, type: Integer
end
