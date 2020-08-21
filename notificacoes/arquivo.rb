module Notificacoes
  class Arquivo
    def busca_destinatario(email)
      Notificacoes::Destinatario.new(email)
    end
  end
end
