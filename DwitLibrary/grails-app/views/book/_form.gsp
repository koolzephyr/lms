<%@ page import="np.edu.dwit.Book" %>



<div class="ui form" style="margin: 0px auto;width:90%;">
	<h2 style="text-align: center;font-family:Open Sans Helvetica Neue Helvetica, Arial sans-serif">Create Book</h2>
	<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'name', 'error')} required">
		<h3 class="ui dividing header">Name <span class="required-indicator">*</span> </h3>
		<g:textField name="name" required="" value="${bookInstance?.name}"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} required">
		<h3 class="ui dividing header">Author <span class="required-indicator">*</span> </h3>

		<g:textField name="author" required="" value="${bookInstance?.author}"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publication', 'error')} required">
		<h3 class="ui dividing header">Publication <span class="required-indicator">*</span> </h3>

		<g:textField name="publication" required="" value="${bookInstance?.publication}"/>
	</div>

	%{--
    <div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'availableQuantity', 'error')} required">
        <label for="availableQuantity">
            <g:message code="book.availableQuantity.label" default="Available Quantity" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="availableQuantity" type="number" value="${bookInstance.availableQuantity}" required=""/>
    </div>
    --}%

	<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'totalQuantity', 'error')} required">
	<h3 class="ui dividing header">Total Quantity <span class="required-indicator">*</span> </h3>

	<g:field name="totalQuantity" type="number" value="${bookInstance.totalQuantity}" required=""/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'bookType', 'error')} required">
		<h3 class="ui dividing header">Book Type <span class="required-indicator">*</span> </h3>

		<g:select name="bookType" from="${bookInstance.constraints.bookType.inList}" required="" value="${bookInstance?.bookType}" valueMessagePrefix="book.bookType"/>
	</div>
</div>
