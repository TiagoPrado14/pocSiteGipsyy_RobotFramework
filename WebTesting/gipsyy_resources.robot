*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***

${URL}                    https://stgfrontbr.gipsyy.com.br/
${MENU_USUARIO}           //div[contains(@class,'UserMenu_user__1WKN6')]
${MENU_USUARIO_LOG}       //div[contains(@class,'UserMenu_user__1WKN6 UserMenu_loggedUser__2kskA')]
${CAMPO_EMAIL}            css=#login_email
${CAMPO_SENHA}            css=#password
${BTN_INICIAR_SESSAO}     //div[@class='float-right SignIn_signInBtn__YVMwv'][contains(.,'Iniciar Sessão')]
${BTN_SAIR}               //span[@class='UserMenu_text__SE8CN'][contains(.,'Sair')]
${MSG_EMAIL_NAO_ECONTRADO}    //div[@class='mt-2 SignIn_error__1m21R'][contains(.,'Email não encontrado.')]
${MSG_SENHA_INVALIDA}        //div[@class='mt-2 SignIn_error__1m21R'][contains(.,'Senha inválida.')]
${MSG_EMAIL_INVALIDO}        //div[@class='SignIn_error__1m21R'][contains(.,'Por favor digite um E-Mail válido (e.g. name@email.com)')]


*** Keywords ***
Abrir o navegador
    Open Browser       browser=chrome      options=add_experimental_option("detach", True)
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que acesse a tela de login
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_USUARIO}
    Click Element    locator=${MENU_USUARIO}                

Quando preencher com dados válidos e confirmar  
    Wait Until Element Is Enabled           ${CAMPO_EMAIL}
    Input Text        ${CAMPO_EMAIL}        tiago.silva@gipsyy.com.br
    Input Password    ${CAMPO_SENHA}        Nova1010-
    Click Element     ${BTN_INICIAR_SESSAO}

Então verifico login com sucesso
    
    Wait Until Element Is Visible    ${MENU_USUARIO_LOG}

Quando preencher email diferente e senha válida e confirmar
    Wait Until Element Is Enabled           ${CAMPO_EMAIL}
    Input Text        ${CAMPO_EMAIL}        joao@teste.com.br
    Input Password    ${CAMPO_SENHA}        Nova1010-
    Click Element     ${BTN_INICIAR_SESSAO}

Então verifico a mensagem "Email não encontrado"
    Wait Until Element Is Visible    ${MSG_EMAIL_NAO_ECONTRADO}

Quando preencher email e senha inválida e confirmar
    Wait Until Element Is Enabled           ${CAMPO_EMAIL}
    Input Text        ${CAMPO_EMAIL}        tiago.silva@gipsyy.com.br
    Input Password    ${CAMPO_SENHA}        Nova1010
    Click Element     ${BTN_INICIAR_SESSAO}

Quando preencher email inválido
    Wait Until Element Is Enabled           ${CAMPO_EMAIL}
    Input Text        ${CAMPO_EMAIL}        joseteste.com.br
    Click Element    ${CAMPO_SENHA}

Então verifico a mensagem "Por favor digite um E-mail válido"
    Wait Until Element Is Visible    ${MSG_EMAIL_INVALIDO}    

Então verifico a mensagem "Senha inválida"
    Wait Until Element Is Visible    ${MSG_SENHA_INVALIDA}

Dado que esteja logado no site Gipsyy
    Go To    url=${URL}    
    Click Element     locator=${MENU_USUARIO}
    Wait Until Element Is Enabled           ${CAMPO_EMAIL} 
    Input Text        ${CAMPO_EMAIL}        tiago.silva@gipsyy.com.br
    Input Password    ${CAMPO_SENHA}        Nova1010-
    Click Element     ${BTN_INICIAR_SESSAO}

Quando clicar em sair no menu do usuário
    Wait Until Element Is Visible    ${MENU_USUARIO_LOG}
    Click Element    ${MENU_USUARIO_LOG}
    Click Element    ${BTN_SAIR}

Então verifico logout com sucesso
    Wait Until Element Is Visible    ${MENU_USUARIO}


    


    




