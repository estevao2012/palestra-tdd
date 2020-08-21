require_relative 'arquivo.rb'
require_relative 'destinatario.rb'

module Notificacoes
  class EnviarMensagem
    def initialize(arquivo)
      @arquivo = arquivo
    end

    def enviar(email)
      destinatario = @arquivo.busca_destinatario(email)

      true
    end
  end
end
