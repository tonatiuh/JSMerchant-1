class QuantityFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value.to_s =~ /^[1-9]+$/
      object.errors[attribute] << (options[:message] || "is not formatted properly")
    end
  end
end
