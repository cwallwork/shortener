require 'byebug'

class Url < ActiveRecord::Base
  belongs_to :user

  validates :full_url, uri: true 
  validates :full_url, uniqueness: true
  after_save :convert_url

  attr_accessible :full_url, :view_count, :converted_url

  scope :popular, -> {order("\"view_count\" desc").limit(100)}

  def self.find_or_save(url)

    if find_current(url.full_url)
      return find_current(url.full_url)
    else
      url.save
      url
    end
  end

  def self.find_current(full_url)
    Url.where(full_url: full_url).first
  end

  def convert_url
    if !self.converted_url
      self.update_attributes(converted_url: self.id.to_i.to_s(36))
    end
  end

  private

  
end
