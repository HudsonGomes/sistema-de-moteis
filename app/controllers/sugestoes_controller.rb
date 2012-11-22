class SugestoesController < ApplicationController

  def index
    @sugestoes = Sugestao.all
  end


   def destroy
    @suite = Suite.find(params[:id])
    @suite.destroy

    respond_to do |format|
      format.html { redirect_to suites_url }
    end
  end
end
