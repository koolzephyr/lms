<%--
  Created by IntelliJ IDEA.
  User: saneel
  Date: 11/5/15
  Time: 12:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link href="${resource(dir: "css",file: "bootstrap.min.css")}" rel="stylesheet">
    <script type="text/javascript" src="${resource(dir: "js",file: "jquery-2.1.4.min.js")}"></script>

</head>
<script type="text/javascript">
    $( document ).ready(function() {
        $("#btnissue").hide();
    });
    $(function() {

        $("#searchName").on("keyup", function (e) {
                    var searchresult=$(this).val().trim();
                    var parameter = 'borrowingUsername='+searchresult+'&bookId='+${bookId};

                    console.log(parameter);
                    $.ajax({
                        url:"${createLink(controller: 'member', action:'beforeIssue')}",
                        data:
                                parameter,
                        type:'post',
                        success: function(result){
                            console.log(result);
                            if(result=="greaterborrowcount"){
                                alert("You have already borrowed three books");
                            }else if(result=="issue") {
                                alert("Book issued");
                            }else if(result=="error") {
                                alert("Username not found");
                            }

                        }
                    })
                }
        )

    });

    function issueBook() {
        $.ajax({
            url:"${createLink(controller:'Member' ,action: "issueBook")}",
            type:'post',
            success: function () {
                alert("issued");
            }
        })
    }



</script>

<body>
<form method="post" controller="member" action="issueBook">
    %{--<g:textField name="name" placeholder="member name" type="text" onkeypress="searchName(this.value);"/>--}%
    <input type="text" name="name" placeholder="member name" id="searchName"/>
</form>
</body>
</html>