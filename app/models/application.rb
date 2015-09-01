class Application
  include Mongoid::Document
  include Mongoid::Timestamps # adds automagic fields created_at, updated_at

  # field :secretary, type: String  # the author of appeal
  # field :minister, type: String
  field :applicant, type: String
  field :subject, type: String
  field :contacts, type: String
  field :comments, type: String
  field :status, type: Boolean

  belongs_to :appeal_type, :class_name => 'AppealType', autosave: true
  belongs_to :decision, :class_name => 'Decision', autosave: true

end
