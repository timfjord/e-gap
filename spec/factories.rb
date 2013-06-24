FactoryGirl.define do
  factory :page do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:content) { |n| "Page content #{n}" }
    
    factory :published_page do
      published_on { 1.day.ago }
    end
    
    factory :unpublished_page do
      published_on nil
    end
  end
end