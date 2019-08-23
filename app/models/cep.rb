require 'net/http'
class CEP
	attr_accessor :logradouro, :bairro, :localidade, :uf, :error

	def initialize(cep)
		cep_encontrado = encontrar(cep) #hash
		preencher_dados(cep_encontrado) unless @error
	end


	private

	def encontrar(cep)
		begin
		ActiveSupport::JSON.decode(
			Net::HTTP.get(
				URI("https://viacep.com.br/ws/#{cep}/json/")
			)
		)
		rescue ActiveSupport::JSON.parse_error
			@error = "Cep não encontrado"
		end
	end

	def preencher_dados(cep_encontrado)
		@logradouro = cep_encontrado["logradouro"]
		@bairro = cep_encontrado["bairro"]
		@localidade = cep_encontrado["localidade"]
		@uf = cep_encontrado["uf"]
	end



end
