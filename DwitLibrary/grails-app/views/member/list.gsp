<%@ page import="np.edu.dwit.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_page">
    <script src="${resource(dir: 'js', file: 'jquery-2.1.4.min.js')}"> </script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'datatable.min.css')}" />
    <g:javascript src="datatable-min.js"/>
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style>
    #wrapper{
        margin: 0px auto;
        width: 95%;
    }
    .dataTables_filter {
        display: none;
    }
        </style>

    <script>
        function setValue(){
            $("#userName").val('');
        }
        $(document).ready(function(){
            setValue();
            var table = $('#user_table').DataTable();

            $('#userName').on( 'keyup', function () {
                table
                        .columns( 0 )
                        .search( this.value )
                        .draw();
            } );
        })
    </script>

</head>

<div id="wrapper">
<div class="ui compact menu">
    <div class="active item">
        <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </div>

    <div class="active item">
        <g:link class="list" action="create"><g:message code="default.list.label" args="[entityName]"/></g:link>
    </div>
</div>
    UserName: <g:textField name="userName" id="userName"/>
<div id="list-member" class="content scaffold-list" role="main">
    <br>
    <h1 style="text-align: center"><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="ui celled table" id="user_table">
        <thead>
        <tr>

            <g:sortableColumn property="username"
                              title="${message(code: 'member.username.label', default: 'Username')}"/>

            %{--<g:sortableColumn property="password"
                              title="${message(code: 'member.password.label', default: 'Password')}"/>
--}%
            <g:sortableColumn property="email" title="${message(code: 'member.email.label', default: 'Email')}"/>

            <g:sortableColumn property="contact" title="${message(code: 'member.contact.label', default: 'Contact')}"/>

            <g:sortableColumn property="status" title="${message(code: 'member.status.label', default: 'Status')}"/>

            <g:sortableColumn property="accountExpired"
                              title="${message(code: 'member.accountExpired.label', default: 'Account Expired')}"/>
            <th> Action </th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${memberInstanceList}" status="i" var="memberInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "username")}</g:link></td>
%{--
                <td>${fieldValue(bean: memberInstance, field: "password")}</td>--}%

                <td>${fieldValue(bean: memberInstance, field: "email")}</td>

                <td>${fieldValue(bean: memberInstance, field: "contact")}</td>

                <td>${fieldValue(bean: memberInstance, field: "status")}</td>

                <td><g:formatBoolean boolean="${memberInstance.accountExpired}"/></td>

               <td> <div class="ui buttons">
                    <button class="ui button"><i class="edit icon"> </i>  <g:link style="color:#000000;"> Edit </g:link>
                    </button>
                    <div class="or"></div>
                    <button class="ui button"><i class="delete icon"> </i> <g:link> Delete </g:link>
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
