FactoryBot.define do
  factory :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {FFaker::Lorem.characters 6}
    avatar {FFaker::Image.url size = "300x300", format = "png", bg_color = :random, text_color = :random, text = nil}
    is_admin {true}
  end
end
