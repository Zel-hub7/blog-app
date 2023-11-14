# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      name { 'John Doe' }
      photo { 'example.jpg' }
      bio { 'A test bio' }
      posts_counter { 0 }
    end
end
  