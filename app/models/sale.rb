class Sale < ActiveRecord::Base

	belongs_to :client, :autosave => true
	has_many :detailSales, :autosave => true
	accepts_nested_attributes_for :detailSales
end
