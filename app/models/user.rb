class User < ActiveRecord::Base

  before_create :add_token
  after_create  :send_welcome_email

  VALID_PHONE_REGEX = /^[0-9]+$/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :location, dependent: :destroy
  has_one :cart,     dependent: :destroy

  accepts_nested_attributes_for :location, reject_if: :all_blank
  validates_presence_of :location
  validates_associated  :location

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone,      presence: true, format: { with: VALID_PHONE_REGEX, multiline: true }, 
                         length: { in: 8..9 }
  validates :address,    presence: true

  def admin?
  	self.admin
  end

  def full_name
  	first_name + " " + last_name
  end

  scope :search, lambda {|search| 
    if search != "" && search
      # Good enough for now
      where("first_name LIKE ? or last_name LIKE ?", "%#{search.split(' ').first}%", "%#{search.split(' ').last}%")
    else
      all
    end
  }
  

  # Cart methods


  def add_to_cart(product_id)
    # Assumes existent cart

    cart_id = self.cart.id

    item = Item.where(cart_id: cart_id, product_id: product_id).first_or_create

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

    # If amount is 1, delete, else decrease by one
    if item.amount == 1
      item.delete
    else
      item.amount -= 1
      item.save
    end
  end


  # Rating methods

  def rating
    # Getter method, which cuts the number to one decimal place
    self.rating_average.round(1)
  end

  def round_rating
    # Returns rounded rating value. For values higher than x.5, returns x + 1, otherwise x.
    # Example: 2.5 -> returns 3
    # Example 2: 1.2 -> returns 1 
    
    round = (rating_average - 0.49).ceil
  end

  private

    def add_token
      begin
        self.token = SecureRandom.urlsafe_base64.upcase
      end while self.class.exists?(token: token)
    end


    def send_welcome_email
      #UserMailer.welcome_email(self).deliver_now
    end

end
