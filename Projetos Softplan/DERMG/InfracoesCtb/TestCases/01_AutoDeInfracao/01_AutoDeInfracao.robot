* Settings *

Resource                ${CURDIR}/../../Resources/01_AutoDeInfracao/01_AutoDeIfracao.robot
Test Teardown           Fecha Navegador

* Test Cases *

Cenário 01: Cadastrar 'Auto de infração'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB" 
    E Que esteja no combobox "Módulo do Sistema" na opção "Menu Auto de Infração"
    E que esteja no menu "Auto de Infração" e na tela de "Auto de Infração" 
    E Inserir no campo "Auto de infração" o valor "DE00000504"
    E Inserir no campo "Renavam" o valor "01315049144"
    E Inserir no campo "Placa" o valor "PUA0C80"
    E Clicar no botão "Cometimento"
    E Inserir no campo "dt cometimento" o valor "11/10/2024"
    E Inserir no campo "Hora cometimento" o valor "13:00"
    E Clicar no botão "Sentido Trafego"
    E Inserir no campo "Rodovia AIT" o valor "WENDEL 44 TESTE"
    E Inserir no campo "km" o valor "100"
    E Inserir no campo "Municipio" o valor "6101"
    E Clicar no botão "Infração"
    E Inserir no campo "Infração" o valor "52312"
    E Inserir no campo "Equipamento" o valor "00NF000054"
    E Inserir no campo "Medida Realizada" o valor "100"
    E Inserir no campo "Limite Regulamentado" o valor "1000"
    E Inserir no campo "Valor considerado" o valor "500"
    E Clicar no botão "Agente"
    E preencher o campo Agente
    E Que esteja no combobox do frame mural "Assinatura" na opção "Não assinou"
    E Clicar no botão "Gravar"
    E mensagem de "Registro Gravado com sucesso" ser exibida 
    # VAI APRESENTAR PROBLEMA DE INTEGRAÇÃO POR CONTA DO "UF VEICULO" VÁ ATÉ O ARQUIVO DE "PRIMEIRA ANÁLISE" E EXECUTE O CENÁRIO 02 DE TESTES.
    
Cenário 02: Corrigir UF 'Auto de infração'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB" 
    E Que esteja no combobox "Módulo do Sistema" na opção "Menu Auto de Infração"
    E que esteja no menu "Auto de Infração" e na tela de "Auto de Infração" 
    E Clicar no botão "Abrir"
    E Que esteja no combobox do frame mural "Série" na opção "DE"
    E Inserir no campo "Auto de Infração Pesquisar" o valor "504"
    E Inserir no campo "Placa Pesquisar" o valor "PUA0C80"
    E Clicar no botão "Pesquisar"
    E Clicar no botão "Primeira linha"

Cenário 03: Excluir 'Auto de infração'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB" 
    E Que esteja no combobox "Módulo do Sistema" na opção "Menu Auto de Infração"
    E que esteja no menu "Auto de Infração" e na tela de "Auto de Infração" 
    E Clicar no botão "Abrir"
    E Que esteja no combobox do frame mural "Série" na opção "DE"
    E Inserir no campo "Auto de Infração Pesquisar" o valor "492"
    E Inserir no campo "Placa Pesquisar" o valor "PUA0C80"
    E Clicar no botão "Pesquisar"
    E Clicar no botão "Primeira linha"
    E Clicar no botão "Excluir"
    E mensagem de "Registro Excluido com sucesso" ser exibida