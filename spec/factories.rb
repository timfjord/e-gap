FactoryGirl.define do
  factory :page do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:content) { |n| "Page content #{n}" }
    published_on { DateTime.current }
    
    factory :published_page do
      published_on { DateTime.current }
    end
    
    factory :unpublished_page do
      published_on nil
    end
  end
end