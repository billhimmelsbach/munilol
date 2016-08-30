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

// $(document).on('page:change', function(event) {
//   // idempotent function
// });
// function displayAlert
var api_called = 0;
$(document).on('ready', function(){
  console.log("go!");
  if (api_called == 1) {
    console.log("eject");
    return;
  }
  $.ajax({url: "http://api.511.org/transit/servicealerts?format=json&api_key=<%= ENV['511_KEY'] %>", success: function(result){
      console.log("works!");
      result._entity.forEach(function(entity) {
        if (entity._alert._informed_entity[0]._agency_id == "MA") {
          console.log(entity._alert._description_text._translation[0]._text);
          alert = entity._alert._description_text._translation[0]._text;
          $("#alert_message").append(alert);
          api_called++;
        }
      });
   }});
});
$(document).on('turbolinks:load', function(){
  console.log("TURBO");
  function redirect(goto){
    if (goto !== '') {
      window.location = goto;
    }
  }
  $("select").select2({
    placeholder: "See your Muni Route",
  });
  $("select").change(function() {
    var goto = this.value;
    console.log(goto);
    redirect(goto);
  });
});
//   $.ajax({url: "http://api.511.org/transit/servicealerts?format=json&api_key=<%= ENV['511_KEY'] %>", success: function(result){
//       console.log("works!");
//       result._entity.forEach(function(entity) {
//         if (entity._alert._informed_entity[0]._agency_id == "MA") {
//           console.log(entity._alert._description_text._translation[0]._text);
//           alert = entity._alert._description_text._translation[0]._text;
//           $("#alert_message").append(alert);
//         }
//       });
//    }});
// });

// function redirect(goto){
//   if (goto !== '') {
//       window.location = goto;
//   }
// }
// //
// // var selectEl = document.getElementById('redirectSelect');
// //
// // selectEl.onchange = function(){
// //     var goto = this.value;
// //     redirect(goto);
// //
// // };
//
//
// $(document).on('ready', function() {
//   console.log("ready");
//
//   $("select").select2({
//     placeholder: "See your Muni Route",
//   });
//
//   $("select").change(function() {
//     var goto = this.value;
//     console.log(goto);
//     redirect(goto);
//   });
//
// });
//
// $(document).on('page:change', function() {
//   console.log("ready");
//
//   $("select").select2({
//     placeholder: "See your Muni Route",
//   });
//
//   $("select").change(function() {
//     var goto = this.value;
//     console.log(goto);
//     redirect(goto);
//   });
//
// });
// //
// // var go = function() {
// //   console.log("ready");
// //
// //   $("select").select2({
// //     placeholder: "See your Muni Route",
// //   });
// //
// //   $("select").change(function() {
// //     var goto = this.value;
// //     console.log(goto);
// //     redirect(goto);
// //   });
// // };
// //
// // $(document).ready(go());
// // $(document).on('page:load', go());
