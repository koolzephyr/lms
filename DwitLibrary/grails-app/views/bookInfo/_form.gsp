<%@ page import="np.edu.dwit.BookInfo" %>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'book', 'error')} required">
	<label for="book">
		<g:message code="bookInfo.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>

	<g:textField id="book" name="book.id" readonly="" required="" value="${params.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'bookNumber', 'error')} required">
	<label for="bookNumber">
		<g:message code="bookInfo.bookNumber.label" default="Book Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bookNumber" required="" value="${bookInfoInstance?.bookNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'edition', 'error')} required">
	<label for="edition">
		<g:message code="bookInfo.edition.label" default="Edition" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="edition" required="" value="${bookInfoInstance?.edition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'publishedYear', 'error')} required">
	<label for="publishedYear">
		<g:message code="bookInfo.publishedYear.label" default="Published Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="publishedYear" required="" value="${bookInfoInstance?.publishedYear}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'pages', 'error')} required">
	<label for="pages">
		<g:message code="bookInfo.pages.label" default="Pages" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pages" required="" value="${bookInfoInstance?.pages}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="bookInfo.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cost" value="${fieldValue(bean: bookInfoInstance, field: 'cost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInfoInstance, field: 'source', 'error')} required">
	<label for="source">
		<g:message code="bookInfo.source.label" default="Source" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="source" required="" value="${bookInfoInstance?.source}"/>
</div>

