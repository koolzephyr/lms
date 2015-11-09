%{--<table class="ui sortable celled table" id="first_table" style="margin: 0px auto;width: 95%">--}%
<table id="first_table" class="ui sortable celled table" cellspacing="0" width="100% margin: 0px">
    <thead>
    <tr>
        <th>S.No</th>
        <th>Name</th>
        <th>Author</th>
        <th>Publication</th>
        <sec:ifAllGranted roles="ROLE_LIBRARIAN">
            <th>Total Quantity</th>
        </sec:ifAllGranted>
        <th>Available Quantity</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${list}" var="booklist" status="i">
        <tr>
            <td>${i+1}</td>
            <sec:ifAllGranted roles="ROLE_LIBRARIAN">
                <td  style="text-align: center;"><button id = "bookRow" onclick="selectBook(${booklist.id});">${fieldValue(bean: booklist, field: "name")}</button></td>
            </sec:ifAllGranted>
            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_STUDENT,ROLE_FACULTY">
                <td  style="text-align: center;">${fieldValue(bean: booklist, field: "name")}</td>
            </sec:ifAnyGranted>
            <td>${booklist.author}</td>
            <td>${booklist.publication}</td>
            <sec:ifAllGranted roles="ROLE_LIBRARIAN">
                <td>${booklist.totalQuantity}</td>
            </sec:ifAllGranted>
            <td>${booklist.availableQuantity}</td>
        </tr>
    </g:each>
    </tbody>
</table>
    %{--<div id = "issueBook">

    </div>
<br>
<div id="space">
    <g:paginate total="$list ?: 0}" />
</div>
--}%
<script>
    function setValue(){
        $("#bookName").val('');
        $("#authorName").val('');
    }
    $(document).ready(function(){
        setValue();
        var table = $('#first_table').DataTable();

        $('#bookName').on( 'keyup', function () {
            table
                    .columns( 1 )
                    .search( this.value )
                    .draw();
        } );
        $('#authorName').on( 'keyup', function () {
            table
                    .columns( 2 )
                    .search( this.value )
                    .draw();
        } );
    })
</script>
