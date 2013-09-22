FactoryGirl.define do
  factory(:user) do
    email 'new@email.com'
    password 'password123'
    password_confirmation 'password123'
  end

  factory(:world) do
    name 'new world'
    width 4
    height 4
  end

  factory(:race) do
    name 'orks'

    factory(:invalid_race) do
      name ''
    end
  end
end
