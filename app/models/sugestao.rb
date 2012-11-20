class Sugestao < ActiveRecord::Base

  validates :nome, :presence => { :message => 'Deve possuir um nome' }
  validates :email, :presence => { :message => 'Deve possuir um email' }
  validates :mensagem, :presence => { :message => 'A mensagem nao pode ficar em branco' }

end
