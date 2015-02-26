FactoryGirl.define do
  factory :url do 
    full_url "http://notalreadyindatabase.com"
    
  

  factory :invalid_url do
    full_url "google"
  end
  
  end
end