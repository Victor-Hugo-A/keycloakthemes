<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Error</title>
</head>
<body>
    <h1>Error Page</h1>
    <#if message??>
        <p>${kcSanitize(message.summary)?no_esc}</p>
    </#if>
</body>
</html>