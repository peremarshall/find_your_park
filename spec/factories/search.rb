FactoryBot.define do
  factory :search do

    searchable_type { "Park" }

    trait :with_certain_criteria do
      criteria { '[["name_cont", "al"], ["description_cont", "and"]]' }
    end

    trait :with_different_criteria do
      criteria { '[["name_cont", "am"], ["description_cont", "and"]]' }
    end
  end
end
