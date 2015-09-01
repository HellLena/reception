class Decision
  include Mongoid::Document

  field :name, type: String

  has_many :applications, :class_name => 'Application', autosave: true, :dependent => :destroy

  validates_uniqueness_of :name

end
