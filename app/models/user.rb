class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :location, dependent: :destroy
  has_one :cart,     dependent: :destroy

  accepts_nested_attributes_for :location, reject_if: :all_blank

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def admin?
  	self.admin
  end

  def full_name
  	first_name + " " + last_name
  end

  # Cart methods

  def add_to_cart(product_id)
    # Assumes existent cart

    cart_id = self.cart.id

    item = Item.where(cart_id: cart_id, product_id: product_id).first_or_create

    # Add the product price to the cart's
    if item.product.offer
      cart.price += item.product.offer.price
    else
      cart.price += item.product.price
    end
    cart.save

    # amount is 0 by default
    item.amount += 1
    item.save
  end

  def remove_from_cart(product_id)
    # Assumes existent cart

    cart_id = self.cart.id
    item = Item.where(cart_id: cart_id, product_id: product_id)
    # Little catch here: an array is returned, so I need the first element:
    item = item.first

    # Substract the product price from the cart's
    if item.product.offer
      cart.price -= item.product.offer.price
    else
      cart.price -= item.product.price
    end
    cart.save

    # If amount is 1, delete, else decrease by one
    if item.amount == 1
      item.delete
    else
      item.amount -= 1
      item.save
    end
  end


end
