# encoding: utf-8
require 'spec_helper'

describe Suite do
  describe "Validações" do
    before(:each) do
      @suite_valida = Factory.build :suite
    end
    context "Deve ser válido quando" do
      it "com dados válidos" do
        @suite_valida.valid?.should be_true
      end

      it "Valor é um float" do
        @suite_valida.valor = 12.1
        @suite_valida.valid?.should be_true
      end
    end

    context "Deve ser inválido quando" do
      it "Nome é nil" do
        @suite_valida.nome = nil
        @suite_valida.valid?.should be_false
      end

      it "Valor é nil" do
        @suite_valida.valor = nil
        @suite_valida.valid?.should be_false
      end

      it "Valor contiver letras" do
        @suite_valida.valor = '12sd'
        @suite_valida.valid?.should be_false
      end
    end
  end
end