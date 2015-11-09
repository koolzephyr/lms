<%@ page import="np.edu.dwit.Member" %>
<div class="ui form" style="margin: 0px auto;width:90%;">
    <h2 style="text-align: center;font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif">Create Member</h2>
<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'fullName', 'error')} required">
      <h3 class="ui dividing header">Full Name <span class="required-indicator">*</span> </h3>
    <g:textField name="fullName" required="" value="${memberInstance?.fullName}"/>
</div>
    <br>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'userId', 'error')} required">

    <h3 class="ui dividing header">User Id <span class="required-indicator">*</span> </h3>

    <g:textField name="userId" required="" value="${memberInstance?.userId}"/>
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'password', 'error')} required">

    <h3 class="ui dividing header">Password <span class="required-indicator">*</span> </h3>

    <g:textField name="password" required="" value="${memberInstance?.password}"/>
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'role', 'error')} ">
    <h3 class="ui dividing header">Role <span class="required-indicator">*</span> </h3>
    <div class="field">
        <select class="ui fluid dropdown">
            <g:each in="${np.edu.dwit.Role.all}" var="roleList">
                <option>${roleList.authority}</option>
            </g:each>
         </select>
    </div>
</div>
<br>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} ">
    <h3 class="ui dividing header">Email <span class="required-indicator">*</span> </h3>
    <g:textField name="email" value="${memberInstance?.email}"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'contact', 'error')} ">
    <h3 class="ui dividing header">Contact <span class="required-indicator">*</span> </h3>

    <g:textField name="contact" value="${memberInstance?.contact}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'status', 'error')} ">--}%
%{--    <label for="status">--}%
%{--        <g:message code="member.status.label" default="Status"/>--}%
%{--
--}%

%{--    </label>--}%
%{--    <g:textField name="status" value="${memberInstance?.status}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'accountExpired', 'error')} ">--}%
%{--    <label for="accountExpired">--}%
%{--        <g:message code="member.accountExpired.label" default="Account Expired"/>--}%
%{--
--}%

%{--    </label>--}%
%{--    <g:checkBox name="accountExpired" value="${memberInstance?.accountExpired}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'accountLocked', 'error')} ">--}%
%{--    <label for="accountLocked">--}%
%{--        <g:message code="member.accountLocked.label" default="Account Locked"/>--}%
%{--
--}%

%{--    </label>--}%
%{--    <g:checkBox name="accountLocked" value="${memberInstance?.accountLocked}"/>--}%
%{--</div>--}%
<br>
<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'enabled', 'error')} ">
    <h3 class="ui dividing header">Enabled <span class="required-indicator">*</span>
    <g:checkBox name="enabled" value="${memberInstance?.enabled}"/>
    </h3>
</div>
</div>
%{--<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'passwordExpired', 'error')} ">--}%
%{--    <label for="passwordExpired">--}%
%{--        <g:message code="member.passwordExpired.label" default="Password Expired"/>--}%
%{--
--}%

%{--    </label>--}%
%{--    <g:checkBox name="passwordExpired" value="${memberInstance?.passwordExpired}"/>--}%
%{--</div>--}%

