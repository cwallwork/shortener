class Url < ActiveRecord::Base
  belongs_to :user

  validates :full_url, uri: true 
  before_create :convert_url

  def convert_url
    converted_url = self.id.to_i.to_s(36)
  end
end
