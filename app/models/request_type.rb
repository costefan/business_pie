class RequestType
  include Mongoid::Document

  field :name, type: String
  embedded_in :check_request
  embedded_in :search_request
end