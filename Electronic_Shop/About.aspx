<%@ Page Title="" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Electronic_Shop.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
				
	
	<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>About Us</h1>
						<p class="mb-4">Welcome to <strong>Electronic Shop</strong>, your one-stop destination for the latest electronics! We specialize in offering high-quality gadgets, accessories, and home appliances at unbeatable prices. Customer satisfaction is our priority, and we strive to provide the best shopping experience possible.</p>
						<!--<p><a href="shop.aspx" class="btn btn-secondary me-2">Shop Now</a>-->
						
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
                                <img src="images/new.png" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->

	<!-- Start Why Choose Us Section -->
	<div class="why-choose-section">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-6">
					<h2 class="section-title">Why Choose Us?</h2>
					<p>At Electronic Shop, we offer a seamless shopping experience with top-quality products, fast delivery, and exceptional customer service. Here’s why we stand out:</p>

					<div class="row my-5">
						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/truck.svg" alt="Fast & Free Shipping" class="img-fluid">
								</div>
								<h3>Fast & Free Shipping</h3>
								<p>We provide express delivery across multiple locations at no extra cost.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/bag.svg" alt="Easy Shopping" class="img-fluid">
								</div>
								<h3>Easy Shopping</h3>
								<p>Our user-friendly platform makes finding and purchasing products effortless.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/support.svg" alt="24/7 Support" class="img-fluid">
								</div>
								<h3>24/7 Support</h3>
								<p>Our dedicated support team is available around the clock to assist you.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/return.svg" alt="Hassle-Free Returns" class="img-fluid">
								</div>
								<h3>Hassle-Free Returns</h3>
								<p>Enjoy stress-free returns and exchanges within 7 days of purchase.</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-lg-5">
					<div class="img-wrap">
                            <img src="images/brand.jpg" alt="Image" class="img-fluid">
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End Why Choose Us Section -->

	<!-- Start FAQ Section -->
	<!-- Start FAQ Section -->
<div class="container mt-5 mb-5" id="faqs">
    <h2 class="text-center section-title mb-4">Frequently Asked Questions (FAQs)</h2>
    <div class="accordion" id="faqAccordion">

        <!-- FAQ Item 1 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="faqHeading1">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse1" aria-expanded="true">
                    How can I place an order?
                </button>
            </h2>
            <div id="faqCollapse1" class="accordion-collapse collapse show" aria-labelledby="faqHeading1" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Placing an order is simple! Browse our products, add items to your cart, proceed to checkout, and make a payment. You will receive a confirmation email once your order is placed.
                </div>
            </div>
        </div>

        <!-- FAQ Item 2 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="faqHeading2">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse2">
                    What payment methods do you accept?
                </button>
            </h2>
            <div id="faqCollapse2" class="accordion-collapse collapse" aria-labelledby="faqHeading2" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    We accept payments via credit/debit cards, PayPal, Google Pay, Apple Pay, and cash on delivery (COD) for select locations.
                </div>
            </div>
        </div>

        <!-- FAQ Item 3 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="faqHeading3">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse3">
                    How can I track my order?
                </button>
            </h2>
            <div id="faqCollapse3" class="accordion-collapse collapse" aria-labelledby="faqHeading3" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Once your order is shipped, we will send you a tracking link via email and SMS. You can also check your order status on the "My Orders" page.
                </div>
            </div>
        </div>

        <!-- FAQ Item 4 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="faqHeading4">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse4">
                    What is your return policy?
                </button>
            </h2>
            <div id="faqCollapse4" class="accordion-collapse collapse" aria-labelledby="faqHeading4" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    We offer a 7-day return policy for unused and undamaged products. To initiate a return, go to "My Orders" and request a return.
                </div>
            </div>
        </div>

    </div>
</div>
<!-- End FAQ Section -->

	<!-- End FAQ Section -->

            </asp:Content>

