<%@ Page Title="" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Electronic_Shop.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
				<!-- Start Hero Section -->
			<div class="hero">
                <div class="container">
                    <div class="row justify-content-between">
                        <div class="col-lg-5">
                            <div class="intro-excerpt">
                                <h1>Electronic Shop<span clsas="d-block"> One-Stop Tech Destination!</span></h1>
                                <p class="mb-4">
                                    Explore our wide range of high-quality electronics, from smart gadgets to home appliances. Get the best deals on TVs, refrigerators, mobile phones, and more!  <p>
                                    <a href="product.aspx" class="btn btn-secondary me-2">Shop Now</a><a href="About.aspx" class="btn btn-white-outline">Explore</a></p>
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

		<!-- Start Product Section -->
<div class="product-section">
    <div class="container">
        <div class="row justify-content-center text-center">

            <!-- Start Column 1 -->
            <div class="col-md-12 col-lg-6">
                <h1 class="mb-4 section-title">Crafted with Cutting-Edge Technology.</h1>
                <p class="mb-4">
                    Experience innovation with our premium selection of high-performance electronics. 
                    From smart gadgets to home appliances, we bring you the best in technology and design.
                </p>
                <!-- Explore More Button Moved Here -->
                <a href="about.aspx" class="btn btn-primary">Explore More</a>
            </div>
            <!-- End Column 1 -->

            <!-- Start Product Column -->
            <div class="col-12 col-md-6 col-lg-4">
                <a class="product-item" href="product.aspx">
                    <img src="images/image.png" class="img-fluid product-thumbnail"> <!-- Update with your image -->
                    <h3 class="product-title">Modern Electronic Product</h3>
                    <strong class="product-price">₹45,000.00</strong>
                </a>
            </div>
            <!-- End Product Column -->

        </div>
    </div>
</div>
<!-- End Product Section -->



		<!-- Start Why Choose Us Section -->
		<div class="why-choose-section">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-6">
                        <h2 class="section-title">Why Choose Us</h2>
                        <p>At Electronic Shop, we bring you the best in electronics with quality, convenience, and reliability. Shop with confidence and enjoy seamless service every step of the way.</p>
                        <div class="row my-5">
                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/truck.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>Fast &amp; Free Shipping</h3>
                                    <p>
                                        Get your favorite gadgets delivered to your doorstep with quick and free shipping options</p>
                                </div>
                            </div>
                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/bag.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>Easy to Shop</h3>
                                    <p>
                                       A user-friendly platform that makes buying electronics hassle-free and convenient..</p>
                                </div>
                            </div>
                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/support.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>24/7 Support</h3>
                                    <p>
                                        Our dedicated support team is available round the clock to assist you with any queries..</p>
                                </div>
                            </div>
                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/return.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>Hassle Free Returns</h3>
                                    <p>
                                        Not satisfied with your purchase? Enjoy easy returns and exchanges without complications.</p>
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

		<!-- Start We Help Section -->
		<div class="we-help-section">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="imgs-grid">
                            <div class="grid grid-1">
                                <img src="images/dis1.jpg" alt="Untree.co"></div>
                            <div class="grid grid-2">
                                <img src="images/dis2.jpg" alt="Untree.co"></div>
                            <div class="grid grid-3">
                                <img src="images/dis3.jpg" alt="Untree.co"></div>
                        </div>
                    </div>
                    <div class="col-lg-5 ps-lg-5">
                        <h2 class="section-title mb-4">Electronic Shop – Your One-Stop Tech Destination!</h2>
                        <p>
                       "Explore a premium collection of smartwatches, wireless headphones, and innovative speakers designed to enhance your everyday life. Whether you're looking for sleek style, top-notch sound, or smart convenience, we’ve got the perfect gadget for you!" </p>  <ul class="list-unstyled custom-list my-4">
                            <li> Experience the latest in wearable tech with our sleek smartwatches.</li>
                            <li>Immerse yourself in high-quality audio with premium wireless headphones</li>
                            <li> Enhance your space with cutting-edge smart speakers and gadgets.</li>
                            <li>Stay ahead with innovative, stylish, and feature-packed devices.</li>
                        </ul>
                        <p>
                              <a href="product.aspx" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
    </div>
		<!-- End We Help Section -->

		

		
            </asp:Content>

