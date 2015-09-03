class AppealType
  include Mongoid::Document

  field :name, type: String

  has_many :applications, :class_name => 'Application', autosave: true, :dependent => :destroy

  validates_uniqueness_of :name, :message => 'Вид обращения с таким именем уже существует'

end
