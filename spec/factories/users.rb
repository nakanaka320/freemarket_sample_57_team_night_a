FactoryBot.define do

  factory :user do
    nickname              {"ゴン"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"ゴン"}
    last_name             {"フリークス"}
    first_name_kana       {"ゴン"}
    last_name_kana        {"フリークス"}
    birthday_year         {"1990"}
    birthday_month        {"5"}
    birthday              {"7"}
    phone_number          {"05055550000"}
    post_number           {"5055050"}
    prefecture            {"5"}
    city                  {"言"}
    street                {"5"}
    building              {"未記入"}
  end
  
end