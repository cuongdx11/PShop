<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="tong" value="${tong}" />
<c:if test="${not empty message}">
     <div id="successModal" class="modal">
        <div class="modal-content">
          <div class="icon icon--order-success svg">
            <svg xmlns="http://www.w3.org/2000/svg" width="72px" height="72px">
              <g fill="none" stroke="#8EC343" stroke-width="2">
                <circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
                <path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
              </g>
            </svg>
          </div>
          <h2>${message}</h2>
          <p>Cảm ơn quý khách đã mua hàng</p>
          <button id="okButton">OK</button>
        </div>
      </div>
</c:if>
<div class="container" style="margin-bottom: 25px">
	<br>

	<h3 class="title" style="font-weight: 700">Thay đổi mật khẩu</h3>
	<br>


	<div class="row">
		<div class="col-sm-4">

			<li class="nav-item2 " style="list-style-type: none;"><a
				class="nav-link collapsed" href="/account/edit"
				ata-toggle="collapse" id="i">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-info-circle"
								style="font-size: 30px; padding: 12px 5px; color: black;"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Thông tin cá nhân</b>
								<p>Quản lý thông tin cá nhân</p>
							</span>
						</div>
					</div>
			</a></li>

			<li class="nav-item2 " style="list-style-type: none;"><a
				class="nav-link collapsed" href="/account/change"
				data-toggle="collapse" data-target="#collapseNews"
				aria-expanded="true" aria-controls="collapseNews">
					<div class="row">
						<div class="col-sm-2">
							<i class="fas fa-key"
								style="font-size: 30px; padding: 12px 5px; color: rgb(255, 208, 0);"></i>
						</div>
						<div class="col-sm-10" style="padding: 0px 15px;">
							<span> <b>Thay đổi mật khẩu</b>
								<p>Cập nhật mật khẩu mới</p>
							</span>
						</div>
					</div>
			</a></li>
			<div class="quan-li-thong-tin">
				<li class="nav-item2 active" style="list-style-type: none;"><a
					class="nav-link collapsed" href="/order/list"
					data-target="#collapseTwo" aria-expanded="true"
					aria-controls="collapseTwo">
						<div class="row">
							<div class="col-sm-2">
								<i class="fas fa-shopping-cart"
									style="font-size: 30px; padding: 12px 5px; color: brown;"></i>
							</div>
							<div class="col-sm-10" style="padding: 0px 15px;">
								<span> <b>Lịch sử đơn hàng</b>
									<p>Thông tin sản phẩm đã mua</p>
								</span>
							</div>
						</div>
				</a></li>
			</div>
		</div>

		<div class="col-sm-8">
			<div class="ct1">
				<div>
					<h4 style="font-weight: 600">Lịch sử đơn hàng</h4>
					<hr>
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th>Mã đơn hàng</th>
								<th>Ngày mua</th>
							
								<th>Tổng tiền</th>
								<th>Trạng thái</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o" items="${orders}">
								<tr>
									<td>${o.id}</td>
									<td><fmt:formatDate type="both" dateStyle="short"
											timeStyle="short" value="${o.orderDate}" /></td>
									
									
									<td><f:formatNumber value="${o.amount}" pattern="#,###" />
										VNĐ</td>
										<td>
										<c:choose>
											<c:when test="${o.status == 0}">Chưa xử lý</c:when>
											<c:when test="${o.status == 1}">Đang xử lý</c:when>
											<c:when test="${o.status == 2}">Đang giao hàng</c:when>
											<c:when test="${o.status == 3}">Đã giao hàng</c:when>
											<c:when test="${o.status == 4}">Đã hủy</c:when>
											<c:otherwise>Không xác định</c:otherwise>
										</c:choose>
									</td>
									<c:if test="${o.status != 4}">
							            <td><a href="/order/cancel/${o.id}" class="btn btn-sm btn-danger cancel-order"> Hủy Đơn </a></td>
							        </c:if>
							        <c:if test="${o.status == 4}">
							            <td><a href="/order/rebuy/${o.id}" class="btn btn-sm btn-primary rebuy-order"> Mua lại </a></td>
							        </c:if>
									<td><a href="/order/detail/${o.id}"
										class="btn btn-sm btn-warning"> Chi tiết </a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>




<style>
.dang-nhap {
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}

h3.title {
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 1px solid #d5d5d5;
	position: relative
}

h3.title:after {
	content: '';
	display: block;
	width: 30px;
	height: 3px;
	background-color: #fbaf32;
	position: absolute;
	left: 0;
	bottom: -1px
}

.title-h h3 {
	font-weight: bolder;
}

.quan-li-thong-tin .active {
	background-color: white;
	width: 110%;
	padding: 10px 5px 0px;
	border-radius: 5px;
}

.gach {
	background-color: blue;
	width: 100px;
}

.quan-li-thong-tin .active span {
	color: black;
}
body {
      font-family: Arial, sans-serif;
    }

    .modal {
      display: none; 
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 500px;
      text-align: center;
      border-radius: 10px;
      position: relative;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .modal-content h2 {
      margin-top: 0;
    }

    .modal-content button {
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    .modal-content button:hover {
      background-color: #0056b3;
    }

    .icon--order-success svg {
      display: inline-block;
      margin-bottom: 20px;
    }

    @-webkit-keyframes checkmark {
      0% {
          stroke-dashoffset: 50px;
      }
      100% {
          stroke-dashoffset: 0;
      }
    }

    @keyframes checkmark {
      0% {
          stroke-dashoffset: 50px;
      }
      100% {
          stroke-dashoffset: 0;
      }
    }

    @-webkit-keyframes checkmark-circle {
      0% {
          stroke-dashoffset: 240px;
      }
      100% {
          stroke-dashoffset: 480px;
      }
    }

    @keyframes checkmark-circle {
      0% {
          stroke-dashoffset: 240px;
      }
      100% {
          stroke-dashoffset: 480px;
      }
    }

    .icon--order-success svg path {
      -webkit-animation: checkmark 0.25s ease-in-out 0.7s backwards;
      animation: checkmark 0.25s ease-in-out 0.7s backwards;
    }

    .icon--order-success svg circle {
      -webkit-animation: checkmark-circle 0.6s ease-in-out backwards;
      animation: checkmark-circle 0.6s ease-in-out backwards;
    }
</style>

 <script>
    document.addEventListener('DOMContentLoaded', (event) => {
      const modal = document.getElementById('successModal');
      const okButton = document.getElementById('okButton');

      // Show the modal
      modal.style.display = 'block';

      // When the user clicks on OK button, close the modal
      okButton.onclick = function() {
        modal.style.display = 'none';
      }
    });
 // Lấy tất cả các liên kết "Hủy Đơn"
    var cancelOrderLinks = document.querySelectorAll('.cancel-order');

    // Thêm sự kiện click cho mỗi liên kết
    cancelOrderLinks.forEach(function(link) {
      link.addEventListener('click', function(event) {
        // Ngăn chặn hành vi mặc định của liên kết
        event.preventDefault();

        // Hiển thị hộp thoại xác nhận
        var confirmed = confirm('Bạn có chắc chắn muốn hủy đơn hàng này?');

        // Nếu người dùng xác nhận, chuyển hướng đến liên kết
        if (confirmed) {
          window.location.href = this.href;
        }
      });
    });
  </script>







