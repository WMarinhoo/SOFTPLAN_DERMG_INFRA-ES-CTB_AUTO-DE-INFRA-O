* Settings *

Resource                                                                ${CURDIR}/../../../Commons/login.robot

* Variables *

# FRAMES
${FRAME_MENU}                                                            idFrameMenu
${FRAME_MURAL}                                                           idFrameMural

# COMBOBOXS
${COMBOBOX_MODULO_DO_SISTEMA}                                            comboModulo
${COMBOBOX_SERIE}                                                        //select[contains(@class,'texto_obrigatorio')]
${COMBOBOX_SERIE_SUBSTITUTO}                                             cdSerieSubstituto
${COMBOBOX_SERIE_CONSULTA}                                               serie_cdSerie_Arg

# SELECTS
${SELECT_OPCAO_COMBOBOX}                                                 //option[contains(.,'Infrações - CTB')]
${SELECT_DE}                                                            //option[@value='DE'][contains(.,'DE')]
${SELECT_DE_SUBSTITUTO}                                                 //option[@value='DE'][contains(.,'DE')]
${SELECT_DE_CONSULTA}                                                   //option[@value='DE'][contains(.,'DE')]

# MENUS E TELAS
${MENU_AUTO_DE_INFRACAO}                                                nomeGrupo_181_1_19 
${TELA_AUTO_ARQUIVADO}                                                  //ul[@itenspai='Auto de Infração / '][contains(.,'Auto Arquivado')]

# CAMPOS
${CAMPO_N_AUTO_INFRACAO}                                                //input[contains(@name,'nuAutoInfracaoStr')]
${CAMPO_N_AUTO_INFRACAO_CONSULTA}                                       nuAutoInfracao_Arg
${CAMPO_AGENTE}                                                         agente_nuMatricula
${CAMPO_N_AUTO_INFRACAO_SUBSTITUTO}                                     nuAutoSubstitutoStr

# BOTÕES
${BOTAO_MOTIVO}                                                         //input[contains(@name,'motivoArquivSelPop')]
${BOTAO_PESQUISAR}                                                      //input[contains(@value,'F9-Pesquisar')]
${BOTAO_PRIMEIRA_LINHA}                                                 linhaSel_0
${BOTAO_GRAVAR}                                                         //input[contains(@value,'F12-Gravar')]
${BOTAO_AUTO_SUBSTITUIDO}                                               //input[contains(@value,'S')]
${BOTAO_ABRIR}                                                         //input[contains(@value,'F8-Abrir')]
${BOTAO_EXCLUIR}                                                       //input[contains(@value,'Excluir')]

# MENSAGENS
${MENSAGEM_REGISTRO_GRAVADO_COM_SUCESSO}                                //div[contains(.,'Registro gravado com sucesso')]
${MENSAGEM_REGISTRO_EXCLUIDO_COM_SUCESSO}                               //div[contains(.,'Registro excluído com sucesso.')]

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

E Que esteja no combobox Mural "${NOME_COMBOBOX}" na opção "${NOME_SELECT}"
    ${NOME_COMBOBOX}=    Gera Frase Em String                            ${NOME_COMBOBOX}
    ${NOME_SELECT}=      Gera Frase Em String                            ${NOME_SELECT}
    Wait Until Element Is Enabled                                        ${COMBOBOX_${NOME_COMBOBOX}}                  
    Click Element                                                        ${COMBOBOX_${NOME_COMBOBOX}}
    Click Element                                                        ${SELECT_${NOME_SELECT}}
    IF    "${NOME_COMBOBOX}" == "SERIE_SUBSTITUTO"
        Wait Until Element Is Enabled                                 ${COMBOBOX_SERIE_SUBSTITUTO}
        Press Keys                                                    ${COMBOBOX_SERIE_SUBSTITUTO}                  DE        # Pressiona a tecla TAB  
        ELSE IF    "${NOME_COMBOBOX}" == "SERIE_CONSULTA" 
          Wait Until Element Is Visible                               ${SELECT_DE_CONSULTA} 
          Click Element                                               ${SELECT_DE_CONSULTA}   
    END

E inserir no campo "${NOME_CAMPO}" o valor "${VALOR}" 
    ${NOME_CAMPO}=    Gera Frase Em String                            ${NOME_CAMPO}
    Wait Until Element Is Visible                                     ${CAMPO_${NOME_CAMPO}}                ${TIMEOUT}
    Input Text                                                        ${CAMPO_${NOME_CAMPO}}                ${VALOR}
    IF    "${NOME_CAMPO}" == "N_AUTO_INFRACAO"
        Press Keys                                                    ${CAMPO_N_AUTO_INFRACAO}                   TAB        # Pressiona a tecla TAB
        Wait Until Element Is Enabled                                 ${BOTAO_MOTIVO}
        ELSE IF    "${NOME_CAMPO}" == "AGENTE"
            Press Keys                                                ${CAMPO_AGENTE}                    TAB        # Pressiona a tecla TAB
            Wait Until Element Is Enabled                             ${BOTAO_GRAVAR} 
    END
        
E Clicar no botão "${NOME_BOTAO}"
   ${NOME_BOTAO}=    Gera Frase Em String                               ${NOME_BOTAO}
   Wait Until Element Is Visible                                        ${BOTAO_${NOME_BOTAO}}                           ${TIMEOUT}              
   Click Element                                                        ${BOTAO_${NOME_BOTAO}}
   IF    "${NOME_BOTAO}" == "EXCLUIR"
        Handle Alert                                                     action=ACCEPT
   END

E que esteja na subtela de tipo "${OPCAO}"
   ${OPCAO}=    Gera frase em String                                     ${OPCAO}
   Wait Until Element Is Visible                                         ${BOTAO_MOTIVO}                       ${TIMEOUT}
   Click Element                                                         ${BOTAO_MOTIVO} 
   @{LIST}=                       Get Window Names
   Set Test Variable                                                     @{LIST}          
   Switch Window                                                         ${LIST[1]}
   Maximize Browser Window
   Wait Until Element Is Visible                                         ${BOTAO_PESQUISAR}                       ${TIMEOUT}
   Click Element                                                         ${BOTAO_PESQUISAR}
   Wait Until Element Is Visible                                         ${BOTAO_PRIMEIRA_LINHA}                  ${TIMEOUT}  
   Click Element                                                         ${BOTAO_PRIMEIRA_LINHA} 
   @{LIST}=                       Get Window Names
   Set Test Variable                                                     @{LIST}          
   Switch Window                                                         ${LIST[0]}
   Seleciona Frame                                                       Mural        

E mensagem de "${MENSAGEM}" ser exibida
   ${MENSAGEM}=                      Gera frase em String                ${MENSAGEM}
   Wait Until Element Is Visible                                         ${MENSAGEM_${MENSAGEM}}                  ${TIMEOUT}          
   Element Should Be Visible                                             ${MENSAGEM_${MENSAGEM}}