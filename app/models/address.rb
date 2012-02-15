class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip

  belongs_to :user
  has_many :orders

  validates_presence_of :line1, :city, :state, :zip

  default_scope :order => 'updated_at DESC'

  def to_s
    return "#{line1}, #{line2 + ", " if !line2.blank?}#{city}, #{state} #{zip}"
  end
end
