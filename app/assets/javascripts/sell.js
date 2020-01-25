$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});





$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
      childSelectHtml =  `<div class="select-selecter2">
                            <select class="select-wrap__holder" name="sellitem[category_id]" id="sellitem_category_id2">
                              ${insertHTML}
                            </select>
                          </div>`;
    $('.select-selecter').append(childSelectHtml);
  }

  function appendgrandChidrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class="select-selecter3">
                                  <select class="select-wrap__holder" name="sellitem[category_id]" id="sellitem_category_id3">
                                    ${insertHTML}
                                  </select>
                                </div>`;
    $('.select-selecter2').append(grandchildrenSelectHtml);
  }

  $(document).on('change', '#sellitem_category_id', function(){
  var productcategory = document.getElementById('sellitem_category_id').value; 
    if (productcategory != ''){
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){  
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');

      })
    }
  });


  $(document).on('change', '#sellitem_category_id2', function(){
    var productcategory = document.getElementById('sellitem_category_id2').value;
    if (productcategory != ''){
    $.ajax ({
      url: 'category_grandchildren',
      type: 'GET',
      data: { productcategory: productcategory },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });
});

