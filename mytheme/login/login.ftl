<!DOCTYPE html>
<html>
<head><!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Portal SENAPPEN - Acesso Restrito</title>
    <link href="${url.resourcesPath}/css/login.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div class="login-container">
        <div class="login-card">
            <div class="header">
                <img src="${url.resourcesPath}/img/senappenLogo.png" alt="Logo SENAPPEN" class="logo">
                <h1>Secretaria Nacional de Políticas Penais</h1>
                <h2>Acesso Restrito ao Sistema</h2>
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
                    </#if>
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <form action="${url.loginAction}" method="post" aria-label="Formulário de login">
                <div class="form-group">
                    <label for="username">Usuário Institucional</label>
                    <input type="text" id="username" name="username" placeholder="Digite seu CPF ou matrícula" required autofocus>
                </div>

                <div class="form-group">
                    <label for="password">Senha</label>
                    <input type="password" id="password" name="password" placeholder="Digite sua senha" required>
                    <div class="forgot-password">
                        <a href="${url.loginResetCredentialsUrl}">Esqueci minha senha</a>
                    </div>
                </div>

                <#if realm.rememberMe && !username??>
                    <div class="form-group" style="margin-bottom: 1rem;">
                        <label>
                            <input type="checkbox" id="rememberMe" name="rememberMe"> Manter conectado
                        </label>
                    </div>
                </#if>

                <button type="submit">Acessar Sistema</button>
            </form>
        </div>
    </div>

    <footer class="footer">
        <div>
            &copy; ${.now?string("yyyy")} SENAPPEN - Secretaria Nacional de Políticas Penais<br>
            Todos os direitos reservados. Versão ${properties.version!''}
        </div>
    </footer>
</html>
<body>
