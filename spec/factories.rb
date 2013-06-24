FactoryGirl.define do
  factory :page do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:content) { |n| "Page content #{n}" }
    published_on { DateTime.current }
  end
end