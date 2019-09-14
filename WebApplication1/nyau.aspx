<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nyau.aspx.cs" Inherits="WebApplication1.nyau"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <title>Web Tech</title>
</head>

<body>
<div class="logo_fixed">
    <img src="images/logo.jpg"/>
</div>
<div class="topbar">
  <a href="#home" class="logo"></a>
  <div class="search">
    <a href="#search"><i class="fa fa-search"></i></a>
    <input type="text" size="50" placeholder="Search..." id="search"/> 
  </div>
  <div class="lognav">
    <i class="fa fa-user"></i>
    <i class="fa fa-lock"></i>
    <form  method="post" action="login.aspx" style="padding:0;margin:0;" >
        <input type="text" placeholder="username" name="uname" id="username" class="log_textbox"/> 
        <input type="password" placeholder="password" name="pwd" id="password" class="log_textbox"/> 
        <button type="submit" onclick="return login();">Log In</button>
     </form>
    <script>
        function login() {
            if (document.getElementById("username").value == "") {
                alert("please enter username");
                return false;
            }

            if (document.getElementById("password").value == "") {
                alert("please enter password");
                return false;

            }
            return true;
        }
    </script>
    <div class="register">
    <button onclick="myFunction()">Register</button>
    <div class="popup" id="popup">
        <form runat="server" method="post" action="#" >
            <div style="float:left; margin-right:30px;">
                <asp:Label runat="server" AssociatedControlID="fname">First Name</asp:Label><br />
                <asp:TextBox runat="server" CssClass="short_textbox" ID="fname"></asp:TextBox>
            </div>
            <div>
                <asp:Label runat="server" AssociatedControlID="lname">Last Name</asp:Label><br />
                <asp:TextBox runat="server" CssClass="short_textbox" ID="lname"></asp:TextBox>
            </div>
            <div>
                <asp:Label runat="server" AssociatedControlID="uname">Username</asp:Label><br />
                <asp:TextBox runat="server" CssClass="long_textbox" ID="uname"></asp:TextBox>
            </div>
            <div style="float:left; margin-right:30px;">
                <asp:Label runat="server" AssociatedControlID="formPassword">Password</asp:Label><br />
                <asp:TextBox runat="server" TextMode="Password" CssClass="short_textbox" ID="formPassword"></asp:TextBox>
            </div>
            <div>
                <asp:Label runat="server" AssociatedControlID="rePassword">Confirm Password</asp:Label><br />
                <asp:TextBox runat="server" TextMode="Password" CssClass="short_textbox" ID="rePassword"></asp:TextBox>
            </div>
            <div style="float:left; margin-right:30px;">
                <asp:Label runat="server" >Date of Birth</asp:Label><br />
                 <asp:DropDownList runat="server" ID="yearDropDownList" ></asp:DropDownList>
                 <asp:DropDownList runat="server" ID="monthDropDownList"></asp:DropDownList>
                 <asp:DropDownList runat="server" ID="dayDropDownList"></asp:DropDownList>
            </div>
            <div>
                <asp:Label runat="server" AssociatedControlID="maleRadiobutton">Gender</asp:Label><br />
                <asp:RadioButton runat="server" GroupName="gender" Text="Male" ID="maleRadioButton" CssClass="radioButton"/>
                <asp:RadioButton runat="server" GroupName="gender" Text="female" ID="femaleRadioButton" CssClass="radioButton"/>
            </div>
            <div>
                <asp:Label runat="server" AssociatedControlID="email">Email</asp:Label><br />
                <asp:TextBox runat="server" CssClass="long_textbox" ID="email"></asp:TextBox>
            </div>
            <div>
                <asp:Label runat="server" AssociatedControlID="contactNo">Contact no.</asp:Label><br />
                <asp:TextBox runat="server" CssClass="long_textbox" ID="contactNo"></asp:TextBox>
            </div>
            <div>
                <asp:Button Text="Send" runat="server" CssClass="submitButton" ID="submitButton" OnClientClick="return validate();" OnClick="Registration" />
            </div>
         </form>
    </div>
    </div>
<script>
    var selector = document.getElementById("monthDropDownList");
    var changes = document.getElementById("dayDropDownList");
    var month_length = changes.length;

    selector.addEventListener("change", function () {

        if (selector.options[selector.selectedIndex].text == "February") {

            for (var i = 0; i < month_length; i++) 
               changes.remove(1);
           
            for (var i = 1; i < 30; i++) {
                var option = document.createElement("option");
                option.text = i;
                changes.add(option);
            }
            
        }
    });

</script>
<script>
// When the user clicks on div, open the popup
    var popup = document.getElementById("popup");

function myFunction() {

    if (!popup.classList.contains('show')) {
        document.getElementsByClassName("transparent-box")[0].style.display = "block";
        document.body.style.overflow = "hidden";
        popup.classList.add('show');
        popup.classList.remove('hide');
    }
    else {
        popup.classList.add('hide');
        popup.classList.remove('show');
        document.body.style.overflow = "auto";
        document.getElementsByClassName("transparent-box")[0].style.display = "none";
    }
}
</script>
<script>
      function validate()
      {
         if (document.getElementById("fname").value == "")
         {
             alert("Please provide your first name.");
             document.getElementById("fname").focus;
             return false;
          }

          if (document.getElementById("lname").value == "")
          {
            alert( "Please provide your last name." );
              document.getElementById("lname").focus;
              return false;
          }

          if (document.getElementById("uname").value == "")
         {
            alert( "Please provide your username." );
              document.getElementById("uname").focus;
              return false;
          }

          if (document.getElementById("formPassword").value == "")
         {
            alert( "Please provide your Password." );
              document.getElementById("formPassword").focus;
              return false;
          }

          if (document.getElementById("rePassword").value == "")
         {
            alert( "Please provide your password for confirmation." );
              document.getElementById("rePassword").focus;
              return false;
          }

           if (document.getElementById("formPassword").value != document.getElementById("rePassword").value)
         {
            alert( "Password confirmation doesn't match." );
               document.getElementById("formPassword").focus;
               document.getElementById("formPassword").value = "";
               document.getElementById("rePassword").value = "";
               return false;
          }

          if (document.getElementById("email").value == "")
         {
            alert( "Please provide your email." );
              document.getElementById("email").focus();
              return false;
          }

          if (document.getElementById("contactNo").value == "") {
              alert("Please provide your contact number.");
              document.getElementById("contactNo").focus();
              return false;
          }
          if (!document.getElementById("maleRadioButton").checked && !document.getElementById("femaleRadioButton").checked)
         {
            alert( "Please provide your gender." );
              document.getElementById("maleRadioButton").focus();
              return false;
          }

          if (document.getElementById("yearDropDownList").selectedIndex == "0" ||
              document.getElementById("monthDropDownList").selectedIndex == "0" ||
              document.getElementById("dayDropDownList").selectedIndex == "0" )
         {
            alert( "Please provide your date of birth." );
              document.getElementById("yearDropDownList").focus();
              return false;
          }

          return true;
      }
</script>
  </div>
</div>
<div class="topnav" id="topnav">
  <a href="#home">Home</a>
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
        };
    };
</script>
<div class="itemban">
<div class="onsales_items">
  <h3>On Sale</h3>
  <asp:Repeater ID="Repeater_OnSale" runat="server">
      <ItemTemplate>
           <div class="onsale">
                <img src="images/<%# Eval("ProductImage") %>"/>
                <label><%# Eval("ProductName") %></label>
                <h6>Rs. <%# Eval("ProductPrice") %></h6>
                <button onclick="buy_now();">Buy Now</button>
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
                <button onclick="buy_now();">Buy Now</button>
            </div>
      </ItemTemplate>
  </asp:Repeater>
</div>
</div>
    <script>
        function buy_now() {
            alert("Please login for this feature.");
        }
    </script>
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
</body>
</html>

