Url.create({full_url: "http://google.com"})

150.times do
  url = Url.create({full_url: "http://#{Faker::Internet.domain_name}", view_count: rand(1..100)})
  url.convert_url
end

