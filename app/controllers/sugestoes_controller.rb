class SugestoesController < ApplicationController

  skip_before_filter :logado?, :only => :criar_sugestao

  def index
    @sugestoes = Sugestao.all
  end

end
