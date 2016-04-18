class RequestType
  include Mongoid::Document

  field :name, type: String
  field :keywords, type: Array, default: []
  embedded_in :check_request
  embedded_in :search_request
end