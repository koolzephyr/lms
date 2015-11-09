
<%@ page import="np.edu.dwit.BookInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookInfo.label', default: 'BookInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bookInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bookInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bookInfo">
			
				<g:if test="${bookInfoInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="bookInfo.book.label" default="Book" /></span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${bookInfoInstance?.book?.id}">${bookInfoInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInfoInstance?.bookNumber}">
				<li class="fieldcontain">
					<span id="bookNumber-label" class="property-label"><g:message code="bookInfo.bookNumber.label" default="Book Number" /></span>
					
						<span class="property-value" aria-labelledby="bookNumber-label"><g:fieldValue bean="${bookInfoInstance}" field="bookNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInfoInstance?.edition}">
				<li class="fieldcontain">
					<span id="edition-label" class="property-label"><g:message code="bookInfo.edition.label" default="Edition" /></span>
					
						<span class="property-value" aria-labelledby="edition-label"><g:fieldValue bean="${bookInfoInstance}" field="edition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInfoInstance?.publishedYear}">
				<li class="fieldcontain">
					<span id="publishedYear-label" class="property-label"><g:message code="bookInfo.publishedYear.label" default="Published Year" /></span>
					
						<span class="property-value" aria-labelledby="publishedYear-label"><g:fieldValue bean="${bookInfoInstance}" field="publishedYear"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInfoInstance?.pages}">
				<li class="fieldcontain">
					<span id="pages-label" class="property-label"><g:message code="bookInfo.pages.label" default="Pages" /></span>
					
						<span class="property-value" aria-labelledby="pages-label"><g:fieldValue bean="${bookInfoInstance}" field="pages"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInfoInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="bookInfo.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${bookInfoInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInfoInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="bookInfo.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${bookInfoInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bookInfoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookInfoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
