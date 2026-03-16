<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HAIR_TRAIT._Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

/* HERO SECTION */

.hero{
    text-align:center;
    padding:70px 20px;
    background:linear-gradient(to right,#e9f5f3,#ffffff);
}

.hero h1{
    color:#2C6E63;
    font-size:42px;
    margin-bottom:10px;
}

.hero p{
    font-size:18px;
    color:#444;
}

.btn-services{
    margin-top:25px;
    padding:12px 28px;
    background-color:#2C6E63;
    color:white;
    border:none;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}

.btn-services:hover{
    background-color:#1f5048;
}


/* ABOUT SECTION */

.section{
    margin-top:50px;
}

.section h2{
    text-align:center;
    color:#2C6E63;
    margin-bottom:25px;
}

.about{
    max-width:850px;
    margin:auto;
    text-align:center;
    font-size:17px;
    line-height:1.6;
}


/* PRODUCT GRID */

.product-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
    margin-top:30px;
}

.product-card{
    background:white;
    border-radius:8px;
    box-shadow:0 3px 10px rgba(0,0,0,0.08);
    padding:15px;
    text-align:center;
}

.product-card img{
    width:100%;
    height:160px;
    object-fit:cover;
    border-radius:6px;
}

.product-card h4{
    margin-top:10px;
}

.product-card p{
    font-size:14px;
    color:#555;
}


/* FEATURES SECTION */

.features{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
    margin-top:30px;
}

.feature-box{
    background:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0 3px 10px rgba(0,0,0,0.08);
    text-align:center;
}

.feature-box h3{
    color:#2C6E63;
}

</style>



<!-- HERO -->

<div class="hero">

<h1>Welcome to Hair Trait</h1>

<p>
Premium hair care products designed to keep your hair healthy, stylish, and confident every day.
</p>

<asp:Button 
ID="btnServices"
runat="server"
Text="View our Products"
CssClass="btn-services"
OnClick="btnServices_Click"/>

</div>



<!-- ABOUT -->

<div class="section">

<h2>About Hair Trait</h2>

<p class="about">
Hair Trait is dedicated to providing high-quality hair care solutions for modern lifestyles.  
Our products are designed to nourish, protect, and style your hair using carefully selected ingredients.  
Whether you need everyday grooming essentials or specialized treatments, Hair Trait offers reliable and professional products for everyone.
</p>

</div>



<!-- FEATURED PRODUCTS -->

<div class="section">

<h2>Popular Products</h2>

<div class="product-grid">

<div class="product-card">
<img src="Images/Screen.png" />
<h4>Professional Haircut</h4>
<p>Clean and modern haircut tailored to your style.</p>
</div>

<div class="product-card">
<img src="Images/Screen.png" />
<h4>Hair Treatment</h4>
<p>Nourishing treatment for healthier and stronger hair.</p>
</div>

<div class="product-card">
<img src="Images/Screen.png" />
<h4>Beard Grooming</h4>
<p>Precision beard styling and grooming service.</p>
</div>

<div class="product-card">
<img src="Images/Screen.png" />
<h4>Hair Spa</h4>
<p>Relaxing hair spa that restores shine and strength.</p>
</div>

</div>

</div>



<!-- WHY CHOOSE US -->

<div class="section">

<h2>Why Choose Hair Trait</h2>

<div class="features">

<div class="feature-box">
<h3>Quality Products</h3>
<p>All our products are made with carefully selected ingredients for long-lasting results.</p>
</div>

<div class="feature-box">
<h3>Professional Care</h3>
<p>Our services and products are designed by experienced hair care professionals.</p>
</div>

<div class="feature-box">
<h3>Affordable Pricing</h3>
<p>We believe great hair care should be accessible without high costs.</p>
</div>

<div class="feature-box">
<h3>Customer Satisfaction</h3>
<p>Your satisfaction is our priority. We focus on delivering reliable and effective solutions.</p>
</div>

</div>

</div>



</asp:Content>