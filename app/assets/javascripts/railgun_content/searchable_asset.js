var Railgun = window.Railgun || {};

Railgun.searchableAsset = function(){
  function init($select){
    $select.hide();
    var $selection = $('<div class="asset-selection" />');
    recreateItems($selection, $select);
    $select.on('options:updated', function(){
      recreateItems($selection, $select);
    });
    $selection.sortable({
      stop: function(e, ui) {
        recreateOptions($select, $selection);
      }
    });
    var $search = $('<input type="text" class="search-asset" placeholder="Search assets..." />');
    $search.on('keyup', function(){
      search($search);
    });
    $select.before($search);
    $select.after($selection);
    $('.asset-selection').on('click', 'span.delete', function(){
      var $item = $(this).parent('.asset-selection-item');
      $item.remove();
      $select.children('option[value="'+$item.attr('id')+'"]').remove();
    });
    $(document).on('click', '.asset-results-item', function(){
      var $item = $(this);
      $search.next('.search-asset-results').remove();
      $search.val('');
      var $option = $('<option value="'+$item.attr('id')+'">'+$item.html()+'</option>');
      $option.prop('selected', true);
      $select.append($option);
      addItem($selection, $item.attr('id'), $item.html());
    });
  };

  function search($search){
    var keywords = $search.val();
    if(keywords == ''){
      $search.next('.search-asset-results').remove();
    }else{
      $.get('/admin/assets', {keywords: keywords}, function(data){
        showResults($search, data);
      }, 'json');
    }
  }

  function recreateItems($selection, $select){
    $selection.children('.asset-selection-item').remove();
    $select.children('option').each(function(idx, option){
      var $option = $(option);
      addItem($selection, $option.val(), $option.text());
    });
  }

  function recreateOptions($select, $selection){
    $select.children('option').remove();
    $selection.children('.asset-selection-item').each(function(idx, item){
      var $item = $(item);
      var $option = $('<option value="'+$item.attr('id')+'">'+$item.find('span.name').html()+'</option>');
      $option.prop('selected', true);
      $select.append($option);
    });
  };

  function showResults($search, data){
    $search.next('.search-asset-results').remove();
    var $select = $search.next('.searchable_asset');
    var $results = $('<div class="search-asset-results" />');
    $.each(data, function(idx, item){
      if($results.children('.asset-results-item').length > 4) return false;
      if($select.children('option[value="'+item.id+'"]').length) return;
      var $item = $('<div class="asset-results-item" />');
      $item.html(item.caption);
      $item.attr('id', item.id);
      $results.append($item);
    });
    $search.after($results);
  };

  function addItem($selection, id, name){
    var $item = $('<div class="asset-selection-item" />');
    $item.html('<span class="name">'+name+'</span>');
    $item.attr('id', id);
    $item.append('<span class="delete">x</span>');
    $selection.append($item);
  }

  return {
    init: init
  };
}();

