set :output, "#{path}/log/cron.log"
set :environment, "development"
# set :environment, "production"

every 30.minutes do
	rake "carts:delete_delivered_carts"
	rake "carts:delete_cancelled_carts"
end