FactoryGirl.define do
  factory :url do 
    full_url "http://google.com"
    
  

  factory :invalid_url do
    full_url "google"
  end
  
  end
end