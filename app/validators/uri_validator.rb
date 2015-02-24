require 'uri'

class UriValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
      unless value =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
        object.errors[attribute] << (options[:message] || "The entered URL is invalid")
      end
  end
end