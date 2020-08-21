require 'spec_helper'
require_relative '../../notificacoes/enviar_mensagem.rb'

module Notificacoes
  describe EnviarMensagem do
    let(:email) { 'teste@email.com' }
    let(:mensagem) { 'oi mtc!' }
    subject { described_class.new(arquivo, notificador) }

    describe '#enviar' do
      context 'escola classica' do
        let(:arquivo) { Arquivo.new }
        let(:notificador) { Notificador.new }

        it 'envia com sucesso' do
          resultado = subject.enviar(email, mensagem)

          expect(resultado).to be_truthy
        end
      end

      context 'escola mockista' do
        let(:arquivo) { double }
        let(:destinatario) { double }
        let(:notificador) { double }

        before(:each) do
          allow(arquivo).
            to receive(:busca_destinatario).
            with(email).
            and_return(destinatario)

          allow(notificador).
            to receive(:enviar).
            with(mensagem, destinatario).
            and_return(true)
        end

        it 'busca destinatario' do
          expect(arquivo).
            to receive(:busca_destinatario).
            with(email).
            and_return(destinatario)

          expect(subject.enviar(email, mensagem)).to be_truthy
        end

        it 'envia notificacao' do
          expect(notificador).
            to receive(:enviar).
            with(mensagem, destinatario).
            and_return(true)

            expect(subject.enviar(email, mensagem)).to be_truthy
        end
      end
    end
  end
end
