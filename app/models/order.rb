class Order < ActiveRecord::Base
	belongs_to :client, :autosave => true
	has_many :detailorders, :autosave => true
	accepts_nested_attributes_for :detailorders
end
