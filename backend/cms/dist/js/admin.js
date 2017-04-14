$(document).ready(function(){

    // get all normal users
    $.get("http://gocodeops.com/hackathon2016_api/index.php/users/", function(data, status){
        // convert JSON array into JS array
        var data = JSON.parse(data);
        // place the data
        $.each(data, function (i, value) {
            $("#users").append('<tr><td>'+ value.firstname +'</td><td>'+ value.lastname +'</td><td>'+ value.number +'</td><td>'+ value.created_date +'</td><td><a href="transaction.html?id='+ value.id +'" class="btn btn-success btn-xs">View Transactions</a></td></tr>');
        });
    });

    // get all companies
    $.get("http://gocodeops.com/hackathon2016_api/index.php/companies/", function(data, status){
        // convert JSON array into JS array
        var data = JSON.parse(data);
        // place the data
        $.each(data, function (i, value) {
            $("#companies").append('<tr><td>'+ value.firstname +'</td><td>'+ value.lastname +'</td><td>'+ value.number +'</td><td>'+ value.created_date +'</td><td><a href="transaction.html?id='+ value.id +'" class="btn btn-success btn-xs">View Transactions</a></td></tr>');
        });
    });

    // get transactions user to user
    $.get("http://gocodeops.com/hackathon2016_api/index.php/transactions/", function(data, status){
        // convert JSON array into JS array
        var data = JSON.parse(data);
        $.each(data, function (i, value) {
                $("#transactions").append('<tr>\
                        <td>'+ value.s_firstname + ' ' + value.s_lastname +'</td>\
                        <td>'+ value.r_firstname + ' ' + value.r_lastname +'</td>\
                        <td>'+ value.description +'</td>\
                        <td>'+ value.amount +'</td>\
                        <td>'+ value.status +'</td>\
                        <td>'+ value.created_date +'</td>\
                    </tr>');
        });      
    }).done(function(){
        $("#transaction_table").DataTable();
    });
});