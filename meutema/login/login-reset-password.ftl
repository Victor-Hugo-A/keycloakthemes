<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Portal SENAPPEN - Redefinir Senha</title>
    <link href="${url.resourcesPath}/css/login.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div class="login-container">
        <div class="login-card">
            <div class="header">
                <img src="${url.resourcesPath}/img/senappenLogo.png" alt="Logo SENAPPEN" class="logo">
                <h1>Esqueceu sua Senha?</h1>
            </div>

        <#if message?has_content>
            <div class="alert alert-${message.type}">
                <#if message.type == 'success'>
                    <#-- Só mostra "emailSent" se não for um erro oculto -->
                    <#if !message.summary?contains("user_not_found")>
                        <span class="alert-icon">✓</span>
                        ${kcSanitize(message.summary)?no_esc}
                    </#if>
                <#elseif message.type == 'error'>
                    <span class="alert-icon">✗</span>
                    <#-- Tratamento especial para usuário não encontrado -->
                    <#if message.summary == "user_not_found">
                        ❌ ${msg("user_not_found")}
                        <small>Verifique seu CPF, matrícula ou e-mail.</small>
                    <#else>
                        ${kcSanitize(message.summary)?no_esc}
                    </#if>
                </#if>
            </div>
        </#if>

        
        <form action="${url.loginAction}" method="post" aria-label="Formulário de redefinição de senha">
                <div class="input-icon-wrapper">
                    <div class="form-group">
                        <i class="fas fa-envelope"></i>
                        <label for="username">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}
                            </#if>
                        </label>
                        <input type="text" id="username" name="username" 
                               placeholder="Digite seu CPF, matrícula ou e-mail" 
                               required autofocus>
                    </div>
                </div>

                <button type="submit">${msg("doSubmit")}</button>
                
                <div class="back-to-login">
                    <a href="${url.loginUrl}"> « Voltar para o login</a>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer">
        <div>
            &copy; ${.now?string("yyyy")} SENAPPEN - <a href="https://www.gov.br/senappen/pt-br" class="href" target="_blank" rel="noopener noreferrer">
            Secretaria Nacional de Políticas Penais<br></a>
            Todos os direitos reservados.
        </div>
    </footer>
</body>
</html>