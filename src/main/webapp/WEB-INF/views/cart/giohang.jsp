<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:set var="count" value="${count}" />
<c:set var="tong" value="${tong}" />
<c:set var="productQuantities" value="${productQuantities}" />
<h3 class="title">
  <b>GIỎ HÀNG</b>
</h3>
<div class ="row">
<div class="col-9">
<div class="ct1">
  <h5 style="margin-top:-10px">
    <span style="font-weight: 700;">
      <c:choose>
        <c:when test="${count > 0}">
          Giỏ hàng của bạn (
          <b class="cart-cnt">${count}</b> sản phẩm )
        </c:when>
        <c:otherwise>
          Giỏ hàng của bạn ( <b class="cart-cnt">0</b> sản phẩm )
        </c:otherwise>
      </c:choose>
    </span>
    <span style="float: right; padding: 0px 90px 0px 0px; font-weight: bold; font-size: 16px;">
      <c:choose>
        <c:when test="${count > 0}">
          Tổng tiền:
          <span style="color: #CC3300">
            <f:formatNumber value="${tong}" pattern="#,###" /> VNĐ
          </span>
        </c:when>
        <c:otherwise>
          Tổng tiền: <span style="color: #CC3300"> 0 VNĐ</span>
        </c:otherwise>
      </c:choose>
    </span>
  </h5>
  
  <table class="table">
    <tbody>
      <c:choose>
        <c:when test="${count > 0}">
          <c:forEach var="p" items="${pro}">
            <tr data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
              <td style="width: 120px; padding: 10px 0px 10px 0px;">
                <img src="/static/images/products/${p.image}" width="100%" />
              </td>
              <td style="padding: 40px 0px 40px 30px;">
                <p style="font-size: 18px; font-weight: bold;">${p.name}</p>
                <p style="color: gray;">SKU : ${p.id}</p>
              </td>
              <td style="padding: 40px 0px 40px 0px; font-size: 16px">
                <c:choose>
                  <c:when test="${p.discount <= 0 }">
                    <p style="text-align: left; font-weight: bold; color: #474c51; padding: 20px 0px 0px 0px">
                      <f:formatNumber value="${p.unitPrice}" pattern="#,###" /> VNĐ
                    </p>
                  </c:when>
                  <c:otherwise>
                    <p style="font-weight: bold;">
                      <span style="text-decoration: line-through; color: Gray;">
                        <f:formatNumber value="${p.unitPrice}" pattern="#,###" /> VNĐ
                      </span>
                      <span style="vertical-align: super; background-color: red; border-radius: 15%; padding: 2px">
                        - <f:formatNumber value="${p.discount}" type="percent" />
                      </span>
                    </p>
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${p.discount > 0 }">
                    <p style="font-weight: bold; color: #474c51">
                      <f:formatNumber value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" /> VNĐ
                    </p>
                  </c:when>
                  <c:otherwise></c:otherwise>
                </c:choose>
              </td>
              <td style="padding: 50px 0px 40px 0px;">
                <input id="num" value="${p.quantity}" type="number" min="1" style="width: 100px; height: 30px; font-size: 16px; border: 1px solid black;" />
              </td>
               <td style="padding: 55px 0px 40px 0px; font-weight: bold; font-size: 16px">
            <span class="product-quantity">Có sẵn: ${productQuantities.get(p.id)}</span>
        </td>
              <c:set var="productQuantity" value="${cart.getProductQuantity(p.id)}" />
             <td style="padding: 55px 0px 40px 0px; font-weight: bold; font-size: 16px">
   <span class="product-quantity">T: ${productQuantity}</span>
</td>
              <td class="amt" style="padding: 55px 0px 40px 0px; font-weight: bold; font-size: 16px">
                <f:formatNumber value="${p.quantity * p.unitPrice * (1 - p.discount)}" pattern="#,###" /> VNĐ
              </td>
              
              <td style="padding: 50px 0px 40px 0px;">
                <button class="btn btn-sm btn-warning btn-cart-remove">
                  <i class="glyphicon glyphicon-trash"></i>
                </button>
              </td>
            </tr>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="6">
              <p>Chưa có sản phẩm nào trong giỏ hàng!</p>
            </td>
          </tr>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
  <hr />
  <div class="text-center" style="font-size: 18px; padding-bottom: 30px">
    <button class="btn btn-sm btn-danger btn-cart-clear">Xóa giỏ hàng</button>
    <c:choose>
      <c:when test="${count > 0}">
        <a href="/home" class="btn btn-sm btn-info">Tiếp tục mua hàng</a>
        <a id="checkoutBtn" href="/order/checkout" class="btn btn-sm btn-success">Thanh toán</a>
      </c:when>
      <c:otherwise>
        <a href="/home" class="btn btn-sm btn-info">Tiếp tục mua hàng</a>
      </c:otherwise>
    </c:choose>
  </div>
</div>
</div>
<div class="col-md-3 col-2 ct1">
 <div style="margin-bottom: 20px;">
    <label for="discountCode" style="display: inline-block; margin-right: 10px;">Nhập mã giảm giá:</label>
    <input type="text" id="discountCode" name="discountCode" style="display: inline-block; margin-right: 10px; padding: 5px;">
    <button id="applyDiscountBtn" style="display: inline-block; background-color: #007bff; color: #fff; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer;">Áp mã</button>
</div>
<div id="voucherMessage" style="color: red; font-size: 16px; margin-top: 10px;"></div> <!-- Phần tử này để hiển thị thông báo -->
<!-- Tạm tính -->
<div style="display: inline-block;">
    <h5 style="margin-top: 20px; display: inline-block;">Tạm tính:</h5>
    <span id="totalAmount" style="color: #CC3300; font-size: 18px; font-weight: bold; display: inline-block;">
        <f:formatNumber value="${tong}" pattern="#,###" /> VNĐ
    </span>
</div>
<div >
    <h5 style="margin-top: 20px; display: inline-block;">Giảm giá:</h5>
    <span id="discountAmount" style="color: #CC3300; font-size: 18px; font-weight: bold; display: inline-block;">
        0 VNĐ
    </span>
</div>
<div >
    <h5 style="margin-top: 20px; display: inline-block;">Thanh toán:</h5>
    <span id="tongTien" style="color: #CC3300; font-size: 18px; font-weight: bold; display: inline-block;">
        <f:formatNumber value="${tong}" pattern="#,###" /> VNĐ
    </span>
</div>
  </div>
  <br></br>
</div>
<style>
  .btn-cart-clear,
  .btn-info,
  .btn-success {
    font-size: 18px;
    font-weight: bold;
  }
</style>
<script>
$(document).ready(function() {
    $("#applyDiscountBtn").click(function() {
        var voucherCode = $("#discountCode").val();
        $.ajax({
            type: "GET",
            url: "/api/voucher/" + voucherCode,
            success: function(response) {
                // Kiểm tra nếu dữ liệu được trả về hợp lệ
                var voucher;
                try {
                    voucher = JSON.parse(response);
                } catch (e) {
                    $("#voucherMessage").text("Mã voucher không hợp lệ.");
                    return;
                }

                if (voucher == null) {
                    $("#voucherMessage").text("Mã voucher không tồn tại.");
                    return;
                }

                var tamTinh = parseInt($("#totalAmount").text().replace(/,/g, '').replace(' VNĐ', ''));
                var currentDate = new Date();
                var expiryDate = new Date(voucher.expiryDate);

                if (voucher && voucher.discount) {
                    if (voucher.quantity <= 0) {
                        $("#voucherMessage").text("Mã voucher đã hết.");
                    } else if (expiryDate < currentDate) {
                        $("#voucherMessage").text("Mã voucher đã hết hạn.");
                    } else {
                    	
                        var giamGia = voucher.discount * 1000;
                        var tongTien = tamTinh - giamGia;
                    	
                    	
                        
                        $("#discountAmount").text(giamGia.toLocaleString() + " VNĐ");
                        
                        $("#tongTien").text(tongTien.toLocaleString() + " VNĐ");
                        $("#voucherMessage").text(""); // Xóa thông báo nếu áp dụng thành công
                    }
                } else {
                    $("#voucherMessage").text("Mã voucher không hợp lệ.");
                }
            },
            error: function() {
                console.log(response);
                $("#voucherMessage").text("Đã xảy ra lỗi khi áp dụng giảm giá.");
                $("#discountAmount").text("0 VNĐ");
                $("#tongTien").text($("#totalAmount").text());
            }
        });
    });

    $("#checkoutBtn").click(function(e) {
        var tongTien = parseInt($("#tongTien").text().replace(/,/g, '').replace(' VNĐ', ''));
        var checkoutUrl = "/order/checkout?tongTien=" + tongTien;
        $(this).attr("href", checkoutUrl);
    });
});
</script>





