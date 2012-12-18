# encoding: utf-8
require 'spec_helper'

describe Ws::WsController do

  context 'GET listagem_moteis_proximos' do
    it "Deve retornar 'Unathorized' caso não seja passada a key correta" do
      get 'listagem_moteis_proximos', :key => '3u9fu48uf'

      response.code.should be_eql("401")
    end

    it "Deve retornar '400 Bad Request' caso não seja passada a key" do
      get 'listagem_moteis_proximos'
      
      response.code.should be_eql("400")
    end

    it "Deve retornar erro '400 Bad Request' caso não seja passada a latitude" do
      get 'listagem_moteis_proximos', :key => '4g25lhio3b6j3v5615125oinlk'

      response.code.should be_eql("400")
    end

    it "Deve retornar erro '400 Bad Request' caso não seja passada a longitude" do
      get 'listagem_moteis_proximos', :key => '4g25lhio3b6j3v5615125oinlk', :latitude => 23

      response.code.should be_eql("400")
    end

    it "Deve retornar '200 OK' caso sejam passados parâmetros corretos" do
      get 'listagem_moteis_proximos', :key => '4g25lhio3b6j3v5615125oinlk', :latitude => 23, :longitude => 40

      response.code.should be_eql("200")
    end
  end

  context "POST criar_sugestao" do
    it "Deve retornar '400 Bad Request' caso não seja passada a key" do
      post 'criar_sugestao'

      response.code.should be_eql("400")
    end
  end

  context "GET listagem_moteis_regiao" do
    it "Deve retornar 'Unathorized' caso não seja passada a key correta" do
      get 'listagem_moteis_regiao', :key => '3u9fu48uf'

      response.code.should be_eql("401")
    end

    it "Deve retornar '400 Bad Request' caso não seja passada a key" do
      get 'listagem_moteis_regiao'

      response.code.should be_eql("400")
    end

    it "Deve retornar erro '400 Bad Request' caso não seja passada nenhuma região" do
      get 'listagem_moteis_regiao', :key => '4736473gio321sgdo015136tnsg'

      response.code.should be_eql("400")
    end

    it "Deve retornar '200 ok' caso sejam passados parâmetros corretos" do
      get 'listagem_moteis_regiao', :key => '4736473gio321sgdo015136tnsg', :regiao => 'zona sul'

      response.code.should be_eql("200")
    end
  end

end
