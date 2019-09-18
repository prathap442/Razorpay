require 'razorpay'
require 'pry'
# To setup razorpay we require apikey and secret which we setthem up here
c = Razorpay.setup('rzp_test_U5Ix5AmFWGghQc','y3MxlsC8vOz5FTp4ml6DtIwr')
headers = {"Fascino" => "Cascino"}# we can add additonal request headers to the apis by using this
receipt_value = Random.rand(4567)
order = Razorpay::Order.create(amount: 5000, currency: 'INR', receipt: "#{receipt_value}_test")
puts order
# the status of the order has got 3 possible values that is created,attempted and paid 
# An Order moves from created to attempted state when a payment request is first 
# made on that Order. It remains in the attempted state till any payment associated with that Order is captured. After the successful capture of the payment, Order moves to the paid state. No further payment requests are permitted after the Order attains the paid state.
all_customers = Razorpay::Customer.all
# customer = Razorpay::Customer.create email: 'pmohansaikrishna@gmail.com', contact: '9876543210'
# customer = Razorpay::Customer.create email: 'prathap.mohan@kloctechnologies.co.in',contact: '9972339927'
invoice = Razorpay::Invoice.create customer_id: "cust_DJa1ojaKO51JY9", amount: 100, currency: 'INR', description: 'Test description', type: 'link'
puts invoice