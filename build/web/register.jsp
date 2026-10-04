<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Watch Luxury</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --pure-white: #ffffff;
            --pure-black: #000000;
            --soft-gray: #f5f5f5;
            --border-gray: #e0e0e0;
            --text-main: #1a1a1a;
            --text-muted: #666666;
            --accent-gray: #333333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), 
                        url('https://images.unsplash.com/photo-1523170335258-f5ed11844a49?q=80&w=2080');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 20px;
        }

        .signup-card {
            width: 100%;
            max-width: 700px;
            background: rgba(255, 255, 255, 0.98);
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 40px 80px rgba(0,0,0,0.6);
            position: relative; /* Thêm để định vị nút back */
        }

        /* Nút Back quay lại đăng nhập */
        .back-to-login {
            position: absolute;
            top: 25px;
            left: 25px;
            text-decoration: none;
            color: var(--text-muted);
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            z-index: 20;
        }

        .back-to-login:hover {
            color: var(--pure-black);
            transform: translateX(-5px);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header .brand-icon {
            font-size: 2.5rem;
            color: var(--pure-black);
            margin-bottom: 10px;
        }

        .header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            color: var(--pure-black);
            letter-spacing: 4px;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .header p {
            font-size: 0.75rem;
            color: var(--text-muted);
            letter-spacing: 6px;
            text-transform: uppercase;
        }

        .registration-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .full-row {
            grid-column: span 2;
        }

        .input-group label {
            display: block;
            font-size: 0.65rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 8px;
            color: var(--accent-gray);
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-wrapper .main-icon {
            position: absolute;
            left: 15px;
            color: var(--text-muted);
            font-size: 0.9rem;
            pointer-events: none;
        }

        .input-wrapper input {
            width: 100%;
            padding: 14px 45px 14px 45px;
            border: 1px solid var(--border-gray);
            background: var(--pure-white);
            font-family: inherit;
            font-size: 0.9rem;
            outline: none;
            transition: all 0.3s;
        }

        .input-wrapper input:focus {
            border-color: var(--pure-black);
            box-shadow: 0 0 0 3px rgba(0,0,0,0.05);
        }

        .toggle-password {
            position: absolute;
            right: 15px;
            color: var(--text-muted);
            cursor: pointer;
            font-size: 0.95rem;
            transition: color 0.3s;
            padding: 5px;
            z-index: 10;
        }

        .toggle-password:hover {
            color: var(--pure-black);
        }

        .btn-register {
            grid-column: span 2;
            background: var(--pure-black);
            color: var(--pure-white);
            border: 1px solid var(--pure-black);
            padding: 18px;
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 4px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .btn-register:hover {
            background: transparent;
            color: var(--pure-black);
        }

        .footer {
            grid-column: span 2;
            text-align: center;
            margin-top: 20px;
            font-size: 0.75rem;
            color: var(--text-muted);
        }

        .footer a {
            color: var(--pure-black);
            text-decoration: none;
            font-weight: 700;
            border-bottom: 1px solid transparent;
            transition: border-color 0.3s;
        }

        .footer a:hover {
            border-color: var(--pure-black);
        }

        @media (max-width: 640px) {
            .registration-form { grid-template-columns: 1fr; }
            .full-row, .btn-register, .footer { grid-column: span 1; }
            .signup-card { padding: 60px 20px 30px; }
            .back-to-login { top: 15px; left: 15px; }
        }
    </style>
</head>
<body>

    <div class="signup-card">
        <!-- Nút Back quay lại trang Login -->
        <a href="TrangChu" class="back-to-login">
            <i class="fa-solid fa-arrow-left-long"></i> Quay lại
        </a>

        <div class="header">
            <div class="brand-icon"><i class="fa-solid fa-gem"></i></div>
            <h1>KDA Luxury</h1>
            <p>Member Registration</p>
        </div>

        <form action="SignUp" method="POST" class="registration-form" id="registerForm" autocomplete="off" novalidate>
            <!-- Họ Tên -->
            <div class="input-group full-row">
                <label>Họ và Tên</label>
                <div class="input-wrapper">
                    <i class="fa-regular fa-user main-icon"></i>
                    <input type="text" name="fname" placeholder="Vui lòng nhập họ tên" autocomplete="off" >
                </div>
            </div>
            
            <!-- Tên đăng nhập (Username) -->
            <div class="input-group full-row">
                <label>Tên đăng nhập</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-id-badge main-icon"></i>
                    <input type="text" name="user" placeholder="Ví dụ: abc000" autocomplete="off" >
                    <c:if test="${error != null}">
                        <p style="color:red; text-align:center; margin-bottom:10px;">${error}</p>
                    </c:if>
                </div>
            </div>
            
            <!-- Email -->
            <div class="input-group">
                <label>Email</label>
                <div class="input-wrapper">
                    <i class="fa-regular fa-envelope main-icon"></i>
                    <input type="email" name="email" placeholder="mail@example.com" autocomplete="off">
                </div>
            </div>

            <!-- Số điện thoại -->
            <div class="input-group">
                <label>Số điện thoại</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-phone main-icon"></i>
                    <input type="tel" name="phone" placeholder="(+84)" autocomplete="off">
                </div>
            </div>

            <!-- Địa chỉ -->
            <div class="input-group full-row">
                <label>Địa chỉ thường trú</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-location-dot main-icon"></i>
                    <input type="text" name="address" placeholder="Số nhà, tên đường, quận/huyện, thành phố..." autocomplete="off" >
                </div>
            </div>

            <!-- Mật khẩu -->
            <div class="input-group">
                <label>Mật khẩu</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-lock main-icon"></i>
                    <input type="password" name="pass" id="password" placeholder="••••••••" autocomplete="off">
                    <i class="fa-regular fa-eye toggle-password" onclick="toggleVisibility('password', this)"></i>
                </div>
            </div>

            <!-- Xác nhận mật khẩu -->
            <div class="input-group">
                <label>Xác nhận mật khẩu</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-shield-halved main-icon"></i>
                    <input type="password" name="conf-p" id="confirm-password" placeholder="••••••••" autocomplete="off">
                    <i class="fa-regular fa-eye toggle-password" onclick="toggleVisibility('confirm-password', this)"></i>
                </div>
            </div>
            <c:if test="${error1 != null}">
                <div style="color: red;text-align: center;margin-bottom: 15px;ont-weight: 600;">${error1}</div>
            </c:if>
            <c:if test="${error2 != null}">
                <div style="color: red;text-align: center;margin-bottom: 15px;ont-weight: 600;">${error2}</div>
            </c:if>
            <c:if test="${not empty error3}">
                <div style="color: red;text-align: center;margin-bottom: 15px;ont-weight: 600;">${error3}</div>
            </c:if>

            <c:if test="${not empty error4}">
                <div style="color: red;text-align: center;margin-bottom: 15px;ont-weight: 600;">${error4}</div>
            </c:if>
            <button type="submit" class="btn-register">
                Đăng ký tài khoản <i class="fa-solid fa-chevron-right"></i>
            </button>

            <div class="footer">
                Bạn đã có tài khoản ? <a href="TrangChu?openLogin=true">Đăng nhập tại đây</a>
            </div>
        </form>
    </div>

    <script>
        function toggleVisibility(inputId, iconElement) {
            const input = document.getElementById(inputId);
            if (input.type === 'password') {
                input.type = 'text';
                iconElement.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                input.type = 'password';
                iconElement.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }

        window.addEventListener("pageshow", function () {
            document.querySelectorAll("#registerForm input").forEach(input => {
                input.value = "";
            });
        });
    </script>
</body>
</html>