// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//=require social-share-button

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var alert_message;
var api_called = 0;
var alertMessage = function() {
  $.ajax({url: "https://api.511.org/transit/servicealerts?format=json&api_key=", success: function(result){
      result._entity.forEach(function(entity) {
        if (entity._alert._informed_entity[0]._agency_id == "MA") {
          alert = entity._alert._description_text._translation[0]._text;
          $("#alert_message").append(alert);
          alert_message = alert;
          api_called++;
        }
      });
  }});
};

$(document).on('ready', function(){
  if (api_called === 0) {
    alertMessage();
  }
});

$(document).on('turbolinks:load', function(){
  var $upvote = $('.up-vote').closest('form');
  var $downvote = $('.down-vote').closest('form');
  var voteTotal = +($('.vote-total').text());
  var voteIncrement = 1;
  var click_event = 0;
  $(".cog").click(function() {
      console.log("test");
      $(".dropdownprofile .dropdown-content").show();
      // $(".dropdown-content a").show();
  });

  $(".ProfilePhoto").click(function() {
      console.log("test");
      $(".dropdownprofile .dropdown-content").hide();
  });



  if (api_called == 1) {
    $('.alert-message-container').remove();
  }

  if (($( ".vote-total" ).data( "vote" )) == 1) {
    voteTotal--;
  }

  if (($( ".vote-total" ).data( "vote" )) == -1) {
    voteTotal++;
  }

  var onUpVote = function() {
    $upvote.off();
    $('.up-vote').removeClass('grayed');
    $('.down-vote').addClass('grayed');
    $('.vote-total').text(voteTotal+voteIncrement);
    $downvote.on('ajax:success', onDownVote);
  };

  var onDownVote = function() {
    $downvote.off();
    $('.down-vote').removeClass('grayed');
    $('.up-vote').addClass('grayed');
    $upvote.on('ajax:success', onUpVote);
    $('.vote-total').text(voteTotal-voteIncrement);
  };

  $upvote.on('ajax:success', onUpVote);
  $downvote.on('ajax:success', onDownVote);

  if ($( ".vote-total" ).data( "vote" )==1) {
    $upvote.off();
  }
  if ($( ".vote-total" ).data( "vote" )==-1) {
    $downvote.off();
  }

  function redirect(goto){
    if (goto !== '') {
      window.location = goto;
    }
  }

  $("select").select2({
    placeholder: "See your Muni Route",
  });

  $(".select-navbar").change(function() {
    var goto = this.value;

    console.log(goto);
    redirect(goto);
  });
});
