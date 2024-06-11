<%@ page pageEncoding="utf-8"%>

<br/>
<div class="container">
    <div class="dang-nhap">
        <h2>ĐĂNG NHẬP</h2>
        <h4 class="label label-success">${message}</h4>
        <form action="/account/login" method="post">
            <div class="form-group">
                <label>Tên đăng nhập:</label> <input name="id" class="form-control"
                                                        value="${uid}" />
            </div>
            <div class="form-group">
                <label>Mật khẩu:</label> <input name="pw" type="password"
                                                 class="form-control" value="${pwd}" />
            </div>
            <div class="form-group form-inline">
                <input name="rm" type="checkbox" class="form-check-input" id="remember-me" />
                <label class="form-check-label" for="remember-me">Nhớ mật khẩu?</label>
                <a href="/account/forgot" class="btn btn-link ml-2">Quên mật khẩu?</a>
            </div>
            <div class="form-group">
                <button class="btn btn-success">Đăng nhập</button>
            </div>
        </form>
    </div>
</div>
<br/>
<br/>

<style>
    .dang-nhap {
        background-color: white;
        padding: 30px 120px;
        margin: 0 auto;
        width: 60%;
    }

    .form-inline {
        display: flex;
        align-items: center;
    }

    .form-inline label {
        margin-right: 150px;
    }
</style>
