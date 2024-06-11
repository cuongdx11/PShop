<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<%-- <c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />
 --%>
 <c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />
<c:set var="tong" value="${tong}" />
<c:set var="sdt" value="${sdt}" />

<br />
<div class="container"
	style="background-color: #fff; margin-bottom: 20px">
	<h3 class="title">
		<b>THANH TOÁN</b>
	</h3>
	<div class="container">
		<div class="row">
			<table class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã SP</th>
						<th>Tên</th>
						<th>Giá</th>
						<th>Giảm giá</th>
						<th>Số lượng</th>
						<th>Tổng tiền</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p"
						items="${pro}">
						<tr>
							<td>${p.id}</td>
							<td>${p.name}</td>
							<td><f:formatNumber value="${p.unitPrice}" pattern="#,###" />
								VNĐ</td>
							<td><f:formatNumber value="${p.discount}" type="percent" /></td>
							<td>${p.quantity}</td>
							<td><f:formatNumber
									value="${p.quantity * p.unitPrice * (1 - p.discount)}"
									pattern="#,###" /> VNĐ</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="row">
		<div class="dang-nhap">
			<h4 class="label label-warning">${message}</h4>

			<form:form action="/order/checkout" modelAttribute="order"
				method="post">
				<div class="form-group">
					<label>Người dùng:</label>
					<form:input id ="userId" path="user.id" class="form-control" readonly="true"/>
				</div>
				<div class="form-group">
					<label>Ngày đặt hàng:</label>
					<form:input path="orderDate" class="form-control" />
				</div>
				<div class="form-group">
					<label>Số điện thoại:</label>
					<form:input path="telephone" class="form-control" required="true" value="${sdt}" />
				</div>
				<div class="form-group">
					<label>Địa chỉ:</label>
					<form:input path="address" class="form-control" required="true" />
				</div>
				<div class="form-group">

					<form:hidden path="status"  class="form-control" />
				</div>
				<div class="form-group">
					<label>Tổng tiền:</label>
					<form:hidden path="amount" id="amount" class="form-control" />
					<div class="form-control"> <f:formatNumber value="${tong}" pattern="#,###" /> VNĐ
					</div>
				</div>
				<div class="form-group">
					<label>Ghi chú:</label>
					<form:textarea path="description" rows="3" class="form-control" />
				</div>
				<div class="form-group">
					<button class="btn btn-success">Thanh toán</button>

				</div>
				<div class="form-group">
					<button id="vnpay-button" class="btn btn-success">Thanh toán VNPay</button>

				</div>
			</form:form>
		</div>
		</div>
	</div>
</div>

<!-- Thêm thư viện jQuery nếu bạn chưa có -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	
    // Bắt sự kiện click vào nút "Thanh toán VNPay"
    $('#vnpay-button').click(function(event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit

        // Lấy giá trị amount từ input ẩn
        var amount = parseFloat($('#amount').val()).toFixed(0)*1000; // Chuyển đổi amount thành số nguyên
        var userId = $('#userId').val();
        var orderDate = $('#orderDate').val();
        var telephone = $('#telephone').val();
        var address = $('#address').val();
        var status = $('#status').val();
        var description = $('#description').val();
        var url = '/api/vnpay/pay?userId=' + userId +
        '&orderDate=' + orderDate +
        '&telephone=' + telephone +
        '&address=' + address +
        '&status=' + status +
        '&amount=' + amount +
        '&description=' + description;
        // Gửi dữ liệu đến API
        $.ajax({
            url: 'http://localhost:8080' + url, // Chỉnh sửa URL để chứa tham số amount
            type: 'GET', // Thay đổi phương thức thành GET
            success: function(response) {
                // Xử lý phản hồi từ API (nếu cần)
                console.log('Success:', response);
                window.location.href = response; 
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi (nếu có)
                console.error('Error:', error);
            }
        });
    });
});
</script>

