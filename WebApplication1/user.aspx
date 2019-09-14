<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="WebApplication1.user" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <title>Web Tech</title>
    <style>
        body form{            
            padding:0;
            margin:0;
        }
    </style>
</head>

<body>
<form runat="server" id="cart_form">
<div class="logo_fixed">
    <img src="images/logo.jpg"/>
</div>
<div class="topbar">
  <a href="~/user.aspx" class="logo"></a>
  <div class="search">
    <a href="#search"><i class="fa fa-search"></i></a>
    <input type="text" size="50" placeholder="Search..." id="search"/> 
  </div>
  <div class="users_nav">
          <asp:Button runat="server" ID="logOut" Text="Log Out" OnClick="Log_Out"></asp:Button>
          <i class="fa fa-cog"></i>
          <asp:Label runat="server" CssClass="welcome" ID="welcome"></asp:Label>
          <div class="cart">
            <img src="images/cart.png" />
            <asp:Label runat="server" ID="items_count"></asp:Label>
          </div>
   </div>
</div>
<div class="topnav" id="topnav">
  <a href="~/user.aspx">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
  <a href="#products" id="products_menu">Products  &#9661</a>
</div>
<div class="midban" id="midban"> 
<div class="products">
    <ul>
    <li>&gt; Men's Fashion</li>
    <li>&gt; Women's Fashion</li>
    <li>&gt; Electronic Devices</li>
    <li>&gt; Beauty &amp; Health</li>
    <li>&gt; Groceries &amp; pets</li>
    <li>&gt; Watch &amp; Accessories</li>
    <li>&gt; Sports &amp; Outdoor</li>
    <li>&gt; Automotive &amp; Moterbike</li>
    <li>&gt; Home &amp; Lifestyle</li>
    <li>&gt; Home Appliances</li>
    </ul>
</div>
<div class="carousel">

<div class="slideshow-container">

<div class="mySlides fade">
  <img src="images/b1.jpg"/>
</div>

<div class="mySlides fade">
  <img src="images/b2.jpg"/>
</div>

<div class="mySlides fade">
  <img src="images/b3.jpg"/>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br/>

<div style="text-align:center; margin-top: -50px;">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var timer = null;
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  clearTimeout(timer);  
  timer =   setTimeout(function() { plusSlides(1); }, 4000);
}
window.onload = function() {
    timer =   setTimeout(function() { plusSlides(1); }, 4000);
}


</script>

</div>
</div>

<script>
    window.onload = function () {
        document.getElementsByClassName("search")[0].classList.add("search_top");
        
        var pos = 10;

        window.onscroll = function () {
            console.log(document.documentElement.scrollTop);
            if (document.documentElement.scrollTop >= 66) {
                document.getElementsByClassName("topnav")[0].classList.add("topnav_fixed");
                document.getElementsByClassName("logo_fixed")[0].style.display = "block";
                document.getElementsByClassName("midban")[0].style.marginTop = "67px";
                document.getElementsByClassName("search")[0].classList.remove("search_top");
                document.getElementsByClassName("search")[0].classList.add("search_fixed");
            }
            else {
                document.getElementsByClassName("topnav")[0].classList.remove("topnav_fixed");
                document.getElementsByClassName("logo_fixed")[0].style.display = "none";
                document.getElementsByClassName("midban")[0].style.marginTop = "30px";
                document.getElementsByClassName("search")[0].classList.add("search_top");
                document.getElementsByClassName("search")[0].classList.remove("search_fixed");
            }

            if (document.documentElement.scrollTop >= 400)
                document.getElementById("products_menu").style.visibility = "visible";
            else
                document.getElementById("products_menu").style.visibility = "hidden";

            
            if (document.documentElement.scrollTop > 1488) {
                if (pos >= 10) {
                    pos+=100;
                    document.getElementsByClassName("cart")[0].style.bottom = pos + "px";
                }
            } else {
                while (pos >= 10) {
                    pos--;
                    document.getElementsByClassName("cart")[0].style.bottom = pos + "px";
                }
            }
        };
    };
</script>
<div class="itemban">
<div class="onsales_items">
  <h3>On Sale</h3>
  <asp:Repeater ID="Repeater_OnSale" runat="server" >
      <ItemTemplate>
           <div class="onsale">
                <img src="images/<%# Eval("ProductImage") %>"/>
                <label><%# Eval("ProductName") %></label>
                <h6>Rs. <%# Eval("ProductPrice") %></h6>
                <asp:Label runat="server" CssClass="productId" ID="ProductId_OnSale"><%# Eval("Id") %></asp:Label>
                <asp:Button runat="server" CssClass="AddCart" Text="Add to Cart" ID="AddCart"></asp:Button>
            </div>
      </ItemTemplate>
  </asp:Repeater>
</div>
<div class="collections">
  <h3>Collections</h3>  
  <asp:Repeater ID="Repeater_OnCollections" runat="server">
      <ItemTemplate>
           <div class="oncollections">
                <img src="images/<%# Eval("ProductImage") %>"/>
                <label><%# Eval("ProductName") %></label>
                <h6>Rs. <%# Eval("ProductPrice") %></h6>
               <asp:Label runat="server" ID="ProductId_OnCollections" CssClass="productId"><%# Eval("Id") %></asp:Label>
                <asp:Button runat="server" CssClass="AddCart" Text="Add to Cart" ID="AddCart"></asp:Button>               
            </div>
      </ItemTemplate>
  </asp:Repeater>
</div>
</div>
<div class="footerban">
  <div class="about_us">
  <h2>About Us</h2>
  <hr />
  <p>We sell good goods to you for your good.  
  We sell good goods to you for your good. 
  We sell good goods to you for your good. 
  We sell good goods to you for your good. 
  We sell good goods to you for your good.
  We sell good goods to you for your good.
  We sell good goods to you for your good.
  We sell good goods to you for your good.
  We sell good goods to you for your good.
  We sell good goods to you for your good.
  </p>
  </div>
  
  <div class="links">
  <h2>Links</h2>
  <hr />
    <ul>
    <li><a href="#">Blog</a></li>
    <li><a href="#">Facebook</a></li>
    <li><a href="#">Twitter</a></li>
    <li><a href="#">Instagram</a></li>
    <li><a href="#">Youtube</a></li>  
    </ul>
  </div>  
  
  <div class="contact_us">
  <h2>Contact Us</h2>
  <hr />
  <span>Phone: 01-4244008</span>
  <span>Cell: +977-9860590024</span>
  <span>Email: ra9havsh@gmail.com</span>
  <span>Fax: 620 865 520 2145</span>  
  </div>  
  
  <div class="feedback">
  <h2>Feedback</h2>
  <hr />
  <textarea></textarea> 
  <button>Send Us</button> 
  </div> 
</div>
<div class="redbox"></div>
<div class="transparent-box"></div>
</form>
</body>
</html>

