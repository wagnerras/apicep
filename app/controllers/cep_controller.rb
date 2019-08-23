class CepController < ApplicationController

  def index
  end
  
  def cep
    cep = CEP.new(cep_params[:cep])
    @cep = cep_params[:cep]
    @logradouro = cep.logradouro
    @bairro = cep.bairro
    @localidade = cep.localidade
    @uf = cep.uf
    @error = cep.error
    render 'index'
  end

  private

  def cep_params
    params.permit(:cep)
  end


end
