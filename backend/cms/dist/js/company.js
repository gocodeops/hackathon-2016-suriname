$.get("http://gocodeops.com/hackathon2016_api/index.php/transaction/" + localStorage.getItem('user_id') + '/', function(data, status){
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

setInterval(function() { 
    $("#transactions").empty();
    // get transactions user to user
    $.get("http://gocodeops.com/hackathon2016_api/index.php/transaction/" + localStorage.getItem('user_id') + '/', function(data, status){
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
}, 5000);