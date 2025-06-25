<#-- template.ftl -->
<#import "lib.ftl" as lib>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="robots" content="noindex, nofollow">
    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet">
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>
<body>
    <div class="${properties.kcLoginClass!}">
        <div id="kc-header" class="${properties.kcHeaderClass!}">
            <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
                <#nested "header">
            </div>
        </div>
        <div class="${properties.kcFormCardClass!}">
            <div class="${properties.kcFormHeaderClass!}">
                <#if realm.internationalizationEnabled>
                    <div id="kc-locale">
                        <div id="kc-locale-wrapper">
                            <div class="kc-dropdown" id="kc-locale-dropdown">
                                <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                <ul>
                                    <#list locale.supported as l>
                                        <li><a href="${l.url}">${l.label}</a></li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
            <div class="${properties.kcFormClass!}">
                <#nested "form">
            </div>
            <div class="${properties.kcInfoAreaClass!}">
                <#nested "info">
            </div>
        </div>
    </div>
</body>
</html>