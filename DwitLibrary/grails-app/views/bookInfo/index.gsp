
<%@ page import="np.edu.dwit.BookInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookInfo.label', default: 'BookInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bookInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create" params="[id: params.id]"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bookInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bookInfo.book.label" default="Book" /></th>
					
						<g:sortableColumn property="bookNumber" title="${message(code: 'bookInfo.bookNumber.label', default: 'Book Number')}" />

						<g:sortableColumn property="edition" title="${message(code: 'bookInfo.edition.label', default: 'Edition')}" />
					
						<g:sortableColumn property="publishedYear" title="${message(code: 'bookInfo.publishedYear.label', default: 'Published Year')}" />
					
						<g:sortableColumn property="pages" title="${message(code: 'bookInfo.pages.label', default: 'Pages')}" />
					
						<g:sortableColumn property="cost" title="${message(code: 'bookInfo.cost.label', default: 'Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookInfoInstanceList}" status="i" var="bookInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        %{--<td><g:link action="show" id="${bookInfoInstance.name}">${fieldValue(bean: bookInfoInstance, field: "book")}</g:link></td>--}%

                       <td>${fieldValue(bean: bookInfoInstance,field: "book.name")}</td>

                    %{--  For Developers Not Designers: Keep this code below in action Edit/Delete--}%
                      %{--  <td><g:link action="show" id="${bookInfoInstance.id}">${fieldValue(bean: bookInfoInstance, field: "book.id")}</g:link></td>
					--}%
						<td>${fieldValue(bean: bookInfoInstance, field: "bookNumber")}</td>
					
						<td>${fieldValue(bean: bookInfoInstance, field: "edition")}</td>
					
						<td>${fieldValue(bean: bookInfoInstance, field: "publishedYear")}</td>
					
						<td>${fieldValue(bean: bookInfoInstance, field: "pages")}</td>
					
						<td>${fieldValue(bean: bookInfoInstance, field: "cost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookInfoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
