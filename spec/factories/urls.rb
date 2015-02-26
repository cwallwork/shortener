FactoryGirl.define do
  factory :url do 
    full_url "http://notalreadindatabase.com"
    
  

  factory :invalid_url do
    full_url "google"
  end
  
  end
end