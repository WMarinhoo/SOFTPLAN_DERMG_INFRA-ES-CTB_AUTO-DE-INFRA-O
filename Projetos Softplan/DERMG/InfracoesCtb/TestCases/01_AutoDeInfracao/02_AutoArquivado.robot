* Settings *
Resource                ${CURDIR}/../../Resources/01_AutoDeInfracao/02_AutoArquivado.robot
Test Teardown           Fecha Navegador

* Test Cases *    

Cenario 01: cadastrar 'auto arquivado (Auto de infração foi substituído? NÃO)'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB"
    E Que esteja no combobox "Módulo do Sistema" na opção "Opcao Combobox"
    E que esteja no menu "Auto de Infração" e na tela de "Auto Arquivado"
    E Que esteja no combobox Mural "Serie" na opção "De"
    E inserir no campo "N auto infracao" o valor "10017"
    E que esteja na subtela de tipo "Consulta de Motivos"
    E inserir no campo "Agente" o valor "6321"
    E Clicar no botão "Gravar"
    E mensagem de "Registro gravado com sucesso" ser exibida
 
Cenario 02: cadastrar 'Auto Arquivado (Auto de infração foi substituído? SIM)'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB"
    E Que esteja no combobox "Módulo do Sistema" na opção "Opcao Combobox"
    E que esteja no menu "Auto de Infração" e na tela de "Auto Arquivado"
    E Que esteja no combobox Mural "Serie" na opção "De"
    E inserir no campo "N auto infracao" o valor "10021"
    E Clicar no botão "Auto substituído"
    E Que esteja no combobox Mural "Serie Substituto" na opção "De Substituto"
    E inserir no campo "N auto infracao Substituto" o valor "10022"
    E que esteja na subtela de tipo "Consulta de Motivos"
    E inserir no campo "Agente" o valor "6321"
    E Clicar no botão "Gravar"
    E mensagem de "Registro gravado com sucesso" ser exibida

Cenario 03: Consultar 'Auto Arquivado'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB"
    E Que esteja no combobox "Módulo do Sistema" na opção "Opcao Combobox"
    E que esteja no menu "Auto de Infração" e na tela de "Auto Arquivado"
    E Clicar no botão "Abrir"
    E Que esteja no combobox Mural "Serie Consulta" na opção "De Consulta"
    E inserir no campo "N auto infracao Consulta" o valor "10017"
    E Clicar no botão "Pesquisar"
    E Clicar no botão "Primeira Linha"
    
Cenario 04: Excluir 'Auto Arquivado'
    Dado que esteja no Portal "SGIV" com usuário "SIDERWEB"
    E Que esteja no combobox "Módulo do Sistema" na opção "Opcao Combobox"
    E que esteja no menu "Auto de Infração" e na tela de "Auto Arquivado"
    E Clicar no botão "Abrir"
    E Que esteja no combobox Mural "Serie Consulta" na opção "De Consulta"
    E inserir no campo "N auto infracao Consulta" o valor "10017"
    E Clicar no botão "Pesquisar"
    E Clicar no botão "Primeira Linha" 
    E Clicar no botão "Excluir"
    E mensagem de "Registro Excluído com sucesso" ser exibida
