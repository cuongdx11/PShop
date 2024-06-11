<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

    
<div id="login-alert" class="alert">${message}</div>
    
<style>
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
  
  
    