
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Issue Book</title>
    <link href="${resource(dir: "css",file: "jquery-ui.css")}" rel="stylesheet">
    <script type="text/javascript" src="${resource(dir: "js",file: "jquery-2.1.4.min.js")}"></script>
    %{--<script type="text/javascript" src="${resource(dir: "js",file: "jquery-ui.js")}"></script>--}%
    <r:require module="jquery"/>
    <meta name="layout" content="main_page">
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
    %{--<script>

        </script>--}%
   %{-- <style>
    #overlay_form{
        position: absolute;
        border: 5px solid gray;
        padding: 10px;
        background: white;
        width: 270px;
        height: 190px;
    }
    #pop{
        display: block;
        border: 1px solid gray;
        width: 65px;
        text-align: center;
        padding: 6px;
        border-radius: 5px;
        text-decoration: none;
        margin: 0 auto;
    }
    </style>
    <script type="text/javascript">

        $(document).ready(function(){
//open popup
            $("#pop").click(function(){
                $("#overlay_form").fadeIn(1000);
                positionPopup();
            });

//close popup
            $("#close").click(function(){
                $("#overlay_form").fadeOut(500);
            });
        });

        //position the popup at the center of the page
        function positionPopup(){
            if(!$("#overlay_form").is(':visible')){
                return;
            }
            $("#overlay_form").css({
                left: ($(window).width() - $('#overlay_form').width()) / 2,
                top: ($(window).width() - $('#overlay_form').width()) / 7,
                position:'absolute'
            });
        }

        //maintain the popup at center of the page when browser resized
        $(window).bind('resize',positionPopup);

    </script>--}%
</head>

<body>
%{--<input type="text" name="bookNumber" id="bookNumber" placeholder="Book Number" onkeyup="checkValid(this.value);" required="required"/><br/>
<input type="text" name="fullName" id="fullName" placeholder="Member Name" /><br/>
<input type="submit" value="Issue" id="issue" onclick="issue();"/>
<input type="submit" value="Reset" id="reset" onclick="reset();"/>--}%
<a href="#" id="pop" >PopUp</a>
<br />
<form id="overlay_form" style="display:none">
    <h2> Issue Book     <a href="#" id="close" >Close</a>    </h2>
    <input type="text" name="bookNumber" id="bookNumber" placeholder="Book Number" onkeyup="checkValid(this.value);" required="required"/><br/>
    <input type="text" name="fullName" id="fullName" placeholder="Member Name" /><br/>
    <input type="submit" value="Issue" id="issue" onclick="issue();"/>
    <input type="submit" value="Reset" id="reset" onclick="reset();"/>
</form>

<r:layoutResources/>
</body>
</html>
