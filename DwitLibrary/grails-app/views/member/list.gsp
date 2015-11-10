<%@ page import="np.edu.dwit.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_page">
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style>
    #wrapper{
        margin: 0px auto;
        width: 95%;
    }
        </style>
</head>

<body>
<div id="wrapper">
<div id="list-member" class="content scaffold-list" role="main">
    <br>
    <h1 style="margin: 0 auto; text-align: center;"><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="ui compact menu">
        <div class="active item">
            <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
        </div>
    </div>

    <table class="ui celled table">
        <thead>
        <tr>

            <g:sortableColumn property="fullName"
                              title="${message(code: 'member.fullName.label', default: 'Full Name')}"/>

            <g:sortableColumn property="userId" title="${message(code: 'member.userId.label', default: 'User Id')}"/>

            <g:sortableColumn property="username"
                              title="${message(code: 'member.username.label', default: 'Username')}"/>

            %{--<g:sortableColumn property="password"
                              title="${message(code: 'member.password.label', default: 'Password')}"/>
--}%
            <g:sortableColumn property="email" title="${message(code: 'member.email.label', default: 'Email')}"/>

            <g:sortableColumn property="contact" title="${message(code: 'member.contact.label', default: 'Contact')}"/>

            <th style="color: #E7746F"> Action </th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${memberInstanceList}" status="i" var="memberInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: memberInstance, field: "fullName")}</td>

                <td>${fieldValue(bean: memberInstance, field: "userId")}</td>

                <td>${fieldValue(bean: memberInstance, field: "username")}</td>

                %{--<td><g:link action="show"
                            id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "username")}</g:link></td>--}%
%{--
                <td>${fieldValue(bean: memberInstance, field: "password")}</td>--}%

                <td>${fieldValue(bean: memberInstance, field: "email")}</td>

                <td>${fieldValue(bean: memberInstance, field: "contact")}</td>

                <td>
                    <div class="ui buttons">
                        <g:form url="[resource: memberInstance, action: 'delete']" method="DELETE">
                            <g:link class="edit" action="edit" resource="${memberInstance}" style="color:#000000;">
                                <button type="button" class="ui button">
                                    <i class="edit icon"> </i>
                                    <g:message code="default.button.edit.label" default="Edit"/>
                                </button>
                            </g:link>
                            <div class="or"></div>

                            <button type="submit" class="ui button" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                <i class="delete icon"> </i>
                                <g:message code="default.button.delete.label" default="Delete"/>
                            </button>
                        </g:form>
                    </div>
                </td>
           </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${memberInstanceCount ?: 0}"/>
    </div>
</div>
    </div>
</body>
</html>
