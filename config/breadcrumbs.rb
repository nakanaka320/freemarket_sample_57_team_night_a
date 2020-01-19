crumb :root do
  link "Home", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
end

crumb :profile do
  link "プロフィール", profile_mypages_path
  parent :mypage
end

crumb :card do
  link "支払い方法", card_mypages_path
  parent :mypage
end

crumb :card_new do
  link "支払い方法入力", card_new_mypages_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypage
end



# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).