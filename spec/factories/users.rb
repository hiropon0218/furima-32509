FactoryBot.define do
  factory :user do
    
    
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    nickname               {Gimei.name}
    last_name_kanji        {Gimei.last.kanji }
    first_name_kanji       {Gimei.first.kanji}
    last_name_katakana     {Gimei.last.katakana}
    first_name_katakana    {Gimei.first.katakana}
    birthday               {Faker::Time.between(from: DateTime.now - 100, to: DateTime.now)}
  
  end

  
end
