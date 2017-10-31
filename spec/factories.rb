require "factory_bot"

FactoryBot.define do
  factory :robot do
    color Board::COLORS.first
  end

  factory :board do
  end

  factory :solution do
  end

  factory :space do
  end
end
