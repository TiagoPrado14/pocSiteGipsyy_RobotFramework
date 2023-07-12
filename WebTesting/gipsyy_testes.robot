*** Settings ***
Documentation    Esta suite testa o site da Gipsyy.com.br
Resource         gipsyy_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***
Caso de teste 01 - Realizar login
    [Documentation]    Este teste verifica a funcionalidade de login do usuário
    [Tags]    login             
    Dado que acesse a tela de login
    Quando preencher com dados válidos e confirmar
    Então verifico login com sucesso

Caso de teste 03 - Realizar login inválido com email diferente do cadastro
    [Documentation]    Este teste verifica o retorno da mensagem ao inserir um email diferente do cadastrado
    [Tags]    login             
    Dado que acesse a tela de login
    Quando preencher email diferente e senha válida e confirmar
    Então verifico a mensagem "Email não encontrado"

Caso de teste 04 - Realizar login com senha inválida
    [Documentation]    Este teste verifica o retorno da mensagem ao inserir uma senha diferente da cadastrada
    [Tags]    login             
    Dado que acesse a tela de login
    Quando preencher email e senha inválida e confirmar
    Então verifico a mensagem "Senha inválida"

Caso de teste 05 - Realizar logout
    [Documentation]    Este teste verifica a funcionalidade de logout do usuário
    [Tags]    login
    Dado que esteja logado no site Gipsyy
    Quando clicar em sair no menu do usuário
    Então verifico logout com sucesso


Caso de teste 03 - Validar mensagem de email inválido 
    [Documentation]    Este teste verifica o retorno da mensagem ao inserir um email diferente do cadastrado
    [Tags]    login             
    Dado que acesse a tela de login
    Quando preencher email inválido
    Então verifico a mensagem "Por favor digite um E-mail válido"

    

    



