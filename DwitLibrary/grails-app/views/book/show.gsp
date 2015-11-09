
<%@ page import="np.edu.dwit.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-book" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book">
			
				<g:if test="${bookInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="book.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bookInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="book.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${bookInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publication}">
				<li class="fieldcontain">
					<span id="publication-label" class="property-label"><g:message code="book.publication.label" default="Publication" /></span>
					
						<span class="property-value" aria-labelledby="publication-label"><g:fieldValue bean="${bookInstance}" field="publication"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.availableQuantity}">
				<li class="fieldcontain">
					<span id="availableQuantity-label" class="property-label"><g:message code="book.availableQuantity.label" default="Available Quantity" /></span>
					
						<span class="property-value" aria-labelledby="availableQuantity-label"><g:fieldValue bean="${bookInstance}" field="availableQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.totalQuantity}">
				<li class="fieldcontain">
					<span id="totalQuantity-label" class="property-label"><g:message code="book.totalQuantity.label" default="Total Quantity" /></span>
					
						<span class="property-value" aria-labelledby="totalQuantity-label"><g:fieldValue bean="${bookInstance}" field="totalQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.bookType}">
				<li class="fieldcontain">
					<span id="bookType-label" class="property-label"><g:message code="book.bookType.label" default="Book Type" /></span>
					
						<span class="property-value" aria-labelledby="bookType-label"><g:fieldValue bean="${bookInstance}" field="bookType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
