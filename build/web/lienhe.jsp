<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ | LUXURY WATCH</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap&subset=vietnamese" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --bg-light: #fdfdfd;
            --bg-card: #ffffff;
            --bg-secondary: #f9f9f9;
            --text-dark: #1a1a1a;
            --text-gray: #666666;
            --gold-bright: #9c824a;
            --gold-soft: #b89b5e;
            --border: rgba(0, 0, 0, 0.08);
        }
        #formTitle {
            font-family: 'Montserrat', sans-serif;
            font-size: 2rem;
            font-weight: 700;
            color: #2b2b2b;
            margin-bottom: 25px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            font-family: 'Tenor Sans', sans-serif;
            line-height: 1.6;
        }
        h1, h2, h3, .serif , .brand{ font-family: 'Cinzel', serif; letter-spacing: 2px; }
        .brand {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-dark);
            text-decoration: none;
            white-space: nowrap;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .gold-text { color: #B9935E; }
        .gold-bg { background-color: #B9935E; }
        
        .input-field {
            border-bottom: 1px solid #e2e8f0;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            border-bottom: 1px solid #B9935E;
            outline: none;
        }
        .error-text {
            color: #cc0000;
            font-size: 0.75rem;
            margin-top: 4px;
            display: none;
        }
        .invalid {
            border-bottom-color: #cc0000 !important;
        }
        
        nav {
            position: sticky; top: 0; width: 100%;
            display: flex; justify-content: space-between; align-items: center;
            padding: 15px 5%; z-index: 1000;
            background: rgba(255, 255, 255, 0.98);
            border-bottom: 1px solid var(--border);
            box-shadow: 0 2px 15px rgba(0,0,0,0.02);
        }
        nav a {
            font-size: 0.7rem;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: #1a1a1a;
            font-weight: 500;
        }
        
        .btn-luxury {
            background-color: #000;
            color: #fff;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            transition: all 0.3s ease;
        }
        .btn-luxury:hover {
            background-color: #B9935E;
        }
        .btn-view {
            display: block; width: 100%; padding: 14px;
            border: 1px solid var(--text-dark); text-decoration: none;
            color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase;
            letter-spacing: 2px; transition: 0.3s;
        }
        .btn-view:hover { background: var(--gold-bright); color: #fff; }

        .dropdown-user {
            display: none;
            position: absolute;
            right: 0;
            top: 30px;
            background: white;
            border: 1px solid #eee;
            min-width: 150px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .dropdown-user a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: black;
        }
        .dropdown-user a:hover { background: #f5f5f5; color: var(--gold-bright); }
        .nav-left { flex: 1; display: flex; align-items: center; }
        .nav-search { flex: 1.5; display: flex; justify-content: center; }
        .nav-center { flex: 2; display: flex; justify-content: center; }
        .nav-right { flex: 1; display: flex; justify-content: flex-end; align-items: center; gap: 20px; }
        
        .nav-links { display: flex; gap: 25px; list-style: none; align-items: center; }
        .nav-links a { 
            color: var(--text-dark); text-decoration: none; font-size: 0.75rem; 
            text-transform: uppercase; letter-spacing: 1.5px; opacity: 0.8;
            transition: 0.3s; font-weight: 500; display: inline-block; position: relative; 
        }
        .nav-links a:hover { opacity: 1; color: var(--text-dark); transform: scale(1.1); }
        .nav-links a::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 0%;
            height: 1.5px;
            background-color: #000;
            transition: width 0.3s ease;
        }
        .nav-links a:hover::after, .nav-links a.active::after {
            width: 100%;
        }

        .search-container {
            position: relative;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 2px 5px;
            width: 100%;
            max-width: 300px;
            transition: 0.3s;
        }
        .search-container:focus-within {
            border-bottom: 1px solid var(--gold-bright);
        }
        .search-input {
            border: none;
            outline: none;
            font-size: 0.75rem;
            padding: 5px;
            width: 100%;
            background: transparent;
            font-family: inherit;
        }
        .search-btn {
            background: none;
            border: none;
            color: var(--text-gray);
            cursor: pointer;
            font-size: 0.8rem;
            transition: 0.3s;
        }
        .search-btn:hover { color: var(--gold-bright); }

        .auth-buttons { display: flex; align-items: center; gap: 15px; }
        .auth-link {
            text-decoration: none; color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase; letter-spacing: 1px; transition: 0.3s; opacity: 0.8;
        }
        .auth-link:hover { color: var(--text-dark); opacity: 1; transform: scale(1.2); }
        .auth-divider { width: 2px; height: 14px; background: var(--text-gray); opacity: 1; }

        .user-profile { position: relative; display: flex; align-items: center; }
        .breadcrumb {
            padding: 30px 8% 0;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-gray);
        }
        .breadcrumb a { color: var(--gold-bright); text-decoration: none; margin-right: 5px; }
        .breadcrumb span { margin: 0 10px; opacity: 0.5; }
        
        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.7);
            backdrop-filter: blur(8px);
        }
        .modal-content {
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            width: 420px;
            padding: 35px;
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.5);
        }
        .modal-content input {
            width: 100%; padding: 14px; margin: 12px 0;
            border-radius: 10px; border: 1px solid #ddd;
            font-size: 14px;
        }
        .modal-content button {
            width: 100%; padding: 14px; margin-top: 10px;
            background: linear-gradient(135deg, #000, #333);
            color: #fff; border: none; border-radius: 10px;
            font-weight: bold; cursor: pointer; transition: 0.3s;
        }
        .modal-content button:hover { background: var(--gold-bright); }
        .close {
            position: absolute; right: 15px; top: 15px;
            font-size: 18px; cursor: pointer; color: #888;
        }
        .password-wrapper { position: relative; width: 100%; }
        .toggle-password {
            position: absolute; right: 12px; top: 50%;
            transform: translateY(-50%); cursor: pointer; color: #888;
        }
        .register-text { margin-top: 18px; font-size: 14px; color: #666; }
        .register-text a { color: var(--gold-bright); font-weight: 600; text-decoration: none; }
        
        .dropdown { position: relative; display: inline-block; }
        .dropdown-btn {
            color: var(--text-dark); text-decoration: none; font-size: 0.75rem; 
            text-transform: uppercase; letter-spacing: 2px; opacity: 0.7;
            transition: 0.3s; display: inline-block; background: none; border: none; cursor: pointer;
        }
        .dropdown-btn:hover { color: var(--text-dark); transform: scale(1.2); opacity: 1; }
        .dropdown-content {
            display: none;
            position: absolute;
            top: 35px;
            left: 0;
            background: white;
            min-width: 220px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            z-index: 999;
        }
        .dropdown-content a {
            display: block;
            padding: 12px 16px;
            color: var(--text-dark);
            text-decoration: none;
            transition: 0.2s;
        }
        .dropdown-content a:hover { color: var(--text-dark); transform: scale(1.05); opacity: 1; }
    </style>
</head>
<body class="text-gray-900">

    <nav>
        <!-- Phía trái: Brand -->
        <div class="nav-left">
            <a href="TrangChu" class="brand">
                <img src="images/kda.png" alt="Logo" class="w-10 h-10 object-cover">
                <span>KDA LUXURY</span>
            </a>
        </div>

        <!-- Ở giữa: Search Bar -->
        <div class="nav-search">
            <form action="Search" method="get" class="search-container">
                <input type="text" name="txt" class="search-input" placeholder="Tìm sản phẩm..." value="${txtS}">
                <input type="hidden" name="type" value="${sortType}">
                <button type="submit" class="search-btn">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>

        <!-- Phía giữa bên phải: Links -->
        <div class="nav-center">
            <ul class="nav-links">
                <li><a href="TrangChu">Trang Chủ</a></li>
                <li><a href="SanPham">Bộ Sưu Tập</a></li>
                <c:choose>
                    <c:when test="${sessionScope.acc != null && sessionScope.acc.role == 1}">
                        <div class="dropdown">
                            <button class="dropdown-btn" onclick="toggleSupportMenu()"> Quản Lý </button>
                            <div id="supportMenu" class="dropdown-content">
                                <a href="ManagerProduct">Quản lý sản phẩm</a>
                                <a href="revenue">Doanh Thu</a>
                                <a href="feedback">Phản Hồi Khách Hàng</a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <button class="dropdown-btn" onclick="toggleSupportMenu()"> Hỗ Trợ </button>
                            <div id="supportMenu" class="dropdown-content">
                                <a href="Warranty">Chính sách bảo hành</a>
                                <a href="Contacts">Liên hệ</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <li>
                    <c:choose>
                        <c:when test="${sessionScope.acc == null}">
                            <a href="javascript:void(0)" onclick="openLogin()">Giỏ Hàng</a>
                        </c:when>
                        <c:otherwise>
                            <a href="Cart">Giỏ Hàng</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>

        <!-- Phía phải: Account & Cart Icons -->
        <div class="nav-right">
            <div class="auth-buttons">
                <div class="relative">
                    <div onclick="toggleCartDropdown()" class="relative cursor-pointer hover:scale-110 transition-transform duration-300">
                        <i data-lucide="shopping-bag" class="w-5 h-5 text-zinc-800"></i>
                        <span id="cart-count-badge" class="absolute -top-2 -right-3 bg-red-500 text-white text-[10px] font-bold w-4 h-4 rounded-full flex items-center justify-center ${sessionScope.acc == null || empty cart ? 'hidden' : ''}">
                            ${sessionScope.acc != null && not empty cart ? cart.totalQuantity : ''}
                        </span>
                    </div>
                    <div id="cartDropdown" class="hidden absolute right-0 mt-4 w-[340px] bg-white shadow-2xl rounded-xl border border-gray-100 z-50 overflow-hidden">
                        <div class="absolute -top-2 right-5 w-4 h-4 bg-white rotate-45 border-l border-t border-gray-100"></div>
                        <c:choose>
                            <c:when test="${not empty cart.items}">
                                <div class="max-h-[350px] overflow-y-auto">
                                    <c:forEach items="${cart.items}" var="i">
                                        <div class="flex items-center gap-3 p-4 hover:bg-gray-50 border-b">
                                            <img src="${i.product.image}" class="w-16 h-16 object-cover rounded-lg border">
                                            <div class="flex-1">
                                                <h4 class="text-sm font-semibold line-clamp-1">${i.product.name}</h4>
                                                <p class="text-xs text-gray-500 mt-1">SL: ${i.quantity} </p>
                                                <c:choose>
                                                    <c:when test="${i.product.sale_price != null && i.product.sale_price > 0}">
                                                        <p class="text-xs text-gray-400 line-through"><fmt:formatNumber value="${i.product.price}" type="number"/> VNĐ </p>
                                                        <p class="text-sm font-bold text-red-500 mt-1"><fmt:formatNumber value="${i.product.sale_price}" type="number"/> VNĐ </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-sm font-bold text-black mt-1">
                                                            <fmt:formatNumber value="${i.product.price}" type="number"/> VNĐ </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="p-4 flex items-center justify-between">
                                <div class="text-sm">Tổng:
                                    <span class="font-bold text-red-500"><fmt:formatNumber value="${cart.totalPrice}" type="number"/> VNĐ </span>
                                </div>
                                <a href="Cart" class="bg-black text-white px-4 py-2 text-xs uppercase tracking-wider rounded-lg hover:bg-[#b08d57] transition">Xem chi tiết</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="flex flex-col items-center justify-center py-10 text-center">
                                <p class="text-gray-500 text-sm uppercase tracking-[3px] mb-5">Chưa có sản phẩm</p>
                                <a href="SanPham" class="bg-black text-white px-5 py-3 text-[11px] uppercase tracking-[2px] rounded-lg hover:bg-[#b08d57] transition-all duration-300">Thêm sản phẩm</a>
                          </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <c:choose>
                <c:when test="${sessionScope.acc != null}">
                    <div class="user-profile cursor-pointer" onclick="toggleUserMenu()">
                        <div class="flex items-center gap-3">
                            <i data-lucide="user-round" class="w-5 h-5 text-zinc-800"></i>
                            <span class="text-[9px] uppercase font-bold tracking-widest text-zinc-600">${sessionScope.acc.username}</span>
                        </div>
                        <div id="dropdownUser" class="dropdown-user">
                            <a href="Profile"><i class="far fa-id-card"></i> Hồ sơ</a>
                            <a href="Logout" style="color: #ff4d4d;"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="javascript:void(0)" onclick="openLogin()" class="auth-link">Đăng Nhập</a>
                    <span class="auth-divider"></span>
                    <a href="Register" class="auth-link">Đăng Ký</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

    <div class="breadcrumb">
        <a href="TrangChu">Trang Chủ</a> <span>/</span> <a href="Contacts">Liên Hệ</a>
    </div>

    <main class="max-w-6xl mx-auto px-6 py-20">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-24">
            <!-- Phần thông tin -->
            <div class="space-y-12">
                <div>
                    <h1 class="text-5xl mb-6">Liên Hệ Với <br><span class="gold-text italic">Chúng Tôi</span></h1>
                    <p class="text-gray-400 font-light leading-relaxed max-w-sm text-sm">
                        Chúng tôi luôn sẵn lòng lắng nghe và hỗ trợ bạn tìm thấy những cỗ máy thời gian hoàn hảo nhất. Đừng ngần ngại để lại lời nhắn.
                    </p>
                </div>

                <div class="space-y-8">
                    <div class="flex items-start space-x-4">
                        <div class="mt-1 gold-text text-sm"><i class="fa-solid fa-location-dot"></i></div>
                        <div>
                            <h4 class="font-bold uppercase text-[10px] tracking-[0.2em] text-gray-400 mb-1">Địa chỉ</h4>
                            <p class="text-sm font-medium">số 32 Đào Tấn, Hà Nội </p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4">
                        <div class="mt-1 gold-text text-sm"><i class="fa-solid fa-phone"></i></div>
                        <div>
                            <h4 class="font-bold uppercase text-[10px] tracking-[0.2em] text-gray-400 mb-1">Điện thoại</h4>
                            <p class="text-sm font-medium">+84 (0) 963897376</p>
                        </div>
                    </div>

                    <div class="flex items-start space-x-4">
                        <div class="mt-1 gold-text text-sm"><i class="fa-solid fa-envelope"></i></div>
                        <div>
                            <h4 class="font-bold uppercase text-[10px] tracking-[0.2em] text-gray-400 mb-1">Email</h4>
                            <p class="text-sm italic font-medium">Ducanh17102005@gmai.com</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Liên Hệ (Naurnos dagiti naibati a double quotes ken id-id-in) -->
            <div class="bg-white p-2">
                <c:if test="${not empty error}">
                    <div class="mb-6 p-4 rounded-lg bg-red-50 border border-red-200 text-red-600 text-sm">${error}</div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="mb-6 p-4 rounded-lg bg-green-50 border border-green-200 text-green-600 text-sm">${success}</div>
                </c:if>
                <form id="contactForm" action="${sessionScope.acc == null ? '#' : 'Contacts'}" method="post" class="space-y-10" novalidate onsubmit="${sessionScope.acc == null ? 'openLogin(); return false;' : ''}">
                    <div class="relative">
                        <label class="text-[10px] uppercase tracking-[0.2em] text-gray-700 block mb-2 font-bold">Họ và tên của bạn</label>
                        <input type="text" id="fullname" name="fullname" placeholder="Vd: Nguyễn Văn A" 
                            class="input-field w-full py-3 bg-transparent text-sm placeholder-gray-200" value="${sessionScope.acc.fullname}">
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                        <div class="relative">
                            <label class="text-[10px] uppercase tracking-[0.2em] text-gray-700 block mb-2 font-bold">Địa chỉ Email</label>
                            <input type="email" id="email" name="email" placeholder="email@domain.com" 
                                class="input-field w-full py-3 bg-transparent text-sm placeholder-gray-200" value="${sessionScope.acc.email}">
                        </div>
                        <div class="relative">
                            <label class="text-[10px] uppercase tracking-[0.2em] text-gray-700 block mb-2 font-bold">Số điện thoại</label>
                            <input type="tel" id="phone" name="phone" placeholder="09xx xxx xxx" 
                                class="input-field w-full py-3 bg-transparent text-sm placeholder-gray-200" value="${sessionScope.acc.phone}">
                        </div>
                    </div>

                    <div class="relative">
                        <label class="text-[10px] uppercase tracking-[0.2em] text-gray-700 block mb-2 font-bold">Nội dung</label>
                        <textarea id="message" name="message" rows="3" placeholder="Viết nội dung tại đây..." 
                            class="input-field w-full py-3 bg-transparent text-sm resize-none placeholder-gray-200"></textarea>
                        <p id="error-message" class="error-text">Vui lòng nhập lời nhắn</p>
                    </div>

                    <button type="submit" class="btn-luxury w-full py-5 text-[10px] font-bold rounded-sm mt-4"> Hoàn tất gửi yêu cầu </button>
                </form>
            </div>
        </div>
    </main>

    <!-- Modal Success -->
    <div id="successModal" class="hidden fixed inset-0 bg-black/90 flex items-center justify-center z-[100] px-6">
        <div class="bg-white max-w-sm w-full p-12 text-center shadow-2xl">
            <div class="text-3xl gold-text mb-6 italic serif">Thành Công</div>
            <p class="text-gray-400 text-xs tracking-widest leading-relaxed mb-10 uppercase">
                Yêu cầu của bạn đã được gửi và lưu trữ vào hệ thống.
            </p>
            <button onclick="goHome()" class="btn-luxury px-12 py-4 text-[9px] font-bold tracking-[0.3em]"> Về trang chủ </button>
        </div>
    </div>

    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeLogin()">&times;</span>
            <h2 id="formTitle">Đăng nhập</h2>
            <form action="Login" method="post">
                <input type="text" name="user" placeholder="Tên đăng nhập" required>
                <div class="password-wrapper">
                    <input type="password" name="pass" id="password" placeholder="Mật khẩu" required>
                    <i class="fa-solid fa-eye toggle-password" onclick="togglePassword()"></i>
                </div>
                <c:if test="${not empty error}">
                    <p style="color: #ff4d4d; margin: 10px 0; font-size: 0.8rem;">${error}</p>
                </c:if>
                <button type="submit">Đăng nhập</button>
            </form>
            <p class="register-text">Chưa có tài khoản? <a href="Register">Đăng ký ngay</a></p>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        const form = document.getElementById('contactForm');
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const phoneRegex = /(84|0[3|5|7|8|9])+([0-9]{8})\b/;

        if (form) {
            form.addEventListener('submit', function(e) {
                let isValid = true;
                const checks = [
                    { id: 'fullname', valid: v => v.trim().length > 0 },
                    { id: 'email', valid: v => emailRegex.test(v.trim()) },
                    { id: 'phone', valid: v => phoneRegex.test(v.trim()) },
                    { id: 'message', valid: v => v.trim().length > 5 }
                ];
                checks.forEach(check => {
                    const el = document.getElementById(check.id);
                    const err = document.getElementById(`error-\${check.id}`);

                    if (el && !check.valid(el.value)) {
                        el.classList.add('invalid');
                        if (err) err.style.display = 'block';
                        isValid = false;
                    } else if (el) {
                        el.classList.remove('invalid');
                        if (err) err.style.display = 'none';
                    }
                });
                if (!isValid) {
                    e.preventDefault();
                }
            });
        }

        function closeModal() {
            document.getElementById('successModal').classList.add('hidden');
            if (form) {
                form.reset();
                form.style.opacity = "1";
                form.style.pointerEvents = "auto";
            }
        }
        
        function goHome() {
            window.location.href = "TrangChu";
        }

        <c:if test="${not empty success}">
            window.onload = function () {
                const modal = document.getElementById("successModal");
                if(modal) modal.classList.remove("hidden");

                setTimeout(() => {
                    window.location.href = "TrangChu";
                }, 3000);
          }
        </c:if>

        function toggleUserMenu() {
            let menu = document.getElementById("dropdownUser");
            if(menu) menu.style.display = (menu.style.display === "block") ? "none" : "block";
        }

        function openLogin() {
            document.getElementById("loginModal").style.display = "block";
        }

        function closeLogin() {
            document.getElementById("loginModal").style.display = "none";
        }

        window.onclick = function(e) {
            let modal = document.getElementById("loginModal");
            if (e.target === modal) closeLogin();
        }

        lucide.createIcons();

        function toggleCartDropdown() {
            const dropdown = document.getElementById("cartDropdown");
            if(dropdown) dropdown.classList.toggle("hidden");
        }

        document.addEventListener("click", function(e) {
            const cart = document.getElementById("cartDropdown");
            if (cart && !e.target.closest(".relative")) {
                cart.classList.add("hidden");
          }
      });
    </script>
</body>
</html>