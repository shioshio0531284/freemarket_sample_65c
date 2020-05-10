class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_item

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    if (charge = true)
      @item = @item.update(buyer_id: current_user.id)
      redirect_to action: 'done'
    else
      redirect_to item_path(@item.id)
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
