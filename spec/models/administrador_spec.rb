# encoding: utf-8
require 'spec_helper'

describe Administrador do
  describe "validações" do
    before(:each) do
      @administrador_valido = Factory.build :administrador
    end

    context "Deve ser válido quando" do
      it "contiver dados válidos" do
        @administrador_valido.valid?.should be_true
      end
    end

    context "Deve ser inválido quando" do
      it "Nome é nil" do
        @administrador_valido.nome = nil
        @administrador_valido.valid?.should be_false
      end

      it "Cpf é nil" do
        @administrador_valido.cpf = nil
        @administrador_valido.valid?.should be_false
      end

      it "Cpf contiver letras" do
        @administrador_valido.cpf = 'ad'
        @administrador_valido.valid?.should be_false
      end

      it "Cpf não contiver 11 números" do
        @administrador_valido.cpf = '123456789'
        @administrador_valido.valid?.should be_false
      end

      it "Email é nil" do
        @administrador_valido.email = nil
        @administrador_valido.valid?.should be_false
      end

      it "Email com formato inválido(sem @)" do
        @administrador_valido.email = 'admin.com'
        @administrador_valido.valid?.should be_false
      end

      it "Email com formato inválido(sem .com)" do
        @administrador_valido.email = 'admin@admin'
        @administrador_valido.valid?.should be_false
      end

      it "Login é nil" do
        @administrador_valido.login = nil
        @administrador_valido.valid?.should be_false
      end

      it "Password é nil" do
        @administrador_valido.password = nil
        @administrador_valido.valid?.should be_false
      end
    end
  end
end