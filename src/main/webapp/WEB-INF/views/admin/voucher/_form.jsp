<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form:form action="${base}/index" modelAttribute="entity" role="form">
                            <div class="form-group">
                                <label>ID:</label>
                                <form:input path="id" class="form-control" readonly="readonly"/>
                            </div>
                            <div class="form-group">
                                <label>Voucher Code:</label>
                                <form:input path="vouchercode" class="form-control" required="required" pattern=".{1,}" title="Voucher Code is required"/>
                            </div>
                            <div class="form-group">
                                <label>Discount:</label>
                                <form:input path="discount" class="form-control" required="required" type="number" step="0.01" min="0" title="Discount should be a positive number"/>
                            </div>
                            <div class="form-group">
                                <label>Quantity:</label>
                                <form:input path="quantity" class="form-control" required="required" type="number" min="1" title="Quantity should be at least 1"/>
                            </div>
                            <div class="form-group">
                                <label>Expiry Date:</label>
                                <form:input path="expiryDate" class="form-control" required="required" type="date" title="Expiry Date is required"/>
                            </div>
                            <div class="form-group">
                                <label>Description:</label>
                                <form:textarea path="description" class="form-control" rows="3" title="Description is optional"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary" formaction="${base}/create">Create</button>
                                <button class="btn btn-warning" formaction="${base}/update">Update</button>
                                <button class="btn btn-danger" formaction="${base}/delete">Delete</button>
                                <a class="btn btn-default" href="${base}/index">Reset</a>
                            </div>
                        </form:form>
                    </div>
                    <!-- /.col-lg-6 (nested) -->
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
