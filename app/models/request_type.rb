class RequestType
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  before_save :mongoize
  field :name, type: String
  field :keywords, type: Array, default: []
  field :positive_verbs, type: Array, default: []
  field :negative_verbs, type: Array, default: []
  has_many :check_request

  # def tags_list=(arg)
  #   self.tags = arg.split(',').map { |v| v.strip }
  # end

  # def tags_list
  #   self.tags.join(', ')
  # end

  protected
  def mongoize
  	self.keywords = self.keyword.split(/[ ,.]+/) unless self.keyword.nil?
  	self.positive_verbs = self.positive_verb.split(/[ ,.]+/)
  	self.negative_verbs = self.negative_verb.split(/[ ,.]+/)
    self.unset(:keyword)
    self.unset(:positive_verb)
    self.unset(:negative_verb)
  end
end