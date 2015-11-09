<%@ page import="np.edu.dwit.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_page">
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <style>
        form{
            text-align: left !important;
        }
        fieldset{
            margin: 0 13px;
        }
     </style>
</head>


<body>
<div class="ui compact menu" style="margin: 13px;">
    <div class="active item">
        <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </div>

    <div class="active item">
        <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link>
    </div>
</div>
<div id="create-member" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${memberInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${memberInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: memberInstance, action: 'save']">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="ui white button" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
