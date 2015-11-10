<html>
<head>
    <style>
    #overlay_form{
        position: absolute;
        border: 2px solid gray;
        padding: 10px;
        background: white;
        width: 370px;
        height: 290px;
    }
    #pop{
        display: block;
        width: 75px;
        text-align: center;
        padding: 2px;
        text-decoration: none;
        margin: 0 auto;
    }
    </style>
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

    </script>
    <script type='text/javascript'>
        $('#issues').click(function() {
            $.post('book/issueBook');
        });
    </script>
</head>
<body>
<form id="overlay_form" style="display:none">
    <h2> Issue Book  </h2>     <a href="#" id="close" >Close</a>
    <input type="text" name="bookNumber" id="bookNumber" placeholder="Book Number" onkeyup="checkValid(this.value);" required="required"/><br/>
    <input type="text" name="fullName" id="fullName" placeholder="Member Name" /><br/>
    <input type="submit" value="Issue" id="issue" onclick="issue();"/>
    <input type="submit" value="Reset" id="reset" onclick="reset();"/>
</form>
<div class="ui center aligned segment" style="background-color: #3573A3;">
        <g:link controller="member" action="index"><img style="float: left; height: 80px;width: 80px" src="${resource(dir: 'img', file: 'deerwalk.png')}" alt="Logo" />
        <h1 style="color:white;float:left"><b>Library Management System</b></h1></g:link>
        <div style="float:right;color: white; font-style: oblique; font-size: 20px" class="item">
    <form name="logout" method="POST" style="float: right;color: #E7746F" class="item" action="${createLink(controller:'logout') }">
        <em>
            <input type="submit" class="ui button" value="logout" style="color:#fff;background-color:rgba(255, 0, 0, 0.04)">
        </em>
    </form>
</div>
</div>
<div class="ui five item menu" style="margin: 0px auto;width: 98%;">
    <div class="ui large menu">
        <div class="ui simple link item">
            <g:link controller="member" action="history"><i class="history icon"></i> History</g:link>
        </div>



        <sec:ifAllGranted roles="ROLE_LIBRARIAN">
            <div class="ui simple link item">
                <a href="#" id="pop"> <i class="browser icon"></i> Issue </a>
            </div>
            <div class="ui simple link item">
                <g:link controller="book" action="returnBook"> <i class="reply icon"></i> Return </g:link>
            </div>
            <div class="ui simple dropdown link item">
                <i class="browser icon"></i> Report <i class="dropdown icon"></i>
                <div class="menu">
                    <g:link controller="book" action="report" class="item"> <i class="browser icon"></i>  Issued Book  </g:link>
                    <g:link controller="borrow" action="report" class="item"> <i class="browser icon"></i>  Fine Report </g:link>
                </div>
            </div>
            <div class="ui simple dropdown link item">
                <i class="configure icon"></i> Configure <i class="dropdown icon"></i>
                <div class="menu">
                    <g:link controller="member" action="create" class="item"> <i class="user icon"></i>  Add User  </g:link>
                    <g:link controller="book" action="create" class="item"> <i class="book icon"></i>  Add Book  </g:link>
                </div>
            </div>
        </sec:ifAllGranted>
    </div>
</div>
</body>
</html>