# spec/factories/posts.rb

FactoryBot.define do
  factory :post do
    association :author, factory: :user
    title { 'Post Title' }
    text { 'Post Content' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
