class Administrador < ActiveRecord::Base
  attr_accessor :senha

  before_save :encrypt_senha

  validates :nome, :presence => { :message => 'O nome deve ser preenchido' }
  validates :cpf, :presence => { :message => 'O cpf deve ser preenchido' }
  validates :cpf, :numericality => { :message => 'O cpf deve conter somente numeros' }
  validates :cpf, :length => { :is => 11 }
  validates :login, :presence => { :message => 'O login deve ser preenchido' }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, 
    :presence => { :message => 'O email deve ser preenchido' }
  validates :senha, :presence => { :message => 'A senha deve ser preenchido' }, :on => :create

  def encrypt_senha
    if senha.present?
      self.senha_salt = BCrypt::Engine.generate_salt
      self.senha_hash = BCrypt::Engine.hash_secret(senha, senha_salt)
    end
  end

  def self.authenticate(login, senha)
    administrador = find_by_login(login)
    if administrador && administrador.senha_hash == BCrypt::Engine.hash_secret(senha, administrador.senha_salt)
      administrador
    else
      nil
    end
  end
end