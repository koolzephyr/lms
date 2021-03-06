%{--
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

    $(function() {

        $("#searchName").on("keyup", function (e) {
                    var searchresult=$(this).val().trim();
                    var parameter = 'borrowingUsername='+searchresult+'&bookId='+${bookId};
                    $.ajax({
                        url:"${createLink(controller: 'book', action:'beforeIssue')}",
                        data: parameter,
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

</script>

<body>
<form method="post" controller="member" action="issueBook">
    <input type="text" name="name" placeholder="member name" id="searchName"/>
</form>
</body>
</html>--}%

<%--
  Created by IntelliJ IDEA.
  User: saneel
  Date: 11/7/15
  Time: 2:55 PM
--%>

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
            $('#return').hide();
            $("#reset").hide();

            $("#bookNumber").on("contextmenu",function(){
                return false;
            });
        });

        function checkValid(id) {
            if (isNaN(id)) {
                $('#bookNumber').focus(function () {
                    $(this).val('');
                });
                alert("Invalid book number.");
            } else if (!(/^\d*$/.test(id))) {
                $('#bookNumber').focus(function () {
                    $(this).val('');
                });
                alert("Invalid book number.");

            } else if (id.length > 4) {
                $("#bookNumber").val('');
                alert("Invalid book number.");

            }
            var bookNumber = $("#bookNumber").val();
            $.ajax({

                url: "${createLink(controller: "book",action: "checkBorrowedMember")}",
                type: "post",
                data: 'bookNumber=' + bookNumber,
                success: function (result) {
                    console.log(result);
                    var res = result.split(":");

                    $("#fullName").val(res[0]);
                    $("#fine").val(res[1]);
                    $("#totalFineDays").val(res[2]);
                    $("#totalKeptDays").val(res[3]);
                    $("#reset").show();
                    $("#return").show();


                }
            })

        }

        function saveReturn() {
            var bookNumber=$("#bookNumber").val();
            var memberName=$("#fullName").val();
            var totalKeptDays=$("#totalKeptDays").val();
            var totalFineDays=$("#totalFineDays").val();
            var totalFineAmount=$("#fine").val();

            $.ajax({
                url:"${createLink(controller: "book",action: "saveReturn")}",
                type:'post',
                data:'bookNumber='+bookNumber+'&memberName='+memberName+'&totalKeptdays='+totalKeptDays+'&totalFineDays='+totalFineDays+'&fine='+totalFineAmount,
                success: function(result) {
                    if(result="success") {
                        $("#bookNumber").val("");
                        $("#fullName").val("");
                        $("#fine").val("");
                        $("#totalKeptDays").val("");
                        $("#totalFineDays").val("");

                        alert("Book returned.")
                    }
                }
            })
        }

        function changeFine() {
            var days = $("#totalFineDays").val();
            var memberName= $("#fullName").val();
            var bookNumber = $("#bookNumber").val();

            if(days.length>3) {
                $('#totalFineDays').focus(function () {
                    $(this).val('');
                });
                $("#fine").val('');
                $('#return').attr("disabled","disabled");
                alert("Fine days will be not be greater than 3 digit.");
            }else if(isNaN(days)) {
                $('#totalFineDays').focus(function () {
                    $(this).val('');
                });
                $("#fine").val('');
                $('#return').attr("disabled","disabled");
                alert("invalid fine days.")
            }else if(!(/^\d*$/.test(days))) {
                $('#totalFineDays').focus(function () {
                    $(this).val('');
                });
                $("#fine").val('');
                $('#return').attr("disabled","disabled");
                alert("invalid fine days.")
            }else {
                $.ajax({
                    url:"${createLink(controller: "book",action: "recalculateFine")}",
                    data:'days='+days+'&memberName='+memberName+'&bookNumber='+bookNumber,
                    type:'post',
                    success: function (result) {
                        console.log(result);
                        var res = result.split(":");

                        $("#fullName").val(res[0]);
                        $("#fine").val(res[1]);
                        $("#totalFineDays").val(res[2]);
                        $("#totalKeptDays").val(res[3]);
                        $('#return').removeAttr("disabled","disabled");
                        $("#return").show();


                    }

                })
            }

        }

        function reset() {
            $("#bookNumber").val("");
            $("#fullName").val("");
            $("#return").hide();
            $("#totalKeptDays").val("");
            $("#totalFineDays").val("");
            $("#totalFineDays").removeAttr("disabled","disabled");
            $("#fine").val("");

        }











    </script>
</head>

<body>
Book Id: <input type="text" name="bookNumber" id="bookNumber" placeholder="Book Id" onkeyup="checkValid(this.value);"/><br/>
Member name: <input type="text" name="fullName" id="fullName" placeholder="Member Name" readonly/><br/>
Total kept Days: <input type ="text" name="totalKeptDays" id="totalKeptDays" readonly/>
Fine: <input type="text" name="fine" id="fine"  readonly/><br/>
Total fine Days: <input type ="text" name="totalFineDays" id="totalFineDays" onkeyup="changeFine();"/><br/>
<input type="submit" value="return" id="return"  onclick="saveReturn();" /><br/>
<input type="submit" value="Reset" id="reset" onclick="reset();"/>

<r:layoutResources/>
</body>
</html>
