class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  has_many :items, through: :merchant
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  validates_presence_of :name,
                        :percentage_discount,
                        :quantity_threshold
end
