var myApp = new Framework7({
    material: true,
    fastClicks: true, 
    // ... other parameters
});

var $$ = Dom7;
// Add view
var mainView = myApp.addView('.view-main', {
  // Because we want to use dynamic navbar, we need to enable it for this view:
  dynamicNavbar: true
});

myApp.onPageAfterAnimation('main', function (page) {

  $$('#profile').on('show', function () {
    $$('.searchbar').hide();
    $$('.main-content').addClass('no_search');
  });

  $$('#contacts, #businesses, #transactions').on('show', function () {
    $$('.searchbar').show();
    $$('.main-content').removeClass('no_search');
  });

  $$('.show-tab-profile').on('click', function () {
      myApp.showTab('#profile');
  });

  // localstorage
  user_id = localStorage.getItem('user_id');

  // get favorites
  $$.get("http://gocodeops.com/hackathon2016_api/index.php/favorites/"+ user_id +"/",
    function(data){
      var data = JSON.parse(data);
      $$('#favorites').html('');
      $$.each(data, function(i, value){
        var favorite = '<li>'+
                        '<a href="views/transaction.html?id='+value.friend_id+'&usertype='+value.usertype+'" class="item-link item-content">'+
                          '<div class="item-media"><img src="http://lorempixel.com/200/200/people" width="30"></div>'+
                          '<div class="item-inner">'+
                            '<div class="item-title-row">'+
                              '<div class="item-title">'+data[i].friend_firstname+' '+data[i].friend_lastname+'</div>'+
                            '</div>'+
                          '</div>'+
                        '</a>'+
                      '</li>';
        $$('#favorites').append(favorite);

      });
    });

  // get nonfavorites
  $$.get("http://gocodeops.com/hackathon2016_api/index.php/nonfavorites/"+user_id+"/",
    function(data){
      var data = JSON.parse(data);
      console.log(data);
      $$('#nonfavorites').html('');
      $$.each(data, function(i, value){
        var favorite = '<li>'+
                        '<a href="views/transaction.html?id='+value.friend_id+'&usertype='+value.usertype+'" class="item-link item-content">'+
                          '<div class="item-inner">'+
                             '<div class="item-title">'+data[i].friend_firstname+' '+data[i].friend_lastname+'</div>'+
                          '</div>'+
                        '</a>'+
                      '</li>';

        $$('#nonfavorites').append(favorite);
      });
    });

  // get companies
  $$.get('http://gocodeops.com/hackathon2016_api/index.php/companies/', function(data){
    data = JSON.parse(data);
    $$('#appended_bussinesses').html('');
    $$.each(data, function(i, value){
      $$("#appended_bussinesses").append('<li>\
                <a href="views/transaction.html?id='+value.id+'&usertype='+value.usertype+'" class="item-link">\
                  <div class="item-content">\
                    <div class="item-media"><img src="http://lorempixel.com/200/200/business/'+value.id+'" width="30"></div>\
                    <div class="item-inner">\
                      <div class="item-title-row">\
                        <div class="item-title">'+ value.firstname + ' ' + value.lastname +'</div>\
                      </div>\
                    </div>\
                  </div>\
                </a>\
              </li>');
    });
  });
  
  // var balance = $$("#balance").html();
  
  setInterval(function() { 
    // get transactions
    $$.get('http://gocodeops.com/hackathon2016_api/index.php/transaction/' + user_id + '/', function(data){
      data = JSON.parse(data);
      $$('#appended_transactions').html('');
      $$.each(data, function(i, value){
        $$("#appended_transactions").append('<li class="accordion-item"><a href="#" class="item-content item-link">\
                      <div class="item-inner">\
                        <div class="item-title">'+ value.s_firstname + ' ' + value.s_lastname +' to '+ value.r_firstname + ' ' + value.r_lastname +'\
                          <div class="item-subtitle" style="opacity: .4;">' + value.created_date + '</div>\
                        </div>\
                        <div class="item-after">$'+ value.amount +'</div>\
                      </div></a>\
                    <div class="accordion-item-content">\
                      <div class="content-block">'+ value.description +'</div>\
                    </div>\
                  </li>');
    });
      // opsomming van afgetrokken     // opsomming van binnengekomen
      var send_amount = 0;
      var received_amount = 0;

      $$.each(data, function(i, value){
        if (user_id == value.sender_id) {
          send_amount = send_amount + parseFloat(value.amount);
        } else if (user_id == value.receiver_id){
          received_amount = received_amount + parseFloat(value.amount);
        }
      });
      balance = localStorage.getItem('balance');

      new_balance = parseFloat(balance) - parseFloat(send_amount) + parseFloat(received_amount);
      $$("#balance").text(new_balance);

      console.log(new_balance);
    }); 
  }, 1000);

  // get profile
  $$.get('http://gocodeops.com/hackathon2016_api/index.php/user/' + user_id + '/', function(data){
    data = JSON.parse(data);
    $$('#appended_profile').html('');
      $$.each(data, function(i, value){
        $$("#appended_profile").append('<li>\
            <div class="item-content">\
              <div class="item-inner">\
                <div class="item-media">\
                  <div class="item-title">Firstname:</div>\
                  <div class="item-after">'+value.firstname+'</div>\
                </div>\
              </div>\
            </div>\
          </li>\
          <li>\
            <div class="item-content">\
              <div class="item-inner">\
                <div class="item-media">\
                  <div class="item-title">Lastname:</div>\
                  <div class="item-after">'+value.lastname+'</div>\
                </div>\
              </div>\
            </div>\
          </li>\
          <li>\
            <div class="item-content">\
              <div class="item-inner">\
              <div class="item-media">\
                <div class="item-title">Phone number:</div>\
                <div class="item-after">+597'+value.number+'</div>\
              </div>\
              </div>\
            </div>\
          </li>\
          <li>\
            <div class="item-content">\
              <div class="item-media">\
                <div class="item-title">Registered Date:</div>\
                <div class="item-after">'+value.created_date+'</div>\
              </div>\
            </div>\
          </li>');
      });
    });



$$.ajax({
    url: 'https://json2jsonp.com/?url=http%3A%2F%2F190.98.22.130%2Fhackathon2015%2FcheckBalance%2F5978781953&callback=success',
    dataType: 'JSONP',
    contentType: "jsonp",
    jsonpCallback: 'callback',
    type: 'GET',
    success: function (data) {
        // converts jsonp to json
        data = data.substring(data.indexOf("(") + 1, data.lastIndexOf(")"));
        data = JSON.parse(data);
        $$('#balance').html('');

        // console.log(data);
        $$.each(data, function(i, value){
          // alert(value.balance[0].availableBalance);

          // console.log(data[i].balance[0].availableBalance)
          $$("#balance").append(value.balance[0].availableBalance);

          localStorage.setItem("balance", value.balance[0].availableBalance);
        });
    }
});


});

// login page
myApp.onPageAfterAnimation('login', function (page) {
  $$("#login").submit(function(event){
    event.preventDefault();
    // login user
    $$.post('http://gocodeops.com/hackathon2016_api/index.php/login/', {
      number: $$("#number").val(),
      pin: $$("#pin").val()
    }, function(data){
      data = JSON.parse(data);

      if (data == 0) {
        myApp.alert('Gebruikersnaam of wachtwoord incorrect');
        // mainView.router.back();
      } else {
        // myApp.alert('Bedankt voor het inloggen');
        // console.log(data);
        localStorage.setItem('user_id', data[0].id);
        localStorage.setItem('user_type', data[0].usertype);
        mainView.router.loadPage('views/main.html');
      }
    });
  });
});

// register page
myApp.onPageAfterAnimation('register', function (page) {
  $$("#register").submit(function(event){
    event.preventDefault();
    // register user
    $$.post('http://gocodeops.com/hackathon2016_api/index.php/user/', {
      usertype: $$("#usertype").val(),
      firstname: $$("#firstname").val(),
      lastname: $$("#lastname").val(),
      number: $$("#number").val(),
      pin: $$("#pin").val()
    }, function(data){
      if (data == 0) {
        myApp.alert('Niet gelukt te registreren!');
        mainView.router.back();
      } else {
        myApp.alert('Bedankt voor het registreren!');
        mainView.router.loadPage('views/main.html');
      }
    });
  });
});

myApp.onPageAfterAnimation('transaction', function (page) {

  // get id from uriparam
  get_user_id = page.query.id;
  get_usertype = page.query.usertype;
  // alert(get_usertype);

  // get user based on get_user_id
  $$.get('http://gocodeops.com/hackathon2016_api/index.php/user/' + get_user_id + '/', function(data){
    data = JSON.parse(data);
    $$.each(data, function(i, value){
      $$("#receiver_name").append(value.firstname + ' ' + value.lastname);
    });
  });

  $$('#form_payment').on('submit', function (e) {
    e.preventDefault();

    if (get_usertype == 2) {
      amount = parseFloat($$("#amount").val()) - 0.02;

      $$.post('http://gocodeops.com/hackathon2016_api/index.php/transaction/', {
        sender: user_id,
        receiver: get_user_id,
        description: $$("#description").val(),
        amount: amount,
        status: 1
      }, function(data){
        if (data == 1) {
          myApp.alert("Transaction Completed");
          mainView.router.loadPage('views/main.html');
        } else {
          myApp.alert("Transaction Failed");
        }
      });
    } else {
      $$.post('http://gocodeops.com/hackathon2016_api/index.php/transaction/', {
        sender: user_id,
        receiver: get_user_id,
        description: $$("#description").val(),
        amount: $$("#amount").val(),
        status: 1
      }, function(data){
        if (data == 1) {
          myApp.alert("Transaction Completed");
          mainView.router.loadPage('views/main.html');
        } else {
          myApp.alert("Transaction Failed");
        }
      });
    }
  });
});