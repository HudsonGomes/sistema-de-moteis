# encoding: utf-8
require 'spec_helper'

describe Motel do
  describe "Validações" do
    before(:each) do
      @motel_valido = Factory.build :motel
    end

    context "Deve ser válido quando" do
      it "contiver dados válidos" do
        @motel_valido.valid?.should be_true
      end

      it "latitude é um float" do
        @motel_valido.latitude = 12.1
        @motel_valido.valid?.should be_true
      end

      it "longitude é um float" do
        @motel_valido.latitude = 12.1
        @motel_valido.valid?.should be_true
      end

      it "telefone é um numero" do
        @motel_valido.telefone1 = '121'
        @motel_valido.valid?.should be_true
      end
    end

    context "Não deve ser válido quando" do
      it "nome é nil" do
        @motel_valido.nome = nil
        @motel_valido.valid?.should be_false
      end

      it "endereco é nil" do
        @motel_valido.endereco = nil
        @motel_valido.valid?.should be_false
      end

      it "latitude é nil" do
        @motel_valido.latitude = nil
        @motel_valido.valid?.should be_false
      end

      it "latitude contiver letras" do
        @motel_valido.latitude = 'ab'
        @motel_valido.valid?.should be_false
      end

      it "longitude é nil" do
        @motel_valido.longitude = nil
        @motel_valido.valid?.should be_false
      end

      it "longitude contiver letras" do
        @motel_valido.longitude = 'ba'
        @motel_valido.valid?.should be_false
      end

      it "telefone é nil" do
        @motel_valido.telefone1 = nil
        @motel_valido.valid?.should be_false
      end

      it "telefone contiver letras" do
        @motel_valido.telefone1 = 'ba'
        @motel_valido.valid?.should be_false
      end

      it "ativo é nil" do
        @motel_valido.ativo = nil
        @motel_valido.valid?.should be_false
      end
    end
  end

end