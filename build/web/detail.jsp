<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${detail.name} - Luxury Watch</title>
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

        * { margin: 0; padding: 0; box-sizing: border-box; }
        #formTitle {
            font-family: 'Montserrat', sans-serif;
            font-size: 2rem;
            font-weight: 700;
            color: #2b2b2b;
            margin-bottom: 25px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            font-family: 'Tenor Sans', sans-serif;
            line-height: 1.6;
        }

        h1, h2, h3, .brand { font-family: 'Cinzel', serif; letter-spacing: 2px; }
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
            position: sticky; top: 0; width: 100%;
            display: flex; justify-content: space-between; align-items: center;
            padding: 20px 8%; z-index: 1000;
            background: rgba(255, 255, 255, 0.98);
            border-bottom: 1px solid var(--border);
            box-shadow: 0 2px 15px rgba(0,0,0,0.02);
        }

        .brand { font-size: 1.3rem; font-weight: 700; color: var(--text-dark); text-decoration: none; }
        nav {
            position: sticky; top: 0; width: 100%;
            display: flex; justify-content: space-between; align-items: center;
            padding: 15px 5%; z-index: 1000;
            background: rgba(255, 255, 255, 0.98);
            border-bottom: 1px solid var(--border);
            box-shadow: 0 2px 15px rgba(0,0,0,0.02);
        }

        /* Điều chỉnh Flexbox cho Navbar */
        .nav-left { flex: 1; display: flex; align-items: center; }
        .nav-search { flex: 1.5; display: flex; justify-content: center; }
        .nav-center { flex: 2; display: flex; justify-content: center; }
        .nav-right { flex: 1; display: flex; justify-content: flex-end; align-items: center; gap: 20px; }

        .brand { font-size: 1.5rem; font-weight: 700; color: var(--text-dark); text-decoration: none; white-space: nowrap; }
        
        .nav-links { display: flex; gap: 25px; list-style: none; align-items: center; }
        .nav-links a { 
            color: var(--text-dark); text-decoration: none; font-size: 0.75rem; 
            text-transform: uppercase; letter-spacing: 1.5px; opacity: 0.8;
            transition: 0.3s; font-weight: 500; display: inline-block;  position: relative;
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

        /* Hover */
        .nav-links a:hover::after {
            width: 100%;
        }

        /* Active (trang hiện tại) */
        .nav-links a.active::after {
            width: 100%;
        }
        /* --- Breadcrumb --- */
        .breadcrumb {
            padding: 30px 8% 0;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-gray);
        }
        .breadcrumb a { color: var(--gold-bright); text-decoration: none; margin-right: 5px; }
        .breadcrumb span { margin: 0 10px; opacity: 0.5; }

        /* --- Main Content --- */
        .product-container {
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 60px;
            padding: 40px 8% 100px;
            align-items: start;
        }

        .product-image-section {
            position: sticky;
            top: 100px;
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

        /* Auth Buttons Section */
        .auth-buttons { display: flex; align-items: center; gap: 15px; }
        .auth-link {
            text-decoration: none; color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase; letter-spacing: 1px; transition: 0.3s; opacity: 0.8;
        }
        .auth-link:hover { color: var(--text-dark); opacity: 1; transform: scale(1.2); }
        .auth-divider { width: 2px; height: 14px; background: var(--text-gray); opacity: 1; }
        
        /* Badge giỏ hàng */
        .cart-badge {
            position: absolute; 
            top: -8px; 
            right: -10px; 
            background: #000; 
            color: white; 
            font-size: 0.6rem; 
            width: 16px;
            height: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-weight: bold;
        }

        /* User Profile */
        .user-profile { position: relative; display: flex; align-items: center; }
        .user-icon { font-size: 1.1rem; cursor: pointer; transition: 0.3s; }
        .user-icon:hover { color: var(--gold-bright); }
        
        /* Cố định kích thước khung ảnh */
        .image-card {
            background: var(--bg-secondary);
            border: 1px solid var(--border);
            padding: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            overflow: hidden;
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

        .dropdown-user a:hover { background: #f5f5f5; color: var(--gold-bright); }

        .image-card img {
            max-width: 100%;
            max-height: 600px;
            object-fit: contain;
            transition: transform 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
        }
        .cart-badge {
            position: absolute; 
            top: -8px; 
            right: -10px; 
            background: #000; 
            color: white; 
            font-size: 0.6rem; 
            width: 16px;
            height: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-weight: bold;
        }
        .image-card:hover img { transform: scale(1.05); }

        .zoom-hint {
            position: absolute;
            bottom: 15px;
            right: 15px;
            background: rgba(255,255,255,0.8);
            padding: 8px;
            border-radius: 50%;
            font-size: 0.8rem;
            color: var(--text-gray);
            pointer-events: none;
        }

        /* --- Lightbox Overlay --- */
        .lightbox {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(255, 255, 255, 0.98);
            z-index: 2000;
            justify-content: center;
            align-items: center;
            cursor: zoom-out;
        }

        .lightbox img {
            max-width: 90%;
            max-height: 85vh;
            box-shadow: 0 20px 50px rgba(0,0,0,0.1);
        }

        .close-lightbox {
            position: absolute;
            top: 30px;
            right: 40px;
            font-size: 2rem;
            color: var(--text-dark);
            cursor: pointer;
        }

        /* --- Info Section --- */
        .product-info-section {
            padding-top: 20px;
        }

        .product-brand-tag {
            color: var(--gold-bright);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 4px;
            margin-bottom: 15px;
            display: block;
        }

        .product-title {
            font-size: 2.8rem;
            margin-bottom: 25px;
            line-height: 1.2;
            color: var(--text-dark);
        }

        .price-box {
            background: var(--bg-secondary);
            padding: 30px;
            border-radius: 4px;
            margin-bottom: 40px;
            border-left: 4px solid var(--gold-bright);
        }

        .price-label {
            font-size: 0.7rem;
            text-transform: uppercase;
            color: var(--text-gray);
            letter-spacing: 2px;
            display: block;
            margin-bottom: 10px;
        }

        .price-value {
            font-size: 2rem;
            color: var(--gold-bright);
            font-weight: 700;
            font-family: 'Tenor Sans', sans-serif;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 40px;
        }

        .btn {
            padding: 20px;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 3px;
            transition: 0.4s;
            border-radius: 2px;
            cursor: pointer;
        }

        .btn-buy {
            background: var(--gold-bright);
            color: white;
            border: none;
        }
        .btn-buy:hover {transform: scale(1.1); background: #866d3a; box-shadow: 0 10px 20px rgba(156, 130, 74, 0.2); }

        .btn-cart {
            background: transparent;
            color: var(--text-dark);
            border: 1px solid var(--text-dark);
        }
        .btn-cart:hover {transform: scale(1.1); background: var(--text-dark); color: white; }

        /* --- Trust Badges --- */
        .trust-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            border-top: 1px solid var(--border);
            padding-top: 30px;
        }

        .trust-item {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 0.75rem;
            color: var(--text-gray);
            letter-spacing: 0.5px;
        }

        .trust-item i { color: var(--gold-bright); font-size: 1rem; }
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
        .close:hover {
    color: red;
    transform: rotate(90deg);
}
        .password-wrapper { position: relative; width: 100%; }
        .toggle-password {
            position: absolute; right: 12px; top: 50%;
            transform: translateY(-50%); cursor: pointer; color: #888;
        }
        .toggle-password:hover {
        color: #000;
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
.breadcrumb {
            padding: 30px 8% 0;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-gray);
        }
        .breadcrumb a { color: var(--gold-bright); text-decoration: none; margin-right: 5px; }
        .breadcrumb span { margin: 0 10px; opacity: 0.5; }
        @media (max-width: 992px) {
            .product-container { grid-template-columns: 1fr; gap: 40px; }
            .product-image-section { position: relative; top: 0; }
            .product-title { font-size: 2rem; }
        }
        @media (max-width: 1024px) {
            nav { flex-wrap: wrap; gap: 15px; }
            .nav-left, .nav-search, .nav-center, .nav-right { flex: unset; width: auto; }
            .nav-links { display: none; }
            .main-container { grid-template-columns: 1fr; }
        }
        .cart-icon{
    position: relative;
}
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
.dropdown-btn::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -6px;

    width: 0%;
    height: 1.5px;

    background-color: #000;
    transition: width 0.3s ease;
}

.dropdown-btn:hover::after {
    width: 100%;
}
.dropdown-content a::after {
    content: none !important;
}
    </style>
</head>
<body>

    <!-- Lightbox -->
    <div id="lightbox" class="lightbox" onclick="closeLightbox()">
        <span class="close-lightbox">&times;</span>
        <img id="lightbox-img" src="" alt="Zoomed view">
    </div>

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
                                <a href="Warranty">Chính sách bảo hành</a>
                                <a href="Contacts">Liên hệ</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <li>
                    <c:choose>
                        <c:when test="${sessionScope.acc == null}">
                            <a href="#" onclick="openLogin()">Giỏ Hàng</a>
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
                                <span class="text-[9px] uppercase font-bold tracking-widest text-zinc-600">
                                    ${sessionScope.acc.fullname}
                                </span>
                            </div>
                            <div id="dropdownUser" class="dropdown-user">
                                <a href="Profile"><i class="far fa-id-card"></i>Hồ sơ</a>
                                <a href="Logout" style="color: #ff4d4d;"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>    
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="#dangnhap" onclick="openLogin()" class="auth-link">Đăng Nhập</a>
                        <span class="auth-divider"></span>
                        <a href="Register" class="auth-link">Đăng Ký</a>
                    </c:otherwise>
                </c:choose>               
            </div>
        </div>
    </nav>

    <div class="breadcrumb">
        <a href="TrangChu">Trang Chủ</a> <span>/</span> <a href="SanPham">Bộ sưu tập</a> <span>/</span> ${detail.name}
    </div>

    <main class="product-container">
        <!-- Left: Image -->
        <section class="product-image-section">
            <div class="image-card" onclick="openLightbox('${detail.image}')">
                <img src="${detail.image}" alt="${detail.name}">
                <div class="zoom-hint">
                    <i class="fas fa-search-plus"></i>
                </div>
            </div>
        </section>

        <!-- Right: Content -->
        <section class="product-info-section">
            <span class="product-brand-tag">Exclusive Collection</span>
            <h1 class="product-title">${detail.name}</h1>
            <p style="color: var(--text-gray); font-size: 0.9rem; margin-bottom: 30px; letter-spacing: 1px;">${detail.description}</p>
            <div class="price-box bg-white border border-zinc-200 rounded-2xl p-6 space-y-3">
                <span class="price-label text-xs uppercase tracking-widest text-zinc-400">Giá niêm yết chính hãng</span>   
                <fmt:setLocale value="vi_VN"/>
                <c:choose>
                    <c:when test="${detail.sale_price > 0}">
                        <div style="text-decoration: line-through; color:#999;">
                            <fmt:formatNumber value="${detail.price}" type="number"/> VNĐ
                        </div>
                        <div style="color: #c62828; font-size: 30px; font-weight: bold;">
                            <fmt:formatNumber value="${detail.sale_price}" type="number"/> VNĐ
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div style="color: #c62828; font-size: 30px; font-weight: bold;">
                            <fmt:formatNumber value="${detail.price}" type="number"/> VNĐ
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="action-buttons">
                 <!-- MUA NGAY -->
                <c:choose>
                    <c:when test="${sessionScope.acc == null}">
                        <a href="javascript:void(0)" onclick="openLogin(); return false;" class="btn btn-buy">
                            <i class="fas fa-bolt" style="margin-right:10px;"></i>Mua ngay    
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="ThanhToan?id=${detail.id}" class="btn btn-buy">
                            <i class="fas fa-bolt" style="margin-right:10px;"></i>Mua ngay
                        </a>
                    </c:otherwise>
                </c:choose>

                <!-- THÊM GIỎ -->
                <c:choose>
                    <c:when test="${sessionScope.acc == null}">
                        <a href="javascript:void(0)" onclick="openLogin(); return false;" class="btn btn-cart">
                            <i class="fas fa-plus" style="margin-right:10px;"></i>Thêm vào giỏ hàng      
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="addCart?id=${detail.id}" class="btn btn-cart">
                            <i class="fas fa-plus" style="margin-right:10px;"></i>Thêm vào giỏ hàng
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="trust-grid">
                <div class="trust-item">
                    <i class="fas fa-check-circle"></i>
                    <span>Chứng nhận chính hãng 100%</span>
                </div>
                <div class="trust-item">
                    <i class="fas fa-shield-alt"></i>
                    <span>Bảo hành toàn cầu 5 năm</span>
                </div>
                <div class="trust-item">
                    <i class="fas fa-shipping-fast"></i>
                    <span>Giao hàng hỏa tốc miễn phí</span>
                </div>
                <div class="trust-item">
                    <i class="fas fa-headset"></i>
                    <span>Hỗ trợ khách hàng 24/7</span>
                </div>
            </div>
        </section>
    </main>
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

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        lucide.createIcons();
        function toggleUserMenu() {
            let menu = document.getElementById("dropdownUser");
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
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
        function togglePassword() {
            const pass = document.getElementById("password");
            const icon = document.querySelector(".toggle-password");
            if (pass.type === "password") {
                pass.type = "text";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                pass.type = "password";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
        function openLightbox(imgSrc) {
            const lightbox = document.getElementById('lightbox');
            const lightboxImg = document.getElementById('lightbox-img');
            lightboxImg.src = imgSrc;
            lightbox.style.display = 'flex';
            document.body.style.overflow = 'hidden'; // Ngăn cuộn trang
        }

        function closeLightbox() {
            const lightbox = document.getElementById('lightbox');
            lightbox.style.display = 'none';
            document.body.style.overflow = 'auto'; // Cho phép cuộn lại
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
    </script>

</body>
</html>