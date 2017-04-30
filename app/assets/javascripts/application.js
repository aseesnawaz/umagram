// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on({
    dblclick: function () {
      $(this).css({
        width: "600px",
        height: "600px",
        opacity: 1,
      });
    },

    click: function () {
      $(this).css({
        width: "300px",
        height: "300px",
      });
    }
}, '#myImg');

$(document).ready(function(){
  $("#guest_button").click(function(){
      document.getElementById('un').value = 'guest17';
      document.getElementById('pass').value = 'sheepk495';
      document.forms[0].submit()
  });
});




var commentMachine = function($el){
  this.$comments = $el.find('ul');
  this.$form = $el.find('form');
  this.$form.on('submit', this.submitComment.bind(this));
};

commentMachine.prototype.submitComment = function (e) {
  e.preventDefault();
  $.ajax({
    method: 'POST',
    url: '/comments',
    dataType: 'json',
    data: this.$form.serialize(),
    success: function(comment){
      this.addComment(comment);
      this.clearForm();
    }.bind(this)
  });
};

commentMachine.prototype.addComment = function (comment) {
  var $comment = $('<li>').text(comment.body);
  this.$comments.append($comment);
};

commentMachine.prototype.clearForm = function () {
  this.$form.find("input[type='text']").val("");
};
