<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Yashika!</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sticky-footer-navbar.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    body {
        background: linear-gradient(135deg, #f8fafc 0%, #e0e7ff 100%);
        color: #22223b;
    }
    header h1 {
        color: #3a86ff;
        font-weight: 700;
        letter-spacing: 2px;
        margin-bottom: 20px;
    }
    #tabs ul {
        background: #3a86ff;
        border-radius: 8px 8px 0 0;
    }
    #tabs ul li a {
        color: #fff !important;
        font-weight: 600;
    }
    #tabs .ui-tabs-panel {
        background: #fff;
        border-radius: 0 0 8px 8px;
        box-shadow: 0 2px 8px rgba(58,134,255,0.08);
        padding: 24px;
    }
    footer {
        background: #3a86ff;
        color: #fff;
        padding: 16px 0;
        text-align: center;
        border-radius: 8px;
        margin-top: 40px;
    }
    .online-features {
        background: #e0e7ff;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 32px;
        box-shadow: 0 2px 8px rgba(58,134,255,0.08);
    }
    .online-features h2 {
        color: #3a86ff;
        font-size: 1.5rem;
        margin-bottom: 16px;
    }
    .feature-list {
        list-style: none;
        padding: 0;
    }
    .feature-list li {
        margin-bottom: 12px;
        font-size: 1.1rem;
    }
    .feature-list i {
        color: #3a86ff;
        margin-right: 8px;
    }
</style>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>

	<div class="container">
        <div class="online-features mt-4">
            <h2><i class="fa-solid fa-globe"></i> Online Features</h2>
            <ul class="feature-list">
                <li><i class="fa-solid fa-user-plus"></i> User Registration & Login</li>
                <li><i class="fa-solid fa-cart-shopping"></i> Shopping Cart & Checkout</li>
                <li><i class="fa-solid fa-credit-card"></i> Secure Online Payments</li>
                <li><i class="fa-solid fa-truck"></i> Order Tracking & Delivery Updates</li>
                <li><i class="fa-solid fa-comments"></i> Live Chat Support</li>
                <li><i class="fa-solid fa-star"></i> Product Reviews & Ratings</li>
                <li><i class="fa-solid fa-bell"></i> Push Notifications for Offers</li>
                <li><i class="fa-solid fa-mobile"></i> Mobile Responsive Design</li>
            </ul>
        </div>

		<header>
			<h1>Yashika Retail Store</h1>
		</header>

		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Fashion</a></li>
				<li><a href="#tabs-2">Electronics</a></li>
				<li><a href="#tabs-3">Groceries</a></li>
				<li><a href="#tabs-4">Mobiles</a></li>
				<li><a href="#tabs-5">Appliances</a></li>
			</ul>
			<div id="tabs-1">
				<p>There are enough rules in life as it is. Some, however, are there to help. Like the rules that govern how to dress well. Of course, every man or woman that has an opinion on such things speaks from personal experience – and no doubt what works for one doesn’t always work for another; or what works for one is considered too pedestrian or too avant-garde by another. So, when it comes to dressing, they always have to be taken at face value. They’re solid suggestions rather than the last word on style.

                <But good advice is never to be sniffed at, and, as menswear becomes ever more rich and varied, ever more experimental and abundant, ever more trend-aware, in moments of confusion and self-doubt, it can help to have a valuable fall-back position that cuts through the clutter.There are enough rules in life as it is. Some, however, are there to help. Like the rules that govern how to dress well. Of course, every man or woman that has an opinion on such things speaks from personal experience – and no doubt what works for one doesn’t always work for another; or what works for one is considered too pedestrian or too avant-garde by another. So, when it comes to dressing, they always have to be taken at face value.</p>
                <p>This resource deals with the general and helpful tips/ habits which saves the electricity (reduce energy) when using electrical/electronic appliances like TV, refrigerator, air conditioner, dishwasher, computer, oven, hairdryer etc. You have to be very careful to save the electricity by proper care and handling while using electronic/electrical appliances.</p>
			</div>
			<div id="tabs-2">
				<p>Best Washing machine in India to buy in Rs.15000 in 2012
Do you want to buy a Automatic washing machine in the price range up to Rs15,000/-. Here we are going to choose five best washing machine of different companies and check their suitability and properties for the price range.</p>
                <p>This resource deals with the general and helpful tips/ habits which saves the electricity (reduce energy) when using electrical/electronic appliances like TV, refrigerator, air conditioner, dishwasher, computer, oven, hairdryer etc. You have to be very careful to save the electricity by proper care and handling while using electronic/electrical appliances.</p>
			</div>
			<div id="tabs-3">
				<p>Everybody eats - the act of buying food will never go away - but how we buy food will certainly evolve. The future of shopping will focus more on experience and creative more seamless experiences. This doesn’t necessarily mean a robotic cashier-less check-out process, but an experience customers want to have. The future of grocery is all about customer-choice - giving customers the options they want at every stage of their lives.</p>
			</div>
			<div id="tabs-4">
				<p>OnePlus</p>
				<p>Apple</p>
				<p>LG</p>
				<p>MI</p>
				<p>Samsung</p>
			</div>
			<div id="tabs-5">
				<p>A home appliance, also referred to as a domestic appliance, an electric appliance or a household appliance, is a machine which assists in household functions such as cooking, cleaning and food preservation</p>	
			</div>
		</div>

	</div >

	<div class="container">
		<footer> Copyright &copy; Yashika Pvt. Ltd. </footer>
	</div>

</body>
</html>

