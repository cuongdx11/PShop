<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Voucher Data Table</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="dataTable_wrapper">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Voucher Code</th>
                                <th>Discount</th>
                                <th>Quantity</th>
                                <th>Expiry Date</th>
                                <th>Description</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="e" items="${list}">
                                <tr class="odd gradeX">
                                    <td>${e.id}</td>
                                    <td>${e.vouchercode}</td>
                                    <td>${e.discount}</td>
                                    <td>${e.quantity}</td>
                                    <td>${e.expiryDate}</td>
                                    <td>${e.description}</td>
                                    <td>
                                        <a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Edit</a>
                                        <a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Delete</a>
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
