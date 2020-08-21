require 'spec_helper'
require_relative '../../notificacoes/enviar_mensagem.rb'

module Notificacoes
  describe EnviarMensagem do
    let(:email) { 'teste@email.com' }
    subject { described_class.new(arquivo) }

    describe '#enviar' do
      context 'escola classica' do
        let(:arquivo) { Arquivo.new }
        let(:destinatario) { Destinatario.new(email) }

        it 'buscar destinatario' do
          expect(arquivo).
            to receive(:busca_destinatario).
            with(email).
            and_return(destinatario)
        end

        after do
          subject.enviar(email)
        end
      end

      context 'escola mockista' do
        let(:arquivo) { double }
        let(:destinatario) { double }

        it 'buscar destinatario' do
          expect(arquivo).
            to receive(:busca_destinatario).
            with(email).
            and_return(destinatario)
        end

        after(:each) do
          subject.enviar(email)
        end
      end
    end
  end
end
