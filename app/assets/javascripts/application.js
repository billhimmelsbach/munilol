// // This is a manifest file that'll be compiled into application.js, which will include all the files
// // listed below.
// //
// // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// // or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
// //
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // compiled file.
// //
// // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// // about supported directives.
// //
// //= require jquery
// //= require jquery_ujs
// //= require turbolinks
// //= require_tree .
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
