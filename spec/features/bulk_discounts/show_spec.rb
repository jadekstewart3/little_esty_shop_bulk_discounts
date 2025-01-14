require 'rails_helper'

RSpec.describe 'bulk discounts show page' do
  before :each do 
    @merchant = Merchant.create!(name: 'Hair Care')
    @bulk_discount_1 = @merchant.bulk_discounts.create!(name: "20% off of 10", percentage_discount: 0.20, quantity_threshold: 10)
    visit merchant_bulk_discount_path(@merchant, @bulk_discount_1)
  end

  describe 'as a merchant' do
    context 'when I visit my bulk discount show page' do
      it 'displays the bulk discount attributes' do
        expect(page).to have_content(@bulk_discount_1.name)
        expect(page).to have_content("Discount Percentage: 20.000%")
        expect(page).to have_content("Quantity Threshold: #{@bulk_discount_1.quantity_threshold}")
      end

      it 'displays a link to edit the bulk discount' do
        expect(page).to have_link("Edit #{@bulk_discount_1.name}")
      end

      it 'when I click this link I am taken to an edit form where I can update the bulk discount' do
        click_link "Edit #{@bulk_discount_1.name}"

        expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant, @bulk_discount_1))
      end
    end
  end
end