<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 11/5/15
  Time: 12:31 PM
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main_page">


    <style>
    .dataTables_filter {
        display: none;
    }
   /* #wrapper{
        margin: 0px auto;
        width: 95%;
    }*/
    </style>

</head>

<body>
<div id="wrapper">
    <br>

    %{--<g:if test="${flash.message}">--}%
        %{--<div class="ui center aligned segment">--}%
            %{--<div class="ui positive message">--}%
                %{--<div class="header">--}%
                    %{--<h1 style="text-align: center">${flash.message}</h1>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</g:if>--}%
    %{--<br>--}%

    %{--<g:if test="${flash.message}">--}%
        %{--<div class="ui center aligned segment">--}%
            %{--<div class="ui positive message">--}%
                %{--<div class="header">--}%
                    %{--<h1 style="text-align: center">${flash.message}</h1>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</g:if>--}%

    <div id="ajaxed_div">
        <table id="first_table" class="ui sortable celled table" cellspacing="0" width="100% margin: 0px">
            <thead>
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>No. of Issues</th>
                <th>Issuable</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        %{--<div id = "issueBook">

        </div>
    <br>
    <div id="space">
        <g:paginate total="$list ?: 0}" />
    </div>
    --}%
        %{--<script>--}%
            %{--function setValue(){--}%
                %{--$("#bookName").val('');--}%
                %{--$("#authorName").val('');--}%
            %{--}--}%
            %{--$(document).ready(function(){--}%
                %{--setValue();--}%
                %{--var table = $('#first_table').DataTable();--}%

                %{--$('#bookName').on( 'keyup', function () {--}%
                    %{--table--}%
                            %{--.columns( 1 )--}%
                            %{--.search( this.value )--}%
                            %{--.draw();--}%
                %{--} );--}%
                %{--$('#authorName').on( 'keyup', function () {--}%
                    %{--table--}%
                            %{--.columns( 2 )--}%
                            %{--.search( this.value )--}%
                            %{--.draw();--}%
                %{--} );--}%
            %{--})--}%
        %{--</script>--}%

        %{--<input type="hidden" id = "bookForIssue"/>--}%
    </div>
</div>
</body>
</html>