<%@ Page Title="" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Electronic_Shop.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    .contact-info-block {
      background-color: #f8f9fa;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      text-align: center;
    }

    .contact-info-block h5 {
      font-weight: bold;
      color: #333;
      margin-bottom: 10px;
    }

    .contact-info-block p {
      margin: 0;
      font-size: 15px;
      color: #555;
    }

    .form-section {
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .form-group label {
      font-weight: 500;
      margin-bottom: 5px;
    }

    .form-control {
      border-radius: 6px;
      border: 1px solid #ccc;
      padding: 10px 15px;
      font-size: 14px;
      width: 100%;
    }

    .btn-primary-hover-outline {
      background-color: #198754;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      font-weight: 500;
    }

    .btn-primary-hover-outline:hover {
      background-color: #145c3f;
    }

    .required::after {
      content: " *";
      color: red;
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">

<!-- Hero Section -->
<div class="hero">
  <div class="container">
    <div class="row justify-content-between">
      <div class="col-lg-5">
        <div class="intro-excerpt">
          <h1>Contact</h1>
          <p class="mb-4">"Get in Touch – We're Here to Help! Reach Out for Assistance, Queries, or Support Anytime."</p>
          <p><a href="product.aspx" class="btn btn-secondary me-2">Shop Now</a></p>
        </div>
      </div>
      <div class="col-lg-7">
        <div class="hero-img-wrap">
          <img src="images/new.png" class="img-fluid" />
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Contact Info Section -->
<div class="untree_co-section">
  <div class="container">
    <div class="row">
      <div class="col-md-4 contact-info-block">
        <h5>📍 Location</h5>
        <p>Kalawad Road, Rajkot</p>
      </div>
      <div class="col-md-4 contact-info-block">
        <h5>🏪 Shop Name</h5>
        <p>JM Electronics</p>
      </div>
      <div class="col-md-4 contact-info-block">
        <h5>📞 Mobile No</h5>
        <p>+91 9999966666</p>
      </div>
      <div class="col-md-4 contact-info-block">
        <h5>🕒 Available Time</h5>
        <p>Mon–Sat: 10:00 AM – 8:00 PM</p>
      </div>
      <div class="col-md-4 contact-info-block">
        <h5>📧 Email</h5>
        <p>jm@gmail.com</p>
      </div>
      <div class="col-md-4 contact-info-block">
        <h5>📱 Customer Care</h5>
        <p>1800-123-4567 (Toll-Free)</p>
      </div>
    </div>

    <!-- Contact Form -->
    <div class="row justify-content-center mt-4">
      <div class="col-md-10 form-section">
        <div class="form-group mb-3">
          <label class="text-black required">First Name</label>
          <asp:TextBox ID="txtnm" runat="server" CssClass="form-control" placeholder="Enter your first name" />
        </div>

        <div class="form-group mb-3">
          <label class="text-black required">Last Name</label>
          <asp:TextBox ID="txtsub" runat="server" CssClass="form-control" placeholder="Enter your last name" />
        </div>

        <div class="form-group mb-3">
          <label class="text-black required">Email Address</label>
          <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter your email" />
        </div>

        <div class="form-group mb-4">
          <label class="text-black required">Message</label>
          <asp:TextBox ID="txtmsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Type your message here..." />
        </div>

        <div class="form-group mb-3">
          <asp:Button ID="Button1" CssClass="btn btn-primary-hover-outline" runat="server" Text="Send" OnClick="Button1_Click" />
        </div>

        <div class="form-group mb-3">
          <asp:Label ID="Label1" CssClass="text-black" runat="server" Text="" />
        </div>
      </div>
    </div>
  </div>
</div>

</asp:Content>
