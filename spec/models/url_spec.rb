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

  it "returns a url from the database (if present) instead of creating a new one" do
    url = build(:url)
    Url.find_or_save(url)
    url2 = build(:url, full_url: url.full_url)
    url2 = Url.find_or_save(url2)
    expect(url2).to eq(url)
  end

  it "returns an error if we try to search and return an invalid url" do
    url = build(:invalid_url)
    Url.find_or_save(url)
    expect(url.errors.messages[:full_url]).to include("The entered URL is invalid")
  end
end