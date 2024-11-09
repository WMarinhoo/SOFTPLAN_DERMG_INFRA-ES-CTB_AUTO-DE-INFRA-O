* Settings *         
Resource                                                                  ${CURDIR}/../../Commons/login.robot

* Variables *
# FRAMES
${FRAME_MENU}                                                            idFrameMenu
${FRAME_MURAL}                                                           idFrameMural

# COMBOBOX
${COMBOBOX_MODULO_DO_SISTEMA}                                            id=comboModulo
${COMBOBOX_ASSINATURA}                                                   //select[contains(@name,'flAssinatura')]
${COMBOBOX_SERIE}                                                        //select[contains(@name,'serieAIT_cdSerie_Arg')]

# SELECT
${SELECT_MENU_AUTO_DE_INFRACAO}                                         //option[contains(.,'Infrações - CTB')]
${SELECT_NAO_ASSINOU}                                                   //option[contains(@value,'N')]
${SELECT_DE}                                                            //option[contains(@value,'DE')]

# MENU
${MENU_AUTO_DE_INFRACAO}                                                 nomeGrupo_181_1_19

# TELA
${TELA_AUTO_DE_INFRACAO}                                                 //ul[@itenspai='Auto de Infração / '][contains(.,'Auto de Infração')]

# CAMPO
${CAMPO_AUTO_DE_INFRACAO}                                               //input[contains(@name,'nuAutoInfracaoFmt')]
${CAMPO_RENAVAM}                                                        //input[contains(@name,'nuRenavanAuto')]
${CAMPO_PLACA}                                                          //input[contains(@name,'veiculo_cdPlaca')]
${CAMPO_UF_VEICULO}                                                     //input[contains(@name,'sgUfVeicAuto')]
${CAMPO_DT_COMETIMENTO}                                                 //input[contains(@name,'deDataInfracaoStr')]
${CAMPO_HORA_COMETIMENTO}                                               //input[contains(@name,'deHoraInfracaoStr')]
${CAMPO_RODOVIA_AIT}                                                    //input[contains(@name,'sgRodoviaAuto')]
${CAMPO_KM}                                                             //input[contains(@name,'nuKmCometimentoStr')]
${CAMPO_MUNICIPIO}                                                      //input[contains(@name,'municipio_cdCodigoTom')]
${CAMPO_INFRACAO}                                                       //input[contains(@name,'infracao_cdInfracao')]        
${CAMPO_EQUIPAMENTO}                                                    //input[contains(@name,'equipamentoAfericao_nuEquipamentoAfericao')]
${CAMPO_AGENTE}                                                         //input[contains(@name,'atendente_nuMatricula')]
${CAMPO_AUTO_DE_INFRACAO_PESQUISAR}                                     //input[contains(@name,'nuAutoInfracao_Arg')]                                                                                  
${CAMPO_PLACA_PESQUISAR}                                                //input[contains(@name,'cdPlaca_Arg')]
${CAMPO_MEDIDA_REALIZADA}                                               //input[contains(@name,'nuMedRealizadaStr')]
${CAMPO_LIMITE_REGULAMENTADO}                                           //input[contains(@name,'nuLimitePermitidoStr')]
${CAMPO_VALOR_CONSIDERADO}                                              //input[contains(@name,'nuMedConsideradaStr')]

# BOTAO
${BOTAO_COMETIMENTO}                                                    //img[contains(@id,'fildsetCometimento')][@src='/scop/plc/css/dermg/abrir_sub_titulo.gif']
${BOTAO_SENTIDO_TRAFEGO}                                                //input[@tabindex='20']  
${BOTAO_INFRACAO}                                                       //img[contains(@id,'fildsetInfracao')][@src='/scop/plc/css/dermg/abrir_sub_titulo.gif']     
${BOTAO_AGENTE}                                                         //img[contains(@id,'fildsetAgente')][@src='/scop/plc/css/dermg/abrir_sub_titulo.gif']
${BOTAO_GRAVAR}                                                         //input[contains(@value,'F12-Gravar')]
${BOTAO_ABRIR}                                                          //input[contains(@value,'F8-Abrir')]
${BOTAO_PESQUISAR}                                                      //input[contains(@value,'F9-Pesquisar')]
${BOTAO_PRIMEIRA_LINHA}                                                 linhaSel_0
${BOTAO_EXCLUIR}                                                        //input[contains(@value,'Excluir')]
${BOTAO_SELECIONAR_AGENTE}                                              //input[contains(@name,'atendenteSelPop')]
${BOTAO_SEGUNDA_LINHA}                                                  linhaSel_1

# MENSAGEM
${MENSAGEM_REGISTRO_GRAVADO_COM_SUCESSO}                                //div[contains(.,'Registro gravado com sucesso')]
${MENSAGEM_REGISTRO_EXCLUIDO_COM_SUCESSO}                               //div[contains(.,'Registro excluído com sucesso.')]
${MENSAGEM_REGISTRO_AUTO_JA_CADASTRADO}                                 //div[contains(.,'O número do auto de infração já está cadastrado.')]

* Keywords *

E Que esteja no combobox "${NOME_COMBOBOX}" na opção "${NOME_SELECT}"
    ${NOME_COMBOBOX}=    Gera Frase Em String                            ${NOME_COMBOBOX}
    ${NOME_SELECT}=      Gera Frase Em String                            ${NOME_SELECT}
    Wait Until Element Is Visible                                        ${FRAME_MENU}                                     ${TIMEOUT}
    Seleciona Frame                                                      Menu
    Wait Until Element Is Visible                                        ${COMBOBOX_${NOME_COMBOBOX}}                      ${TIMEOUT} 
    Click Element                                                        ${COMBOBOX_${NOME_COMBOBOX}}
    Wait Until Element Is Visible                                        ${SELECT_${NOME_SELECT}}                          ${TIMEOUT} 
    Click Element                                                        ${SELECT_${NOME_SELECT}}
    
E que esteja no menu "${NOME_MENU}" e na tela de "${NOME_TELA}"  
    ${NOME_TELA}=    Gera Frase Em String                                ${NOME_TELA}
    ${NOME_MENU}  Gera Frase Em String                                   ${NOME_MENU} 
    Wait Until Element Is Visible                                        ${MENU_${NOME_MENU}}                              ${TIMEOUT} 
    Click Element                                                        ${MENU_${NOME_MENU}}
    Wait Until Element Is Visible                                        ${TELA_${NOME_TELA}}                              ${TIMEOUT} 
    Click Element                                                        ${TELA_${NOME_TELA}}                                                        
    Unselect Frame
    Seleciona Frame                                                      Mural

E Inserir no campo "${CAMPO}" o valor "${VALOR}"
    ${CAMPO}=    Gera Frase Em String                                    ${CAMPO}
    Wait Until Element Is Visible                                        ${CAMPO_${CAMPO}}                                 ${TIMEOUT}
    Input Text                                                           ${CAMPO_${CAMPO}}                                 ${VALOR}
    IF    "${CAMPO}" == "PLACA"
        Press Key                                                        ${CAMPO_PLACA}                                    TAB 
    END
    IF    "${CAMPO}" == "MUNICIPIO"
        Press Key                                                        ${CAMPO_MUNICIPIO}                                TAB
    END
    IF    "${CAMPO}" == "INFRACAO"
        Press Key                                                        ${CAMPO_INFRACAO}                                 TAB 
    END
    IF    "${CAMPO}" == "EQUIPAMENTO"
        Press Key                                                        ${CAMPO_EQUIPAMENTO}                              TAB
    END
    IF  "${CAMPO}" == "DT_COMETIMENTO"
        Execute JavaScript    document.getElementById('deDataInfracaoStr').value = '${VALOR}'.replace(/\D/g,''); 
    END
    IF  "${CAMPO}" == "HORA_COMETIMENTO"
        Execute JavaScript    document.getElementById('deHoraInfracaoStr').value = '${VALOR}'.replace(/\D/g,''); 
    END

E Clicar no botão "${NOME_BOTAO}"
    ${NOME_BOTAO}=    Gera Frase Em String                               ${NOME_BOTAO}
    Wait Until Element Is Visible                                        ${BOTAO_${NOME_BOTAO}}                           ${TIMEOUT}              
    Click Element                                                        ${BOTAO_${NOME_BOTAO}}
    IF    "${NOME_BOTAO}" == "EXCLUIR"
        Handle Alert                                                     action=ACCEPT
    END

E mensagem de "${MENSAGEM}" ser exibida
   ${MENSAGEM}=                      Gera frase em String                ${MENSAGEM}
   Wait Until Element Is Visible                                         ${MENSAGEM_${MENSAGEM}}                          ${TIMEOUT}          
   Element Should Be Visible                                             ${MENSAGEM_${MENSAGEM}}

E Que esteja no combobox do frame mural "${NOME_COMBOBOX}" na opção "${NOME_SELECT}"
    ${NOME_COMBOBOX}=    Gera Frase Em String                            ${NOME_COMBOBOX}
    ${NOME_SELECT}=      Gera Frase Em String                            ${NOME_SELECT}
    Wait Until Element Is Visible                                        ${COMBOBOX_${NOME_COMBOBOX}}                      ${TIMEOUT} 
    Click Element                                                        ${COMBOBOX_${NOME_COMBOBOX}}
    Wait Until Element Is Visible                                        ${SELECT_${NOME_SELECT}}                          ${TIMEOUT} 
    Click Element                                                        ${SELECT_${NOME_SELECT}} 

E preencher o campo Agente
        Wait Until Element Is Visible                                    ${BOTAO_SELECIONAR_AGENTE}                         ${TIMEOUT}
        Click Element                                                    ${BOTAO_SELECIONAR_AGENTE}
        Unselect Frame
        @{LIST}=                       Get Window Names
        Set Test Variable                                                @{LIST}          
        Switch Window                                                    ${LIST[1]}
        Maximize Browser Window 
        Click Element                                                    ${BOTAO_PESQUISAR}
        Wait Until Element Is Visible                                    ${BOTAO_PESQUISAR}                                 ${TIMEOUT}
        Wait Until Element Is Visible                                    ${BOTAO_SEGUNDA_LINHA}                             ${TIMEOUT}
        Click Element                                                    ${BOTAO_SEGUNDA_LINHA}
        Set Test Variable                                                @{LIST}          
        Switch Window                                                    ${LIST[0]}
        Seleciona Frame                                                  Mural