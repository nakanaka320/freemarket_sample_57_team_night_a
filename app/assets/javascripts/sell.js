//画像投稿
$(document).on('turbolinks:load', ()=> { 
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="sellitem[images_attributes][${num}][gazou]"
                    id="sellitem_images_attributes_${num}_gazou"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="123px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { 
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

//カテゴリー
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

$(function(){
  $('.sell-price-input__box').on('input', function(){ 
    var data = $('.sell-price-input__box').val(); 
    var profit = Math.round(data * 0.9) 
    var fee = (data - profit) 
    $('.right.zeikin').html(fee) 
    $('.right.zeikin').prepend('¥')
    $('.right.uriage').html(profit)
    $('.right.uriage').prepend('¥')
    $('#price').val(profit)
    if(profit == '') { 
    $('.right.uriage').html('');
    $('.right.zeikin').html('');
    }
  })
});