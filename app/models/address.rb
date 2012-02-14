class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip

  belongs_to :user
  has_many :orders

  validates_presence_of :line1, :city, :state, :zip

  def to_s
    return "#{line1}, #{line2 + ", " if line2}#{city}, #{state} #{zip}"
  end
end
