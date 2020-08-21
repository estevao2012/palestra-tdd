require_relative 'arquivo.rb'
require_relative 'destinatario.rb'
require_relative 'notificador.rb'

module Notificacoes
  class EnviarMensagem
    def initialize(arquivo, notificador)
      @arquivo = arquivo
      @notificador = notificador
    end

    def enviar(email, mensagem)
      destinatario = @arquivo.busca_destinatario(email)
      resultado_mensagem = @notificador.enviar(mensagem, destinatario)

      resultado_mensagem
    end
  end
end
