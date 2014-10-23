// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery.ui.all
//= require railgun_content/lib/jquery-migrate
//= require railgun_content/lib/chosen/chosen.jquery

jQuery.migrateMute = true;

$(document).ready(function(){

  $("ul.pages").on("ajax:success", ".resource-delete", function(event, data){
    $("ul.pages li[role='"+data.id+"']").fadeTo(400, 0)
    $("ul.pages li[role='"+data.id+"']").slideUp(400, function(){
      $(this).remove();
    })
  });

  Railgun.init.chosen();
  Railgun.init.redactor();

  Railgun.init.sortable();
  Railgun.init.sortable($("ul.pages"), {collapse: "> ul.pages"});
  Railgun.init.sortable($(".block-components .aligned"), {axis: false, items: "> .block-component", connectWith: "> .aligned", collapse: "[data-sort-collapse-component]", ajaxData: function(row, i){
    var role = row.parent().attr("role");
    console.log(role);
    if(["left", "right"].indexOf(role) > -1 ){
      return 'insert_at=' + i + "&alignment=" + role;
    }else{
      return 'insert_at=' + i;
    }
  }});
  $(".block-components .aligned").each(function(){
    var container = $(this),
        collection = container.siblings().andSelf();
    container.sortable( "option", "connectWith", collection );
  });

});

window.Railgun = {
  init: {
    chosen: function(el){
      if(!el){
        el = $('.chosen-select');
      }
      el.chosen({
        allow_single_deselect: true,
        allow_sortable: true,
        no_results_text: 'No results matched',
        width: '200px'
      });
    },

    redactor: function(el){
      if(!el){
        el = $('.redactor')
      }
      var csrf_token = $('meta[name=csrf-token]').attr('content');
      var csrf_param = $('meta[name=csrf-param]').attr('content');
      var params;
      if (csrf_param !== undefined && csrf_token !== undefined) {
        params = csrf_param + "=" + encodeURIComponent(csrf_token);
      }
      var default_options = { "imageUpload":"/redactor_rails/pictures?" + params,
        "imageGetJson":"/redactor_rails/pictures",
        "fileUpload":"/redactor_rails/documents?" + params,
        "fileGetJson":"/redactor_rails/documents",
        "path":"/assets/admin/redactor-rails",
        "css":"style.css",
        "buttons":['html', '|', 'formatting', '|', 'bold', 'italic', 'deleted', '|', 'unorderedlist', 'orderedlist', 'outdent', 'indent', '|', 'image', 'video', 'table', 'link', '|', 'horizontalrule'],
        "convertDivs": false,
        "minHeight": 200
      }
      el.redactor(
        default_options
      );
    },

    sortable: function(el, options){
      if(!el){
        el = $(".sortable");
      }
      default_options = {
        axis: "y",
        items: "> *",
        collapse: "[data-sort-collapse]",
        ajaxData: function(row, i){
          return 'insert_at=' + i;
        },
        connectWith: false
      }
      options = $.extend(default_options, options);
      el.sortable({
        axis: options.axis,
        handle: '.handle',
        placeholder: 'placeholder',
        items: options.items,
        connectWith: options.connectWith,
        start: function(e, ui){
          var $row = ui.item;
          var sortable = $(this);
          $row.find(options.collapse).each(function(){
            $(this).data("height", $(this).height());
            $(this).animate({
              height:0,
              opacity:0
            }, 200, function(){
              $row.height("");
              $row.height($row.height());
              sortable.sortable('refreshPositions');
            });
          });
        },
        stop: function(e, ui) {
          var $row = ui.item,
              $collection = $row.siblings().andSelf();
          $row.find(options.collapse).each(function(){
            collapsible = $(this);
            var height = collapsible.data("height");
            collapsible.animate({
              height:height,
              opacity:1
            }, 200, function(){
              collapsible.height("");
            });
          });

          // update the page position
          var i = ($collection.index($row)) + 1;
          $.ajax($row.attr('data-update-position-path'), {
            type: 'PUT',
            data: options.ajaxData($row, i)
          });
        }
      });
    }
  }
}
