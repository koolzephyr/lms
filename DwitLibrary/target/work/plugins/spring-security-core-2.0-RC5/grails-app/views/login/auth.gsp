%{--
<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .inner {
		width: 340px;
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;
		border: 1px solid #aab;
		background-color: #f0f0fa;
		-moz-box-shadow: 2px 2px 2px #eee;
		-webkit-box-shadow: 2px 2px 2px #eee;
		-khtml-box-shadow: 2px 2px 2px #eee;
		box-shadow: 2px 2px 2px #eee;
	}

	#login .inner .fheader {
		padding: 18px 26px 14px 26px;
		background-color: #f7f7ff;
		margin: 0px 0 14px 0;
		color: #2e3741;
		font-size: 18px;
		font-weight: bold;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 105px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 120px;
	}

	#login .inner .cssform label {
		font-weight: bold;
		float: left;
		text-align: right;
		margin-left: -105px;
		width: 110px;
		padding-top: 3px;
		padding-right: 10px;
	}

	#login #remember_me_holder {
		padding-left: 120px;
	}

	#login #submit {
		margin-left: 15px;
	}

	#login #remember_me_holder label {
		float: none;
		margin-left: 0;
		text-align: left;
		width: 200px
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}
	</style>
</head>

<body>
<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>
<script type='text/javascript'>
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
})();
</script>
</body>
</html>
--}%

<html xmlns="http://www.w3.org/1999/html">
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	%{--<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .inner {
		width: 340px;
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;
		border: 1px solid #aab;
		background-color: #f0f0fa;
		-moz-box-shadow: 2px 2px 2px #eee;
		-webkit-box-shadow: 2px 2px 2px #eee;
		-khtml-box-shadow: 2px 2px 2px #eee;
		box-shadow: 2px 2px 2px #eee;
	}

	#login .inner .fheader {
		padding: 18px 26px 14px 26px;
		background-color: #f7f7ff;
		margin: 0px 0 14px 0;
		color: #2e3741;
		font-size: 18px;
		font-weight: bold;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 105px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 120px;
	}

	#login .inner .cssform label {
		font-weight: bold;
		float: left;
		text-align: right;
		margin-left: -105px;
		width: 110px;
		padding-top: 3px;
		padding-right: 10px;
	}

	#login #remember_me_holder {
		padding-left: 120px;
	}

	#login #submit {
		margin-left: 15px;
	}

	#login #remember_me_holder label {
		float: none;
		margin-left: 0;
		text-align: left;
		width: 200px
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}
	</style>--}%
	<link href="${resource(dir: 'css', file: 'login_style.css')}" rel="stylesheet">
	<script src="${resource(dir: 'js', file: 'jquery.placeholder.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'modernizr.custom.63321.js')}"></script>
	<style>
	@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
	body {
		background-image:url('${resource(dir: "images", file: "library3.jpg")}');
		-webkit-background-size: cover;
		-moz-background-size: cover;
		background-size: cover;
	}
	.container > header h1,
	.container > header h2 {
		color: #fff;
		text-shadow: 0 1px 1px rgba(0,0,0,0.7);
	}
	#message{
		color: white;
		font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		font-size: 18px;
	}
	.main{
		width: 26%;
		background-color: rgba(33, 45, 31, 0.38);
		border-radius: 5px;
	}
	.form-5{
		background-color:rgba(129, 93, 61, 0);
		border-radius: 5px;
		box-shadow: #0015b5;
	}
	.form-5 input[type=password]{
		border-radius: 5px;
	}
	.form-5 input[type=text]{
		border-radius: 5px;
	}
    #submit {
        color: #fff;
        font-size: 20px;
        width: 100px;
        height: 40px;
        border: 1px solid black;
        background-color: #2F2515;
        border-radius: 4px;
        padding: 0;
        margin-left: 100px;
    }
	</style>
</head>

<body>
<div class="container">
	<header>
		<h1 style="font-size: 40px"><strong>Library Management System</strong> </h1><br><br><br>
		<g:if test="${flash.message}">
			<div style="color: red" id="message" class="message" role="status">${flash.message}</div>
		</g:if>
	</header>
	<section class="main">
		<h1 style="text-align: center; font-size: 0px;color:white;">Login</h1>
		<form class="form-5 clearfix" action="${postUrl}" autocomplete='off' method="POST" style="box-shadow: none">
			%{--
                            <label for='username' style="color:white"><g:message code="springSecurity.login.username.label"/>:</label>
            --}%
			<input type='text' id="login" class='text_' name='j_username' id='username' placeholder="Username"/>
			<br><br><br>
			%{--
                            <label for='password' style="color:white"><g:message code="springSecurity.login.password.label"/>:</label>
            --}%
			<input type='password' placeholder="Password" class='text_' name='j_password' id='password'/>
			<br><br>

             <input id="submit" type='submit' id="submit" value='Login'/>
		</form>​​​​
	</section>
</div>
%{--<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>--}%

<script type='text/javascript'>
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
</script>
</body>
</html>

