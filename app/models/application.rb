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

  before_save :strip_whitespace

  def strip_whitespace
    self.applicant = self.applicant.strip if self.applicant
    self.subject = self.subject.strip if self.subject
    self.contacts = self.contacts.strip if self.contacts
    self.comments = self.comments.strip if self.comments
  end

end
