class Suite < ActiveRecord::Base

  belongs_to :motel

  validates :nome, :presence => true
  validates :valor, :presence => true

end
