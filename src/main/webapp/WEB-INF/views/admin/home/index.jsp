<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Trang quản trị</h1>
	</div>
</div>

    <div class="row">
    <div class="col-lg-12">
        <div class="pull-right notification-wrapper">
            <a href="#" class="notification-toggle" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell fa-fw fa-lg"></i>
                <c:if test="${not empty adminNotifications}">
                    <span class="notification-count">${fn:length(adminNotifications)}</span>
                </c:if>
            </a>
            <ul class="dropdown-menu dropdown-alerts notification-list">
                <c:choose>
                    <c:when test="${not empty adminNotifications}">
                        <c:forEach var="notification" items="${adminNotifications}">
                            <li><a href="/admin/order/edit/${orderId}">${notification}</a></li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <li>Không có thông báo mới</li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>

<div class="row">
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-trophy fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">${product.size()}</div>
						<div>Sản phẩm</div>
					</div>
				</div>
			</div>
			<a href="/admin/customer/index">
				<div class="panel-footer">
					<span class="pull-left">Thêm nhanh</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-green">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-shopping-cart fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">${order.size()}</div>
						<div>Đơn hàng</div>
					</div>
				</div>
			</div>
			<a href="/admin/order/index">
				<div class="panel-footer">
					<span class="pull-left">Xem</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-yellow">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-user fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">${user.size()}</div>
						<div>Tài khoản</div>
					</div>
				</div>
			</div>
			<a href="/admin/customer/index">
				<div class="panel-footer">
					<span class="pull-left">Thêm nhanh</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-red">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-thumbs-o-up fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">13</div>
						<div>Phản hồi</div>
					</div>
				</div>
			</div>
			<a href="#">
				<div class="panel-footer">
					<span class="pull-left">Xem</span> <span class="pull-right"><i
						class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
</div>
<!-- /.row -->
<hr />
<img class="img-thumbnail"
	src="http://localhost:8080/ProjectJavaWebSpringHibernate/themes/img/slider_1.jpg"
	alt="">
<style>
.notification-wrapper {
    position: relative;
}

.notification-toggle {
    color: #333;
    position: relative;
}

.notification-count {
    position: absolute;
    top: -10px;
    right: -10px;
    background-color: #d9534f;
    color: #fff;
    border-radius: 50%;
    padding: 2px 5px;
    font-size: 12px;
}

.notification-list {
    width: 300px;
    max-height: 300px;
    overflow-y: auto;
}
</style>