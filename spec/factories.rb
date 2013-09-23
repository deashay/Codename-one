FactoryGirl.define do
  factory(:user) do
    sequence(:email) { |i| "email#{i}@gmail.com" }
    password 'password123'
    password_confirmation 'password123'
  end

  factory(:world) do
    sequence(:name) { |i| "new world#{i}" }
    width 4
    height 4
  end

  factory(:race) do
    sequence(:name) { |i| "new race#{i}" }
  end
end
