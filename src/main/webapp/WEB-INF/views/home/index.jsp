<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />



<c:if test="${not empty message}">
     <div id="login-alert" class="alert">${message}</div>
</c:if>
<div class="row">

	<div class="col-sm-2" style="border: 1px solid #ccc;
    
    width: 5%;
    height: 400px;
    background-color: #fff;
     position: relative;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
            border-radius: 10px; ">
        <div class="row">
            <div class="col">
                <nav class="nav flex-column">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><i class="fas fa-mobile-alt"></i>&nbsp;<span style="font-size: 20px;">Điện thoại</span></a>
                    <div class="dropdown-menu">
                        <div class="row" style="width: 500px;">
                            <div class="col-sm-6">
                              <h4 style="margin-left : 40px;">Hãng</h4>
                                <c:forEach var="c" items="${list3}">
							<a  class="dropdown-item" href="/product/list-by-categorys/${c.id}">
								<img src="/static/images/icon/4.png" /> ${c.nameVN}
							</a>
						</c:forEach>
                            </div>
                            <div class="col-sm-6">
                             <h4 style="margin-left: 40px;">Mức giá</h4>
                                <a class="dropdown-item" href="/product/list-by-price1/0">Dưới 1 triệu</a>
                                <a class="dropdown-item" href="/product/list-by-price1/1">Từ 1 triệu - 3 triệu</a>
                                <a class="dropdown-item" href="/product/list-by-price1/2">Từ 3 triệu - 5 triệu</a>
                                <a class="dropdown-item" href="/product/list-by-price1/3">Trên 5 triệu</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <nav class="nav flex-column">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fas fa-laptop"></i>&nbsp;<span style="font-size: 20px;">Laptop</span></a>
                    <div class="dropdown-menu">
                        <div class="row" style="width: 500px;">
                            <div class="col-sm-6">
                             <h4 style="margin-left : 40px;">Hãng</h4>
                                <c:forEach var="c" items="${list2}">
							<a  class="dropdown-item" href="/product/list-by-categorys/${c.id}">
								<img src="/static/images/icon/4.png" /> ${c.nameVN}
							</a>
						</c:forEach>
                            </div>
                            <div class="col-sm-6">
                             <h4 style="margin-left: 40px;">Mức giá</h4>
                                <a class="dropdown-item" href="/product/list-by-price2/0">Dưới 5 triệu</a>
                                <a class="dropdown-item" href="/product/list-by-price2/1">Từ 5 triệu - 10 triệu</a>
                                <a class="dropdown-item" href="/product/list-by-price2/2">Từ 10 triệu - 20 triệu</a>
                                <a class="dropdown-item" href="/product/list-by-price2/3">Trên 20 triệu</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div>
        <a href="/product/list-by-special/3"><img src="/static/images/banner/trai.jpg" alt="trai" style="margin-top: 10px; width: 100%; height: 300px;"></a>
         
        </div>
       
    </div>
	<div class="col-sm-9">




		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/static/images/iphone14.jpg" alt="anh1"
						style="width: 99%;">
				</div>

				<div class="item">
					<img src="/static/images/reno8.jpg" alt="anh2" style="width: 99%;">
				</div>

				<div class="item">
					<img src="/static/images/laptop.jpg" alt="anh3"
						style="width: 99%; height: 90%;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

	</div>
</div>





<!-- slide -->

<div class="row">
	<div class="col-4">
		<br> <img src="/static/images/ban1.jpg" width="100%"
			height="150px" />
	</div>
	<div class="col-4">
		<br> <img src="/static/images/ban2.jpg" width="100%"
			height="150px" />
	</div>
	<div class="col-4">
		<br> <img src="/static/images/ban3.jpg" width="100%"
			height="150px" />
	</div>

</div>





<div class="gia-soc" style="margin-top: 30px;">
	<div
		style="background-color: #FF6347; width: 100.1%; margin-left: -1px; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
		<span style="color: #fff; text-align: left; font-size: 26px;">SẢN
			PHẨM NỔI BẬT</span> <span
			style="color: #fff; float: right; font-size: 16px; padding: 8px">
			<a href="/product/list-by-special/4"
			style="color: #fff; text-decoration: none;"> Xem tất cả</a>
		</span>
	</div>


	<div
		style="padding: 20px 0px 0px 10px; margin-top: -10px; height: 420px">

		<jsp:include page="../product/list_special.jsp" />
	</div>
</div>
<br>
<img src="/static/images/lapgamingrog.jpg" width="100%" height="200px" />



<div class="gia-soc" style="margin-top: 30px">
	<div
		style="background-color: #FF6347; width: 100%; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
		<span style="color: #fff; text-align: left; font-size: 26px;">SẢN
			PHẨM MỚI NHẤT</span> <span
			style="color: #fff; float: right; font-size: 16px; padding: 8px;">
			<a href="/product/list-by-new/0"
			style="color: #fff; text-decoration: none;"> Xem tất cả</a>
		</span>
	</div>
	<div class="row"
		style="padding: 20px; margin-top: -10px; height: 840px">
		<jsp:include page="../product/list-by-new.jsp" />
	</div>
</div>
<div class="row">
	<div class="col-6">
		<br> <img src="/static/images/anhqc1.jpg" width="100%"
			height="150px" />
	</div>
	<div class="col-6">
		<br> <img src="/static/images/anhqc2.jpg" width="100%"
			height="150px" />
	</div>
</div>




<div class="gia-soc" style="margin-top: 30px">
	<div
		style="background-color: #FF6347; width: 100%; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
		<span style="color: #fff; text-align: left; font-size: 26px;">SẢN
			PHẨM YÊU THÍCH</span> <span
			style="color: #fff; float: right; font-size: 16px; padding: 8px;">
			<a href="/product/list-by-new/0"
			style="color: #fff; text-decoration: none;"> Xem tất cả</a>
		</span>
	</div>
	<div class="row"
		style="padding: 20px; margin-top: -10px; height: 840px">
		<jsp:include page="../product/list-by-new.jsp" />
	</div>
</div>

<br>


<style>
@font-face {
	font-family: 'icomoon';
	src: url('../fonts/icomoon.eot');
	src: url('../fonts/icomoon.eot?#iefix') format('embedded-opentype'),
		url('../fonts/icomoon.svg#icomoon') format('svg'),
		url('../fonts/icomoon.woff') format('woff'),
		url('../fonts/icomoon.ttf') format('truetype');
	font-weight: normal;
	font-style: normal;
}

/* Needed for a fluid height: */
html, body, .container, .main {
	height: 100%;
}

/* main wrapper */
.btn-change {
	width: 30px;
	height: 30px;
	position: absolute;
	margin-top: -250px;
	transform: translateY(-100%);
}

#next {
	right: 10px;
}

#prev {
	left: 10px;
}

.imgs {
	height: 100%;
	width: 100%
}

.cbp-contentslider {
	width: 100%;
	height: 100%;
	margin: 1em auto;
	position: relative;
	border: 1px solid rgb(214, 214, 214);
}

.cbp-contentslider>ul {
	list-style: none;
	height: 85%;
	width: 100%;
	overflow: hidden;
	position: relative;
	padding: 0;
	margin: 0;
}

.cbp-contentslider>ul li {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: #fff;
}

/* Whithout JS, we use :target */
.cbp-contentslider>ul li:target {
	z-index: 100;
}

.cbp-contentslider nav {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	height: 3.313em;
	z-index: 1000;
	border-top: 1px solid rgb(243, 239, 233);
	overflow: hidden;
}

.cbp-contentslider nav button {
	float: left;
	display: block;
	width: 20%;
	height: 100%;
	font-weight: 400;
	letter-spacing: 0.1em;
	overflow: hidden;
	color: #47a3da;
	background: rgb(255, 255, 255);
	outline: none;
	text-align: center;
	line-height: 3;
	position: relative;
	padding-left: 3.125em;
	text-transform: uppercase;
	-webkit-transition: color 0.2s ease-in-out, background-color 0.2s
		ease-in-out;
	-moz-transition: color 0.2s ease-in-out, background-color 0.2s
		ease-in-out;
	transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out;
}

.cbp-contentslider nav button span {
	display: block;
}

.cbp-contentslider nav button:last-child {
	border: none;
	box-shadow: 1px 0 #47a3da; /* fills gap caused by rounding */
}

.cbp-contentslider nav button:hover {
	text-decoration: none;
	border-bottom: 4px solid #47a3da;
}

.cbp-contentslider nav button.rc-active {
	background-color: #47a3da;
	color: #fff;
}

/* Iconfont for navigation and headings */
.cbp-contentslider [class^="icon-"]:before, .cbp-contentslider [class*=" icon-"]:before
	{
	font-family: 'icomoon';
	font-style: normal;
	text-align: center;
	speak: none;
	font-weight: normal;
	line-height: 2.5;
	font-size: 2em;
	position: absolute;
	left: 10%;
	top: 50%;
	margin: -1.250em 0 0 0;
	height: 2.500em;
	width: 2.500em;
	color: rgba(0, 0, 0, 0.1);
	-webkit-font-smoothing: antialiased;
}

/* Media queries */
@media screen and (max-width: 70em) {
	.cbp-contentslider p {
		font-size: 100%;
	}
}

@media screen and (max-width: 67.75em) {
	.cbp-contentslider {
		font-size: 85%;
	}
	.cbp-contentslider nav a[class^="icon-"]:before, .cbp-contentslider nav a[class*=" icon-"]:before
		{
		left: 50%;
		margin-left: -1.250em;
	}
	.cbp-contentslider nav a span {
		display: none;
	}
}

@media screen and (max-width: 43em) {
	.cbp-contentslider h3 {
		font-size: 2em;
	}
	.cbp-contentslider .cbp-content {
		-webkit-column-count: 1;
		-moz-column-count: 1;
		-o-column-count: 1;
		column-count: 1;
	}
	.cbp-contentslider li>div {
		top: 5em;
	}
}

@media screen and (max-width: 25em) {
	.cbp-contentslider nav a {
		padding: 0;
	}
	.cbp-contentslider h3[class^="icon-"]:before, .cbp-contentslider h3[class*=" icon-"]:before
		{
		display: none;
	}
}
.alert {
      position: fixed;
      top: 20px;
      right: -400px;
      padding: 20px;
      background-color: #4CAF50;
      color: white;
      font-family: Arial, sans-serif;
      font-size: 16px;
      border-radius: 5px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      opacity: 0;
      transition: all 0.5s ease-in-out;
      animation: slideInRight 0.5s ease-in-out forwards;
    }

    .alert.show {
      opacity: 1;
      right: 20px;
    }

    .alert.hide {
      animation: slideOutRight 0.5s ease-in-out forwards;
    }

    @keyframes slideInRight {
      0% {
        transform: translateX(100%);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }

    @keyframes slideOutRight {
      0% {
        transform: translateX(0);
        opacity: 1;
      }
      100% {
        transform: translateX(100%);
        opacity: 0;
      }
    }
</style>
<script>
    var loginAlert = document.getElementById('login-alert');
    loginAlert.classList.add('show');

    setTimeout(function() {
      loginAlert.classList.remove('show');
      loginAlert.classList.add('hide');
    }, 3000);

    setTimeout(function() {
      loginAlert.classList.remove('hide');
      loginAlert.style.right = '-400px';
    }, 3500);
  </script>
