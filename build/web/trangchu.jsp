<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watch Luxury - Thế giới đồng hồ cao cấp</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap&subset=vietnamese" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --bg-light: #fdfdfd;
            --bg-secondary: #f4f4f4;
            --text-dark: #1a1a1a;
            --text-gray: #666666;
            --gold-subtle: #b89b5e;
            --gold-bright: #9c824a;
            --border-light: rgba(0, 0, 0, 0.05);
            --red-accent: #c62828; /* Màu cho nhãn Sale */
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            font-family: 'Tenor Sans', sans-serif;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        h1, h2, h3, .brand { font-family: 'Cinzel', serif; letter-spacing: 3px; }
        #formTitle {
            font-family: 'Montserrat', sans-serif;
            font-size: 2rem;
            font-weight: 700;
            color: #2b2b2b;
            margin-bottom: 25px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
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
        /* --- Navigation --- */
        nav {
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 28px 5%;
            height: 110px;
            z-index: 1000;
            background: linear-gradient(to bottom, rgba(255,255,255,0.9), transparent);
            transition:
                height 0.35s ease,
                padding 0.35s ease,
                background 0.35s ease;
        }
        nav.scrolled { 
            height: 78px;
            padding: 12px 5%;
            background: rgba(255,255,255,0.98);
            border-bottom: 1px solid var(--border-light);
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }


        .nav-links { display: flex; gap: 32px; list-style: none; align-items: center; margin-right: 50px;}
        .nav-links a { 
            color: var(--text-dark); text-decoration: none; font-size: 0.75rem; 
            text-transform: uppercase; letter-spacing: 2px; opacity: 0.7;
            transition: 0.3s; display: inline-block;
        }
        .nav-links a:hover { opacity: 1; color: var(--text-dark); transform: scale(1.2); }
        .nav-search {  flex: 1;
            display: flex;
            justify-content: center;
            margin: 0 40px; }
        .nav-left{
            flex-shrink: 0;
        }
        /* --- Search Bar Style --- */
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


        .auth-controls { display: flex; align-items: center; gap: 20px;  }
        .auth-link { text-decoration: none; color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase; letter-spacing: 1px; transition: 0.3s; opacity: 0.8; }
        .auth-link:hover { color: var(--text-dark); opacity: 1; transform: scale(1.2); }
        .auth-divider { width: 2px; height: 14px; background: var(--text-gray); opacity: 1; }

        /* --- Hero Section --- */
        .hero {
            height: 100vh; display: flex; align-items: center; justify-content: center;
            position: relative; overflow: hidden;
        }
        .hero-bg {
            position: absolute; width: 100%; height: 100%;
            background: url('https://images.unsplash.com/photo-1614164185128-e4ec99c436d7?q=80&w=2500') center/cover;
            filter: brightness(0.5) contrast(1.1); z-index: -1;
            animation: slowZoom 30s infinite alternate;
        }
        @keyframes slowZoom { from { transform: scale(1); } to { transform: scale(1.1); } }
        .hero-content { text-align: center; max-width: 800px; z-index: 2; }
        .hero-content h1 { font-size: 5.5rem; line-height: 1.1; margin-bottom: 35px; color: #fff; text-shadow: 0 5px 30px rgba(0,0,0,0.3); }
        .hero-content span { 
            color: var(--gold-bright); display: block; 
            font-size: 0.9rem; letter-spacing: 12px; text-transform: uppercase;
            margin-bottom: 20px; animation: fadeInUp 1s ease;
        }

        .btn-gold {
            display: inline-block; padding: 18px 45px;
            border: 1px solid var(--gold-bright); color: var(--gold-bright);
            text-decoration: none; text-transform: uppercase; font-size: 0.75rem;
            letter-spacing: 4px; transition: 0.5s; background: transparent;
        }
        .btn-gold:hover { background: var(--gold-bright); color: #fff; }

        /* --- Product Grid & Badges --- */
        .section { padding: 100px 8%; }
        .section-header { margin-bottom: 70px; text-align: center; }
        .section-header h2 { font-size: 2.5rem; margin-bottom: 15px; letter-spacing: 5px; }
        .section-header .line { width: 50px; height: 2px; background: var(--gold-bright); margin: 0 auto; }

        .watch-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px; }

        .watch-item {
            position: relative; background: #fff; border: 1px solid #eee;
            transition: 0.5s cubic-bezier(0.165, 0.84, 0.44, 1); overflow: hidden;
        }
        .watch-item:hover { transform: translateY(-8px); box-shadow: 0 20px 40px rgba(0,0,0,0.05); border-color: var(--gold-subtle); }

        .watch-img-box {
            width: 100%; height: 350px; position: relative; overflow: hidden;
            background: #f9f9f9; display: flex; align-items: center; justify-content: center;
        }
        .watch-item img { width: 100%; height: 100%; object-fit: cover; transition: 0.8s ease; }
        .watch-item:hover img { transform: scale(1.1); }

        /* Nhãn trạng thái góc phải trên */
        .status-badge {
            position: absolute; top: 15px; right: 15px;
            padding: 5px 15px; font-size: 0.65rem; font-weight: 700;
            text-transform: uppercase; letter-spacing: 1.5px; z-index: 10;
            color: #fff;
        }
        .badge-new { background: var(--red-accent); }
        .badge-sale { background: var(--red-accent); }
        .badge-hot { background: var(--red-accent); }

        .watch-info { padding: 25px; text-align: center; }
        .watch-info h3 { font-size: 1.1rem; margin-bottom: 12px; font-weight: 400; min-height: 2.2em; display: flex; align-items: center; justify-content: center; }
        
        /* Giá sản phẩm */
        .price-container { display: flex; flex-direction: column; gap: 5px; }
        .price-old { color: var(--text-gray); font-size: 0.8rem; text-decoration: line-through; opacity: 0.6; }
        .price-current { color: var(--text-dark); font-size: 1rem; font-weight: 600; }
        .view-all-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-outline {
            padding: 12px 30px;
            font-size: 0.7rem;
            letter-spacing: 2px;
            border: 1px solid #ddd;
            color: var(--text-dark);
            text-decoration: none;
            text-transform: uppercase;
            transition: 0.3s;
        }
        .btn-outline:hover {
            border-color: var(--text-dark);
            background: var(--text-dark);
            color: #fff; transform: scale(1.1);
        }

        @media (max-width: 768px) {
            .hero-content h1 { font-size: 3rem; }
            nav { padding: 20px 5%; }
            .nav-links { display: none; }
        }
        .user-menu {
            position: relative;
        }

        .user-icon {
            font-size: 22px;
            cursor: pointer;
        }

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

        .dropdown-user a:hover {
            background: #f5f5f5;
        }
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

        .register-text {
            margin-top: 15px;
            font-size: 13px;
            color: #777;
            letter-spacing: 0.5px;
        }

        .register-link {
            margin-left: 5px;
            font-weight: 600;
            text-decoration: none;
            color: var(--gold-bright);
            position: relative;
            transition: 0.3s;
        }

        /* 🔥 hiệu ứng underline chạy */
        .register-link::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -3px;

            width: 0%;
            height: 2px;

            background: linear-gradient(90deg, var(--gold-bright), #d4af37);
            transition: 0.3s;
        }

        .register-link:hover::after {
            width: 100%;
        }

        /* 🔥 hover glow */
        .register-link:hover {
            color: #d4af37;
            text-shadow: 0 0 8px rgba(212,175,55,0.5);
        }

        .user-profile { position: relative; display: flex; align-items: center; }
                .user-icon { font-size: 1.1rem; cursor: pointer; transition: 0.3s; }
                .user-icon:hover { color: var(--gold-bright); }
                .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-btn {
            color: var(--text-dark); text-decoration: none; font-size: 0.75rem; 
                    text-transform: uppercase; letter-spacing: 2px; opacity: 0.7;
                    transition: 0.3s; display: inline-block;
        }
        .dropdown-btn:hover {
            color: var(--text-dark);transform: scale(1.2); opacity: 1;
        }
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

        .dropdown-content a:hover {
            color:  var(--text-dark); transform: scale(1.1);opacity: 1;
        }
    </style>
</head>
<body>

    <nav id="navbar">
        <div class="nav-left">
            <a href="TrangChu" class="brand">
                <img src="images/kda.png" alt="Logo" class="w-10 h-10 object-cover">
                <span>KDA LUXURY</span>
            </a>
        </div>
        <div class="nav-search">
            <form action="Search" method="get" class="search-container">
                <input type="text" name="txt" class="search-input" placeholder="Tìm sản phẩm..." value="${txtS}">
                 <input type="hidden" name="type" value="${sortType}">
                <button type="submit" class="search-btn">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
        <ul class="nav-links">
            <li><a href="TrangChu">Trang Chủ</a></li>
            <li><a href="SanPham">Bộ Sưu Tập</a></li>
            <c:choose>
                <c:when test="${sessionScope.acc != null && sessionScope.acc.role == 1}"> 
                    <div class="dropdown">
                        <button class="dropdown-btn" onclick="toggleSupportMenu()"> Quản Lý </button>
                        <div id="supportMenu" class="dropdown-content">
                            <li><a href="ManagerProduct">Quản lý sản phẩm</a></li>
                            <li><a href="revenue">Doanh Thu</a></li> 
                            <li><a href="feedback">Phản Hồi Khách Hàng</a></li> 
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="dropdown">
                        <button class="dropdown-btn" onclick="toggleSupportMenu()"> Hỗ Trợ </button>
                        <div id="supportMenu" class="dropdown-content">
                            <li><a href="Warranty">Chính sách bảo hành</a></li>
                            <li><a href="Contacts">Liên hệ</a></li>
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
        <div class="auth-controls">
            <div class="relative">
                <div onclick="toggleCartDropdown()"class="relative cursor-pointer hover:scale-110 transition-transform duration-300">
                    <i data-lucide="shopping-bag" class="w-5 h-5 text-zinc-800"></i>
                        <span id="cart-count-badge" class="absolute -top-2 -right-3 bg-red-500 text-white text-[10px] font-bold w-4 h-4 rounded-full flex items-center justify-center  ${sessionScope.acc == null || empty cart ? 'hidden' : ''}">
                            ${sessionScope.acc != null && not empty cart ? cart.totalQuantity : ''}
                        </span>
                </div>
                <div id="cartDropdown"class="hidden absolute right-0 mt-4 w-[340px] bg-white shadow-2xl rounded-xl border border-gray-100 z-50 overflow-hidden">
                    <div class="absolute -top-2 right-5 w-4 h-4 bg-white rotate-45 border-l border-t border-gray-100"></div>
                    <c:choose>
                        <c:when test="${not empty cart.items}">
                            <div class="max-h-[350px] overflow-y-auto">
                                <c:forEach items="${cart.items}" var="i">
                                    <div class="flex items-center gap-3 p-4 hover:bg-gray-50 border-b">  
                                        <img src="${i.product.image}"class="w-16 h-16 object-cover rounded-lg border">
                                        <div class="flex-1">
                                            <h4 class="text-sm font-semibold line-clamp-1">${i.product.name}</h4>
                                            <p class="text-xs text-gray-500 mt-1">SL: ${i.quantity} </p>
                                            <c:choose>
                                                <c:when test="${i.product.sale_price != null && i.product.sale_price > 0}">
                                                    <p class="text-xs text-gray-400 line-through"><fmt:formatNumber value="${i.product.price}"type="number"/> VNĐ </p>                                     
                                                    <p class="text-sm font-bold text-red-500 mt-1"><fmt:formatNumber value="${i.product.sale_price}"type="number"/> VNĐ </p>          
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
                                <a href="Cart"  class="bg-black text-white px-4 py-2 text-xs uppercase tracking-wider rounded-lg hover:bg-[#b08d57] transition">Xem chi tiết</a>                               
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
                                <a href="Profile"><i class="far fa-id-card"></i>Hồ sơ</a>
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

    <section class="hero">
        <div class="hero-bg"></div>
        <div class="hero-content">
            <span>The Masterpiece</span>
            <h1>Timeless <br> Precision</h1>
            <p style="color: #ffffff; margin-top: -20px; margin-bottom: 40px; letter-spacing: 2px; font-size: 0.8rem; text-transform: uppercase; opacity: 0.8;">Sự tinh xảo vượt thời gian trong từng nhịp đập</p>
            <a href="SanPham" class="btn-gold">Trải nghiệm ngay</a>
        </div>
    </section>

    <!-- SECTION: HÀNG MỚI (NEW) -->
    <section class="section">
        <div class="section-header">
            <h2>HÀNG MỚI</h2>
            <div class="line"></div>
        </div>
        <div class="watch-grid">
            <c:forEach items="${listN}" var="p" end="5">
                <div class="watch-item">
                    <div class="status-badge badge-new">New</div>
                    <div class="watch-img-box">
                        <img src="${p.image}" alt="${p.name}">
                    </div>
                    <div class="watch-info">
                        <h3>${p.name}</h3>
                        <div class="price-container">
                            <fmt:setLocale value="vi_VN"/>
                            <c:choose>
                                <c:when test="${p.sale_price > 0}">
                                    <span class="price-old">
                                        <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                                    </span>
                                    <span class="price-current" style="color: var(--red-accent);">
                                        Giá Khuyến Mãi: <fmt:formatNumber value="${p.sale_price}" type="number"/> VNĐ
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="price-current">
                                        <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div style="margin-top: 20px;">
                            <a href="infor?id=${p.id}" class="btn-gold" style="padding: 10px 20px; font-size: 0.6rem;">Chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="view-all-container">
            <a href="categories?id=3" class="btn-outline">Xem tất cả</a>
        </div>
    </section>

    <!-- SECTION: GIẢM GIÁ (SALE) -->
    <section class="section" style="background: var(--bg-secondary);">
        <div class="section-header">
            <h2>GIẢM GIÁ SỐC</h2>
            <div class="line"></div>
        </div>
        <div class="watch-grid">
            <c:forEach items="${listSale}" var="p" end="5">
                <div class="watch-item">
                    <!-- Nhãn SALE -->
                    <div class="status-badge badge-sale">Sale</div>
                    <div class="watch-img-box">
                        <img src="${p.image}" alt="${p.name}">
                    </div>
                    <div class="watch-info">
                        <h3>${p.name}</h3>
                        <div class="price-container">
                            <c:choose>
                                <c:when test="${p.sale_price != null && p.sale_price > 0}">
                                    <span class="price-old">
                                        <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                                    </span>
                                    <span class="price-current" style="color: var(--red-accent);">
                                        <fmt:formatNumber value="${p.sale_price}" type="number"/> VNĐ
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="price-current">
                                        <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div style="margin-top: 20px;">
                            <a href="infor?id=${p.id}" class="btn-gold" style="padding: 10px 20px; font-size: 0.6rem;">Chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="view-all-container">
            <a href="categories?id=5&type=" class="btn-outline">Xem tất cả</a>
        </div>
    </section>

    <!-- SECTION: BÁN CHẠY (HOT) -->
    <section class="section">
        <div class="section-header">
            <h2>BÁN CHẠY NHẤT</h2>
            <div class="line"></div>
        </div>
        <div class="watch-grid">
            <c:forEach items="${listHot}" var="p" end="5">
                <div class="watch-item">
                    <!-- Nhãn HOT -->
                    <div class="status-badge badge-hot">Hot</div>
                    <div class="watch-img-box">
                        <img src="${p.image}" alt="${p.name}">
                    </div>
                    <div class="watch-info">
                        <h3>${p.name}</h3>
                        <div class="price-container">
                            <span class="price-current"><fmt:formatNumber value="${p.price}" type="number"/> VNĐ</span>
                        </div>
                        <div style="margin-top: 20px;">
                            <a href="infor?id=${p.id}" class="btn-gold" style="padding: 10px 20px; font-size: 0.6rem;">Chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="view-all-container">
            <a href="categories?id=4&type=" class="btn-outline">Xem tất cả</a>
        </div>
    </section>
    
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

                <p style="color: #ff4d4d; text-align: center; font-weight: bold;">${error}</p>
                <button type="submit">Đăng nhập</button>
            </form>

            <p class="register-text">Chưa có tài khoản? <a href="Register" class="register-link">Đăng ký</a></p>
        </div>
    </div>
    <div id="successmodal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="close()">&times;</span>
                <p style="color: #ff4d4d; text-align: center; font-weight: bold;">${success}</p>
        </div>
    </div>
    
     <c:if test="${not empty error}">
        <script>
            window.onload = function() {
                openLogin();
            }
        </script>
    </c:if>
    <c:if test="${not empty success}">
        <script>
        window.onload = function(){
            openLogin();
        }
        </script>
    </c:if>    
    <script>
        lucide.createIcons();
        function openLogin() {
            const openLogin = "${param.openLogin}";
           
            document.getElementById("loginModal").style.display = "block";
            history.replaceState(null, null, "javascript:void(0)");
            if(openLogin==="true"){
                openLogin();
            }
        }
        function ThanhCong() {
           
            document.getElementById("successmodal").style.display = "block";
            history.replaceState(null, null, "javascript:void(0)");
        }

        function close() {
            document.getElementById("successmodal").style.display = "none";
             history.replaceState(null, null, window.location.pathname + window.location.search);
        }
        function closeLogin() {
            document.getElementById("loginModal").style.display = "none";
             history.replaceState(null, null, window.location.pathname + window.location.search);
        }

        // click ngoài modal để tắt
        window.onclick = function(e) {
            let modal = document.getElementById("loginModal");
            if (e.target === modal) {
                closeLogin();
            }
        }

        // dropdown user
        function toggleUserMenu() {
            let menu = document.getElementById("dropdownUser");
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
        }
        function togglePassword() {
            const pass = document.getElementById("password");
            const icon = document.querySelector(".toggle-password");

            if (pass.type === "password") {
                pass.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                pass.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
        function toggleCartDropdown() {
            const dropdown = document.getElementById("cartDropdown");

            dropdown.classList.toggle("hidden");
        }

        // click ngoài thì tắt
        document.addEventListener("click", function(e) {

            const cart = document.getElementById("cartDropdown");

            if (!e.target.closest(".relative")) {
                cart.classList.add("hidden");
            }
        });
        function toggleSupportMenu() {
            const menu = document.getElementById("supportMenu");

            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        }

        // click ra ngoài thì tự đóng
        window.onclick = function(e) {

            if (!e.target.matches('.dropdown-btn')) {

                const menu =
                        document.getElementById("supportMenu");

                if (menu.style.display === "block") {
                    menu.style.display = "none";
                }
            }
        }
        window.addEventListener('scroll', () => {
            const nav = document.getElementById('navbar');
            if (window.scrollY > 50) nav.classList.add('scrolled');
            else nav.classList.remove('scrolled');
        });
        lucide.createIcons();
    </script>   
     <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>