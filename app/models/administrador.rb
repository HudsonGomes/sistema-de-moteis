class Administrador < ActiveRecord::Base
  attr_accessor :senha

  before_save :encrypt_senha

  validates :nome, :presence => true
  validates :cpf, :presence => true
  validates :login, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :presence => true
  validates :senha, :presence => true, :on => :create

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