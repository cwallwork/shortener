require 'spec_helper'
require 'byebug'

describe Url do
  

  it "is invalid with an invalid url" do
    url = build(:invalid_url)
    url.valid?
    expect(url.errors.messages[:full_url]).to include("The entered URL is invalid")
  end

  it "is valid with a valid url not already in database" do
    url = build(:url)
    expect(url).to be_valid
  end

  it "returns a list of 100 popular urls" do
    popular = Url.popular
    expect(popular.length).to eq(100)
  end
end