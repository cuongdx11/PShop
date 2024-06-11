<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Bảng hiển thị dữ liệu</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Khách hàng</th>
								<th>Ngày đặt hàng</th>
								<th>Số điện thoại</th>
								
								<th>Trạng thái</th>
								<th>Thanh toán</th>
								<th>Tổng tiền</th>

								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr class="odd gradeX">
									<td>${e.id}</td>
									<td>${e.user.fullname}</td>
									<td><f:formatDate value="${e.orderDate}" pattern="dd/MM/yyy"/></td>
									<td>${e.telephone}</td>
									
									<td>
										<c:choose>
											<c:when test="${e.status == 0}">Chưa xử lý</c:when>
											<c:when test="${e.status == 1}">Đang xử lý</c:when>
											<c:when test="${e.status == 2}">Đang giao hàng</c:when>
											<c:when test="${e.status == 3}">Đã giao hàng</c:when>
											<c:when test="${e.status == 4}">Đã hủy</c:when>
											<c:otherwise>Không xác định</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${e.pay == 0}">Chưa thanh toán</c:when>
											<c:when test="${e.pay == 1}">Đã thanh toán</c:when>
											<c:otherwise>Không xác định</c:otherwise>
										</c:choose>
									</td>
									<td>
										<f:formatNumber value="${e.amount}" pattern="#,###" /> VNĐ
									</td>

									<td><a class="btn btn-sm btn-info"
										href="${base}/edit/${e.id}">Edit</a> <a
										class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>