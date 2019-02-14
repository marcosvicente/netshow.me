FactoryBot.define do
  factory :video do
    name { Faker::Movie.quote }
    url { 'music.m3u8' }
    view 
  end
end
