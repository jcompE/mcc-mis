$(document).ready(function () {
    $(function () {
        $('#tblDepartment').dataTable({
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": false
        });
    });
});

function _getAllDepart() {
    $.ajax({
        url: "/Department/Department",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';

            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.DepartmentCode + '</td>';
                html += '<td>' + item.DepartmentName + '</td>';
                html += '<td> </td>';
                html += '<td> </td>';
                //html += '<td><a href="#EditDepart" data-target="#EditDepart" onclick="return _UpdgetById(' + item.DepartId + ')" class="btn btn-success btn-sm"><i class="fa fa-edit"></i><a> <a href="#RemoveDepart" data-target="#RemoveDepart" onclick="return _DelgetById(' + item.DepartId + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i><a></td>';
                html += '</tr>';
            });

            $('#tblDepartmentList').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    return false;
}
