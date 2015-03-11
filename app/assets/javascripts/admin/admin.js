//= require jquery
//= require jquery_ujs
//= require spacelab/loader
//= require spacelab/bootswatch
//= require jquery-ui
//= require jquery.ui.nestedSortable
//= require sortable_tree/initializer
//= require kindeditor

$(document).ready(function(){
  $("#index_images_list").sortable({
    update: function(event, ui) {
      var url = "/admin/settings/" + ui.item.attr("id").slice(6) + "/sort";

      $.ajax({
        url: url,
        type: 'post',
        data: { position: ui.item.index() + 1 },
        success: function() { }
      });
    }
  });

  $('#edit_index_image').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var image_id = button.data('id'); // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

    image_link = $("#index_" + image_id + " .index_image_link a").text();
    var modal = $(this);
    $("#edit_index_image form").attr("action", "/admin/settings/" + image_id + "/update_link");
    $("#modal_photo").empty().append($("#index_" + image_id + " .index_image_photo").children().clone());
    $("#modal_link").val(image_link);
  });

  $("#modal_submit").click(function(){
    $('#edit_index_image form').submit();
  });
});