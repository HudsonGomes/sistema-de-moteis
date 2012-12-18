class Suite < ActiveRecord::Base

  belongs_to :motel

  validates :nome, :presence => { :message => 'O nome deve ser preenchido'  }
  validates :valor, :presence => { :message => 'O valor deve ser preenchido' }
  validates :valor, :numericality => { :message => 'O valor deve conter apenas numeros' }

end
