class Sugestao < ActiveRecord::Base

  validates :nome, :presence => { :message => 'Deve possuir um nome' }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
    :presence => { :message => 'O email deve ser preenchido' }
  validates :mensagem, :presence => { :message => 'A mensagem nao pode ficar em branco' }

end
