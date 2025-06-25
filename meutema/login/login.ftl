<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Portal SENAPPEN - Acesso Restrito</title>
    <link href="${url.resourcesPath}/css/login.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div class="login-container">
        <div class="login-card">
            <div class="header">
                <img src="${url.resourcesPath}/img/senappenLogo.png" alt="Logo SENAPPEN" class="logo">
            </div>

            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <#if message.type == 'success'>
                        <span class="alert-icon">✓</span>
                    <#elseif message.type == 'warning'>
                        <span class="alert-icon">⚠</span>
                    <#elseif message.type == 'error'>
                        <span class="alert-icon">✗</span>
                    <#elseif message.type == 'info'>
                        <span class="alert-icon">i</span>
                    <#elseif message.summary == "invalidUserMessage">
                        ${msg("invalidUserMessage")}
                    <#elseif message.summary == "invalidUserPasswordMessage">
                        ${msg("invalidPassword")}
                    </#if>
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <form action="${url.loginAction}" method="post" aria-label="Formulário de login">
                <div class="input-icon-wrapper">
                    <div class="form-group">
                        <i class="fas fa-id-badge"></i>
                        <label for="username">Usuário:</label>
                        <input type="text" id="username" name="username" placeholder="Digite seu CPF ou matrícula" required autofocus>
                    </div>
                </div>

                <div class="input-icon-wrapper">
                    <div class="form-group">
                        <i class="fas fa-lock"></i>
                        <label for="password">Senha:</label>
                        <input type="password" id="password" name="password" placeholder="Digite sua senha" required>
                    </div>
                </div>

                    <button type="submit">Login</button>
                    <div class="forgot-password">
                        <a href="${url.loginResetCredentialsUrl}">Esqueceu a senha?</a>
                    </div>
                    
                <#if realm.rememberMe && !username??>
                    <div class="form-checkbox">
                        <label>
                            <input type="checkbox" id="rememberMe" name="rememberMe"> Manter conectado
                        </label>
                    </div>
                </#if>
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

    <script type="text/javascript">

        function showResetPassword() {
            document.getElementById('reset-message').style.display = 'block';
            return false;
        }
    </script>
    <script type="text/javascript" src="${url.resourcesPath}/js/custom.js"></script>
</body>
</html>