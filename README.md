# DesafioAppTest

TELA DE CEP

Regras de negócio
• Terão 2 menus na parte inferior Cep e Configuração
• Ao digitar o cep deve formatar no formato de CEP
• Quando clicar em consultar CEP deverá chamar a api https://viacep.com.br/ws/31170220/json/ passando o
cep digitado como parâmetro
• Deverá direcionar para próxima tela
##
MOSTRA INFORMAÇÕES CEP

Regras de negócio
• Deverá retornar as informações retornadas pela API
• Quando voltar deverá apagar o cep anterior
• Se o Cep não existir deverá dar uma mensagem, Cep inexistente
##
CONFIGURAÇÃO

Regras de negócio
• Se clicar em configuração deverá ter a opção de mudar o parâmetro de enviar log para o discord
• Se parâmetro tiver habilitado deverá enviar os logs abaixo para o discord, caso não esteja não deverá enviar
log
o ConsultaCep:31170-220, Modelocelular:XXXX 
o RetornoCep:
▪ Logradouro: Rua Cardeal Stepinac ▪ Bairro: Cidade Nova
▪ Localidade: Belo Horizonte
▪ UF:MG
▪ IBGE: 3106200
▪ DDD: 31
• Segue a url do discord para enviar mensagem

https://discord.com/api/webhooks/1095399212310593597/wI4rSHU4bI3jGTz7XoV3LCKJ7licceu4_bz2G3yJt8
bN9aHSIdE6ZSdF6UTDPjW8fEiP
• Body discord : {"content": mensagem}
• Método POST
• Documentação https://discord.com/developers/docs/resources/webhook#execute-webhook
##

<p align="start">
<img align="start" width="270" height="590" src="https://github.com/DevEzequias/DesafioAppTest/assets/87769114/bffb56fc-5715-4d55-91b3-23daf9f8557b.jpg">
<img align="start" width="270" height="590" src="https://github.com/DevEzequias/DesafioAppTest/assets/87769114/b81bf2c3-914e-4f9a-8273-3f704e3b1bc8.jpg">
<img align="start" width="270" height="590" src="https://github.com/DevEzequias/DesafioAppTest/assets/87769114/c5ab74ac-1ef3-49b0-961d-63905b270eff.jpg">
<br />
</p>

