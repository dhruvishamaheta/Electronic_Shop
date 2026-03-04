<%@ Page Title="" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="service.aspx.cs" Inherits="Electronic_Shop.service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">

    <!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
                    
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Our Service</h1>
								<p class="mb-4">"Experience Quality & Reliable Services – From Seamless Shopping to Expert Support, We’re Here for You!"</p>
								<p><a href="product.aspx" class="btn btn-secondary me-2">Shop Now</a>
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
				<!-- Services Section -->
    <div class="container mt-4">
        <h2 class="text-center section-title mb-4">Our Services</h2>
        <div class="row">
            <!-- Service 1 -->
            <div class="col-md-4">
                <div class="card service-card">
                    <div class="card-body text-center">
                        <i class="fas fa-truck fa-3x text-primary"></i>
                        <h5 class="card-title mt-3">Fast Delivery</h5>
                        <p class="card-text">Get your products delivered within 24 hours.</p>
                    </div>
                </div>
            </div>
            <!-- Service 2 -->
            <div class="col-md-4">
                <div class="card service-card">
                    <div class="card-body text-center">
                        <i class="fas fa-tools fa-3x text-success"></i>
                        <h5 class="card-title mt-3">Repair & Maintenance</h5>
                        <p class="card-text">We provide professional repair services for all item.</p>
                    </div>
                </div>
            </div>
            <!-- Service 3 -->
            <div class="col-md-4">
                <div class="card service-card">
                    <div class="card-body text-center">
                        <i class="fas fa-shield-alt fa-3x text-danger"></i>
                        <h5 class="card-title mt-3">Warranty & Support</h5>
                        <p class="card-text">Enjoy extended warranties and 24/7 customer support.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- How to Order Section -->
    <div class="container mt-5 order-section mb-5">
        <h2 class="text-center section-title mb-4">How to Order</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card service-card">
                    <div class="card-body text-center">
                        <i class="fas fa-search fa-3x text-primary"></i>
                        <h5 class="card-title mt-3">1. Browse Products</h5>
                        <p class="card-text">Explore our wide range of electronics item.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card service-card">
                    <div class="card-body text-center">
                        <i class="fas fa-shopping-cart fa-3x text-primary"></i>
                        <h5 class="card-title mt-3">2. Click On Buy</h5>
                        <p class="card-text">Click 'CheckOut' and proceed to checkout securely.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card service-card">
                    <div class="card-body text-center">
                        <i class="fas fa-credit-card fa-3x text-primary"></i>
                        <h5 class="card-title mt-3">3. Check Order </h5>
                        <p class="card-text">Your Order Into Your Profile.</p>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
	

            </asp:Content>

