namespace :carts do
  desc "TODO"
  task delete_delivered_carts: :environment do
  	Cart.where(delivered: true).destroy_all
  end

end
