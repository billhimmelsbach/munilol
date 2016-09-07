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

// TODO: This file has a lot going on. Your naming conventions are good,
//      but I'd suggest adding some comments throughout to help break things up
//      and make the code more human readable. For example, you can group the
//      functions that deal with voting, those that deal with the API call, and
//      those that deal with the dropdown menu separately.

// TODO: Why does this alert_message variable need to exist, especially globally?
//      It looks like line 35 is the only place that it's used.
var alert_message;

// TODO: Can api_called be a boolean? If you initialized it with a value of false,
//      you could just write unless api_called in your document.ready function
//      and if api_called in your function that calls $('.alert-message-container').remove();
var api_called = 0;
var alertMessage = function() {
  $.ajax({url: "https://api.511.org/transit/servicealerts?format=json&api_key=", success: function(result){
      result._entity.forEach(function(entity) {
        if (entity._alert._informed_entity[0]._agency_id == "MA") {
          alert = entity._alert._description_text._translation[0]._text;
          $("#alert_message").append(alert);
          // TODO: Is this assignent serving a purpose?
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
  // # TODO: Why are you setting a variable for voteIncrement? This just makes
  //         the code where you actually increment (upVote and downVote functions)
  //         harder to read without referncing this line. Just increment by 1 in
  //         those functions, unless you have a compelling reason to change the
  //         incrementation value.
  var voteIncrement = 1;
  // TODO: The click_event variable is unused
  var click_event = 0;
  $(".cog").click(function() {
    // TODO: Remove console logs from production code
      console.log("test");
      $(".dropdownprofile .dropdown-content").show();
      // TODO: Remove legacy and commented-out snippets from production code
      // $(".dropdown-content a").show();
  });

  // TODO: lowerCamelCase class names
  $(".ProfilePhoto").click(function() {
    // TODO: Remove console log
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
    // TODO: You can just write if goto, since empty strings are falsy
    if (goto !== '') {
      window.location = goto;
    }
  }

  $("select").select2({
    placeholder: "See your Muni Route",
  });

  $(".select-navbar").change(function() {
    var goto = this.value;

    // TODO: Remove console log
    console.log(goto);
    redirect(goto);
  });
});
