class CepjsController < ApplicationController
  def show
    @cep = CEP.new(params[:cep])
  end

  def index
  end
end
