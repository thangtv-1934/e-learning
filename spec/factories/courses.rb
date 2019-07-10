FactoryBot.define do
  factory :course do
    name {FFaker::Name.name}
    image {FFaker::Image.url size = "300x300", format = "png", bg_color = :random, text_color = :random, text = nil}
    description {FFaker::Lorem.paragraph 2}
  end
end
