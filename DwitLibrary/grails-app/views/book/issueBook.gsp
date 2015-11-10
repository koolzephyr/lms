
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link href="${resource(dir: "css",file: "jquery-ui.css")}" rel="stylesheet">
    <script type="text/javascript" src="${resource(dir: "js",file: "jquery-2.1.4.min.js")}"></script>
    %{--<script type="text/javascript" src="${resource(dir: "js",file: "jquery-ui.js")}"></script>--}%
    <r:require module="jquery"/>
    <r:require module="jquery-ui"/>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#issue").hide();
            $("#fullName").hide();
            $("#reset").hide();

            $("#bookNumber").on("contextmenu",function(){
                return false;
            });

            $("#fullName").on("contextmenu",function(){
                return false;
            });


            $.ajax({
                type: "GET",
                url: "${createLink(controller:"book",action:"getAllUsers")}",
                success : function(response) {

                    $("#fullName").autocomplete({
                        source: response,
                        select: function(event, ui) {
                            if (ui.item) {
                                $("#fullName").prop("readonly", true);
                                $("#issue").show();

                                alert("Member selected: "+ui.item.value);
                            }
                        }
                    });

                }


            });

        });



        function checkValid(bookNumber) {
            if(isNaN(bookNumber)) {
                $('#bookNumber').focus(function(){
                    $(this).val('');
                });
                alert("Invalid book number.");
            }else if(!(/^\d*$/.test(bookNumber))){
                $('#bookNumber').focus(function(){
                    $(this).val('');
                });
                alert("Invalid book number.");

            }else if(bookNumber.length>4){
                $("#bookNumber").val('');
                alert("Invalid book number.");

            }

            $.ajax({
                url:"${createLink(controller: "book",action: "checkValidBookType")}",
                type:"post",
                data:'bookNumber='+bookNumber,
                success:function(result){
                    if(result=='gifted'){
                        alert("Gifted book cannot be issued.");
                    }else if(result=='reference') {
                        alert("Reference book cannot be issued.");
                    }else if(result=='borrowable') {
                        $("#fullName").show();
                        $("#reset").show();
                    }else if(result=='novel') {
                        $("#fullName").show();
                        $("#reset").show();
                    }
                }
            })

        }

        function issue() {
            var bookNumber=$("#bookNumber").val();
            var memberName=$("#fullName").val();

            $.ajax({
                url:"${createLink(controller:"book" ,action:"saveIssue" )}",
                data:"bookNumber="+bookNumber+"&memberName="+memberName,
                type:'post',
                success: function (result) {
                    console.log(result);
                    if(result=="greaterborrowcount"){
                        alert("You have already borrowed three books");
                    }else if(result=="issue") {
                        $("#fullName").hide();
                        $("#issue").hide();
                        $("#bookNumber").val("");
                        $("#reset").hide();
                        alert("Book issued");
                    }else if(result=="error") {
                        $("#bookNumber").val("");
                        $("#fullName").val("");
                        $("#fullName").hide();
                        $("#issue").hide();
                        alert("This book is already borrowed.");
                    }
                }
            })


        }

        function reset() {
            $("#bookNumber").val("");
            $("#fullName").val("");
            $("#fullName").hide();
            $("#issue").hide();
            $("#fullName").prop("readonly", false);

        }





    </script>
</head>

<body>
<input type="text" name="bookNumber" id="bookNumber" placeholder="Book Number" onkeyup="checkValid(this.value);" required="required"/><br/>
<input type="text" name="fullName" id="fullName" placeholder="Member Name" /><br/>
<input type="submit" value="Issue" id="issue" onclick="issue();"/>
<input type="submit" value="Reset" id="reset" onclick="reset();"/>

<r:layoutResources/>
</body>
</html>
