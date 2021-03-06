class Administrador < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :password, :password_confirmation

  before_save :encrypt_password

  validates :nome, :presence => { :message => 'O nome deve ser preenchido' }
  validates :cpf, :presence => { :message => 'O cpf deve ser preenchido' }
  validates :cpf, :numericality => { :message => 'O cpf deve conter somente numeros' }
  validates :cpf, :length => { :is => 11 }
  validates :login, :presence => { :message => 'O login deve ser preenchido' }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, 
    :presence => { :message => 'O email deve ser preenchido' }
  validates :password, :presence => { :message => 'A senha deve ser preenchido' }, :on => :create
  validates :password, :confirmation => true

  def encrypt_password
    if password.present?
      self.senha_salt = BCrypt::Engine.generate_salt
      self.senha_hash = BCrypt::Engine.hash_secret(password, senha_salt)
    end
  end

  def self.authenticate(login, password)
    administrador = find_by_login(login)
    if administrador && administrador.senha_hash == BCrypt::Engine.hash_secret(password, administrador.senha_salt)
      administrador
    else
      nil
    end
  end
end
