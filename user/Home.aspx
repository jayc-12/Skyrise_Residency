<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="user_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
<meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/style1.css" rel="stylesheet" type="text/css" />
  </head>
  <form id="Form1" runat="server">


 <div>
<h2 class="text-sm-center">Welcome to SkyRise Residency</h2>
</div>
  <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    
  </ol>

  <!-- Wrapper for slides -->
   <div class="carousel-inner">
    <div class="item active">
        <img src="../apt_images/pic1.jpg" alt="apartmentpic" />
        <div class="carousel-caption">
        Welcome to RMS
        </div>
      </div>

    <div class="item">
        <img src="../apt_images/pic2.jpg" alt="apartmentpic" />
    </div>

    <div class="item">
        <img src="../apt_images/pic3.jpg" alt="apartmentpic"  />
    </div>
      
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div><br />
<div class="main">
<div>
    <asp:Image ID="imgowner" runat="server" Height="300" Width="300" />
</div>
  <div class="form-group"><label>Tower Name:</label><br /> <asp:Label ID="lbltname" 
          runat="server" class="form-control" Width="600px"></asp:Label></div> 
             <div class="form-group"><label>Flat No:</label><br /> <asp:Label ID="lblflatno" 
                     runat="server" class="form-control" Width="600px"></asp:Label></div> 
             <div class="form-group"><label>Name:</label><br /> <asp:Label ID="lbluname" 
                     runat="server" class="form-control" Width="600px"></asp:Label></div> 
</div>


 </form>

</asp:Content>

