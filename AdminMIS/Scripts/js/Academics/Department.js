$(document).ready(function () {
    //get list
    getDepartmentList();
});

function createDataTable() {
    $('#tblDepartment').dataTable({
        //"bJqueryUI": true,
        "bDestroy": true,
        "bRetrieve": true,
        "bPaginate": true,
        "sPaginationType": "full_numbers",
        "bLengthChange": true,
        "order": [[1, "asc"]],
        "bFilter": true,
        "bSort": true,
        //"bInfo": true,
        "bAutoWidth": false,
        "bSearch": true,
        "aoColumns": [
            { "sWidth": "25%" }, 	    //1st column width 
            { "sWidth": "45%" },		//2nd column width and so on
            {
                "sWidth": "15%",
                "bSearchable": false,
                "bSortable": false
            },
            {
                "sWidth": "15%",
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "fnDrawCallback": function () {     //not working yet
            $('table#tblDepartment td').bind('mouseenter', function () { $(this).parent().children().each(function () { $(this).addClass('row-highlight'); }); });
            $('table#tblDepartment td').bind('mouseleave', function () { $(this).parent().children().each(function () { $(this).removeClass('row-highlight'); }); });
        }
    });
}

function getDepartmentList() {
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
                html += '<td class="align-center"><a href="#EditDepartment" data-target="#editDepartment" onclick="updateDepartment(' + item.DepartmentID + ')" class="btn btn-success btn-sm"><i class="fa fa-edit"></i><a></td>';
                html += '<td class="align-center"><a href="#DeactivateDepartment" data-target="#removeDepartment" onclick="deleteDepartment(' + item.DepartmentID + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i><a></td>';
                html += '</tr>';
            });

            $('#tblBodyDepartmentList').html(html);
            //initialize datatable
            createDataTable();
            console.log("Department List loaded");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addDepartment() {
    //validate fields
    if ($('#departmentCode').val() == "" && $('#departmentName').val() == "") {
        $('#errorDepartmentCode').text("     *required");
        $('#errorDepartmentName').text("     *required");
    }
    else if ($('#departmentCode').val() == "") {
        $('#errorDepartmentCode').text("     *required");
        $('#errorDepartmentName').text("");
    }
    else if ($('#departmentName').val() == "") {
        $('#errorDepartmentName').text("     *required");
        $('#errorDepartmentCode').text("");
    }
    else {
        //get values from the form
        var obj = {
            departmentCode: $('#departmentCode').val(),
            departmentName: $('#departmentName').val(),
            isActive: $('#departmentIsActive').val()
        }
        $.ajax({
            url: '/Department/AddDepartment',
            data: JSON.stringify(obj),
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                $('#addDepartment').modal('hide');      //hide modal
                getDepartmentList();    //reload list
                //return Success Message
                /*$.iaoAlert({
                    msg: "Success! Saved Successfully",
                    type: "notification",
                    mode: "dark",
                });*/
                console.log("Department added");
            },
            //throw error
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

function editDepartment() {
    //validate fields
    if ($('#editDepartmentCode').val() == "" && $('#editDepartmentName').val() == "") {
        $('#errorEditDepartmentCode').text("     *required");
        $('#errorEditDepartmentName').text("     *required");
    }
    else if ($('#editDepartmentCode').val() == "") {
        $('#errorEditDepartmentCode').text("     *required");
        $('#errorEditDepartmentName').text("");
    }
    else if ($('#editDepartmentName').val() == "") {
        $('#errorEditDepartmentName').text("     *required");
        $('#errorEditDepartmentCode').text("");
    }
    else {
        //get values from the form
        var obj = {
            departmentID: $('#editDepartmentID').val(),
            departmentCode: $('#editDepartmentCode').val(),
            departmentName: $('#editDepartmentName').val(),
            isActive: $('#editDepartmentIsActive').val()
        }
        $.ajax({
            url: '/Department/UpdateDepartment',
            data: JSON.stringify(obj),
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                $('#editDepartment').modal('hide');     //hide modal
                getDepartmentList();    //reload list
                //clear form
                clearDepartmentForm();
                //Return Success Message
                /*$.iaoAlert({
                    msg: "Success! Saved Successfully",
                    type: "notification",
                    mode: "dark",
                });*/
                console.log("Department updated");
            },
            //Throw error
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

function updateDepartment(departmentID) {
    $.ajax({
        url: '/Department/GetDepartment/' + departmentID,
        //data: JSON.stringify(dto),
        type: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#editDepartmentID').val(result.DepartmentID);
            $('#editDepartmentCode').val(result.DepartmentCode);
            $('#editDepartmentName').val(result.DepartmentName);
            $('#editDepartmentIsActive').val(result.IsActive);
            $('#editDepartment').modal('show');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function deleteDepartment(departmentID) {
    $.ajax({
        url: '/Department/GetDepartment/' + departmentID,
        //data: JSON.stringify(dto),
        type: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#removeDepartmentID').val(result.DepartmentID);            
            $('#removeDepartment').modal('show');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function deactivateDepartment() {
    var departmentID = $('#removeDepartmentID').val();
    $.ajax({
        url: '/Department/DeactivateDepartment/' + departmentID,
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#removeDepartment').modal('hide');   //hide modal
            getDepartmentList();    //reload list
            //clear form
            clearDepartmentForm();
            //Return Success Message
            /*$.iaoAlert({
                msg: "Success! Deleted Successfully",
                type: "warning",
                mode: "dark",
            });*/
            console.log("Department deactivated");
        },
        //Throw error
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function clearDepartmentForm() {
    //clear form
    $("#frmAddDepartment")[0].reset();
}