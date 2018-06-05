class OfferStepsController < ApplicationController
include Wicked::Wizard
	steps :details, :prices,:privateoffers

	  def show
	  	@offer = Offer.find(session[:offer_id])
    render_wizard
  end

  def update
  @offer = Offer.find(session[:offer_id])

  if offer_params[:min_order_quantity].present?
    @stock = Stock.find(@offer.stock.id)
    new_total_quantity_on_offer = @stock.in_stock_quantity -  offer_params[:total_quantity_on_offer].to_i
    @stock.update_column(:in_stock_quantity,new_total_quantity_on_offer)
  end

   @offer.update(offer_params)
  
  render_wizard @offer
end

def finish_wizard_path
 offers_path
end

private

def offer_params
     params.require(:offer).permit(:stock_id, :sales_man, :allocated_by, :market_price, :selling_price_type, :selling_price, :quantity_type, :size_code, :is_taxable, :enable_negotitation, :visit_store, :total_quantity_on_offer, :min_order_quantity, :start_at, :ends_at, :accepts_offer_below_selling_price, :duration_time, :offer_type, :private_offers, :seller_id,:desc,:order_by, :order_quantity_unit, :net_weight, :packs_per_pellets)
    end
end

