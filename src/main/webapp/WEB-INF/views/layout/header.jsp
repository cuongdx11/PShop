<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />


<header>
	<img src="/static/images/thankyou.jpg" alt="" width="100%" height="100px">
</header>

<nav id="navbar" class="navbar navbar-expand-sm navbar-dark sticky-top" style="background-color: #F8F8FF; border-bottom: 1px solid gainsboro;">
	<div class="container ">
		<div class="row" style="padding: 20px 15px 12px;">
			<div class="col-sm-4" style="margin-top: -10px; padding-left: 30px;">
				<a href="/"><img src="/static/images/pshoplogo.png" alt="" width="60%"></a>
			</div>
			<div class="col-sm-4" style="padding-right: 15px;">
				<div class="input-group">
					<form action="/product/list-by-keywords" method="post">
						<input style="width: 240px" class="form-control" value="${param.keywords}" name="keywords" placeholder="Hôm nay bạn muốn mua gì?" />
						<div class="input-group-append">
							<button class="btn btn-secondary" value="${param.keywords}" type="submit" style="background-color: #FF6347; border: none; width: 50px; height: 34px">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-4" style="padding: 0px 35px;">
				<div class="row">
					<div class="col-sm-4">
					<div class="header-menu">
					<i class="fa fa-shopping-cart" style="font-size: 30px ;padding: 0px 5px 0px 5x"></i>
					<a class="splike" href="/cart/giohang" style="text-decoration: none; color: #003333">Giỏ hàng</a>
					</div>
						<%-- <!-- Cart hover -->
						<div class="header-menu">
							<div class="card-hover" id="cart-img">
								<div class="card-sp">
									<ul>
										<li>
											<i class="fa fa-shopping-cart" style="font-size: 30px"></i>
											<p class="carts"><a href="/cart/giohang" style="text-decoration: none; color: #003333">Giỏ hàng</a></p>
											<ul>
												<li>
													<div class="row">
														<c:choose>
															<c:when test="${cart.amount > 0}">
																<c:forEach var="p"
																	items="${sessionScope['scopedTarget.cartService'].items}">
																	<div class="col-sm-4">
																		<img src="/static/images/products/${p.image}" alt=""  width="100%">
																	</div>
																	<div class="col-sm-8">

																		<div data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
																			<b style="padding:0px 5px 0px 0px;font-size: 14px">${p.name}</b>
																			<p  style="color: red; font-weight: 700; padding-top: 6px;font-size: 14px">
																				<f:formatNumber value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" /> VNĐ
																			</p>
																			<p style="padding-top: 6px;font-size: 14px">Số lượng: ${p.quantity}</p>
																		</div>
																	</div>
																	
																</c:forEach>
															</c:when>
															<c:otherwise>
																<div style="padding: 10px 10px 10px 30px;">Không có sản phẩm nào trong giỏ hàng!</div>
															</c:otherwise>
														</c:choose>
													
													</div>

												</li>

											</ul>
											<div class="tong-tien">
												<div class="row">
													<div class="col-sm-5">
														<h7>Tổng tiền</h7>
													</div>
													<c:choose>
														<c:when test="${cart.amount > 0}">
															<div class="col-sm-7">
																<b style="color:black;font-weight: bold;">
																<f:formatNumber value="${cart.amount}" pattern="#,###" /> VNĐ</b>
															</div>
														</c:when>
														<c:otherwise>
															<div class="col-sm-7">
																<b>0 VNĐ</b>
															</div>
														</c:otherwise>
													</c:choose>
												</div>
												<br />
												<div>
													<a style="width: 300px "  class="btn btn-primary"
														href="/cart/view">Xem giỏ hàng</a>
												</div>
											</div></li>
									</ul>
								</div>
							</div>
						</div> --%>
						<!-- /Cart hover -->
					</div>
					<div class="col-sm-4">
						<div class="header-menu">
							<i class="glyphicon glyphicon-heart" style="font-size: 30px; padding: 0px 5px 0px 5x"></i> 
								<a class="splike" href="/product/favo" style="text-decoration: none; color: #003333"> Yêu thích</a>
						</div>
					</div>
					<div class="col-sm-4">
                            <div class="header-menu">
                                <i class="fas fa-user" style="font-size: 30px; padding: 0px 5px 0px 5px"></i>
                                <a class="splike" href="#" id="loginLink" style="text-decoration: none; color: #003333">Đăng nhập</a>

                            </div>
                        </div>
				</div>
			</div>
		</div>
	</div>

</nav>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Đăng nhập/Đăng ký</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-4">
                    <img src="/static/images/pshoplogo.png" alt="Logo" style="width: 100px; height: auto;">
                    <p class="mt-3">Vui lòng đăng nhập tài khoản để xem ưu đãi và thanh toán dễ dàng hơn</p>
                </div>
                <div class="row">
                    <div class="col-6">
                        <a href="/account/login" class="btn btn-primary btn-block">
                            <i class="fas fa-sign-in-alt"></i> Đăng nhập
                        </a>
                    </div>
                    <div class="col-6">
                        <a href="/account/register" class="btn btn-secondary btn-block">
                            <i class="fas fa-user-plus"></i> Đăng ký
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<style id="cart-css">
</style>

<style id="cart-csss">
</style>

<style>
.sticky {
	position: fixed;
	top: 0;
	width: 100%;
}

/* Add some top padding to the page content to prevent sudden quick movement (as the navigation bar gets a new position at the top of the page (position:fixed and top:0) */
.sticky+.content {
	padding-top: 60px;
}

.splike {
	text-decoration: none;
	color: black;
	padding-left: 10px
}

.splike:hover {
	color: black;
	font-weight: bold;
	text-decoration: none
}

.carts {
	color: black;
}

.carts:hover {
	font-weight: bold;
}

.tong-tien {
    display: none;
    position: absolute;
    background-color: white;
    height: 100px;
    margin-top: 300px;
    border-top: 1px dotted green;
    width: 240%;
    padding: 10px 20px;
    box-shadow: 0 4px 10px -2px gray;
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
}

.tong-tien .col-sm-7 {
    text-align: right;
    font-size: 18px;
    color: #474c51;
    font-weight: 500;
    text-decoration: none;
}


.tong-tien .col-sm-5 {
    text-align: left;
    font-size: 18px;
    font-weight: 500;
}

.modal-content {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.modal-header {
	border-bottom: none;
}

.modal-header .close {
	padding: 1rem;
	margin: -1rem -1rem -1rem auto;
}

.modal-header h5 {
	color: #333;
	font-weight: bold;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-secondary {
	background-color: #6c757d;
	border-color: #6c757d;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.btn-secondary:hover {
	background-color: #5a6268;
	border-color: #545b62;
}

.btn i {
	margin-right: 5px;
}

.modal-body .row {
	padding-top: 10px;
}

.modal-body .btn {
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
}

.modal-body {
	padding: 20px;
}
</style>

<script>

// Khởi tạo modal của Bootstrap
$(document).ready(function() {
    $('#loginLink').click(function() {
        $('#loginModal').modal('show');
    });
});

	//When the user scrolls the page, execute myFunction
	window.onscroll = function() {
		myFunction()
	};

	// Get the navbar
	var navbar = document.getElementById("navbar");

	// Get the offset position of the navbar
	var sticky = navbar.offsetTop;

	// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
	function myFunction() {
		if (window.pageYOffset >= sticky) {
			navbar.classList.add("sticky")
		} else {
			navbar.classList.remove("sticky");
		}
	}

	
</script>