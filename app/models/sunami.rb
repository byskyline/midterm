class Sunami < ActiveRecord::Base

belongs_to :category
has_many :attendees

end
