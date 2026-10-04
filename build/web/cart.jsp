<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng - LUXURY WATCH</title>
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
        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            font-family: 'Tenor Sans', sans-serif;
            line-height: 1.6;
        }
        h1, h2, h3, .brand { font-family: 'Cinzel', serif; letter-spacing: 2px; }
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
        .font-luxury {
            font-family: 'Bodoni Moda', serif;
        }
        .gold-gradient {
            background: linear-gradient(135deg, #b8860b 0%, #d4af37 50%, #8a6d3b 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .gold-border-btn {
            border: 1px solid #d4af37;
            background: #000;
            color: #d4af37;
            position: relative;
            overflow: hidden;
            transition: all 0.4s ease;
        }
        .gold-border-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }
        .gold-border-btn:hover::before {
            left: 100%;
        }
        .gold-border-btn:hover {
            box-shadow: 0 10px 20px rgba(184, 134, 11, 0.2);
            transform: translateY(-2px);
        }
        .cart-item-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }
        .cart-item-card:hover {
            border-color: #d4af37;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        }
        .badge-gold {
            background: #000;
            color: #d4af37;
            font-weight: 700;
            font-size: 9px;
        }
        .summary-card {
            background: #f9f9f9;
            border: 1px solid #eee;
        }
        /* Tùy chỉnh input số lượng */
        .qty-input::-webkit-inner-spin-button,
        .qty-input::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
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

        /* Auth Buttons Section */
        .auth-buttons { display: flex; align-items: center; gap: 15px; }
        .auth-link {
            text-decoration: none; color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase; letter-spacing: 1px; transition: 0.3s; opacity: 0.8;
        }
        .auth-link:hover { color: var(--text-dark); opacity: 1; transform: scale(1.2); }
        .auth-divider { width: 2px; height: 14px; background: var(--text-gray); opacity: 1; }
        .user-profile { position: relative; display: flex; align-items: center; }
        .user-icon { font-size: 1.1rem; cursor: pointer; transition: 0.3s; }
        .user-icon:hover { color: var(--gold-bright); }

        /* --- Page Header with Animation --- */
        .page-header {
            position: relative;
            height: 350px;
            display: flex; 
            flex-direction: column; 
            justify-content: center; 
            align-items: center;
            text-align: center; 
            color: white;
            overflow: hidden;
        }

        .header-overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)), 
                        url('https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=2000') center/cover;
            z-index: -1;
            transform: scale(1);
            animation: headerBgZoom 15s infinite alternate ease-in-out;
        }

        .header-content {
            animation: headerFadeUp 1s ease-out forwards;
            opacity: 0;
            transform: translateY(30px);
        }

        @keyframes headerBgZoom {
            from { transform: scale(1); }
            to { transform: scale(1.15); }
        }

        @keyframes headerFadeUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .page-header h1 { font-size: 2.5rem; margin-bottom: 10px; text-transform: uppercase; }
        .page-header p { font-size: 0.9rem; text-transform: uppercase; letter-spacing: 4px; opacity: 0.9; }
        .main-container {
            max-width: 1440px; margin: 60px auto;
            display: grid; grid-template-columns: 280px 1fr;
            gap: 50px; padding: 0 5%;
        }

        /* --- Sidebar --- */
        .sidebar { position: sticky; top: 100px; height: fit-content; }
        .filter-group { margin-bottom: 45px; }
        .filter-title {
            font-size: 0.85rem; font-weight: 700; color: var(--text-dark);
            margin-bottom: 20px; border-bottom: 2px solid var(--gold-bright);
            padding-bottom: 8px; display: inline-block; letter-spacing: 1px;
        }
        .filter-list { list-style: none; }
        .filter-list a {
            text-decoration: none; color: var(--text-gray); font-size: 0.85rem;
            transition: 0.3s; display: flex; justify-content: space-between; align-items: center;
            padding: 10px 15px;
        }
        .filter-list a:hover { color: var(--gold-bright); background: var(--bg-secondary); padding-left: 20px; }
        
        .filter-list a.active { 
            background: var(--gold-bright); color: var(--text-dark);
            font-weight: bold; border-left: 4px solid var(--gold-bright);
        }

        .sort-select {
            padding: 8px 15px; border: 1px solid var(--border);
            font-family: 'Tenor Sans', sans-serif; font-size: 0.8rem;
            color: var(--text-dark); background: white; outline: none;
            cursor: pointer; transition: 0.3s;
        }
        .sort-select:hover { border-color: var(--gold-bright); }

        /* --- Content Area --- */
        .section-header {
            display: flex; justify-content: space-between; align-items: baseline;
            margin-bottom: 35px; border-bottom: 1px solid var(--border); padding-bottom: 20px;
        }
        .current-category-name { font-family: 'Be Vietnam Pro'; font-size: 1.6rem; color: var(--text-dark); }

        .product-grid {
            display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 35px;
        }
        .product-card {
            background: var(--bg-card); border: 1px solid var(--border);
            padding: 25px; transition: 0.4s ease; text-align: center; position: relative;
        }
        .product-card:hover { border-color: var(--gold-bright); transform: translateY(-5px); box-shadow: 0 15px 40px rgba(0,0,0,0.05); }

        .img-wrapper {
            width: 100%; 
            height: 300px;
            aspect-ratio: 1 / 1;
            background: #fcfcfc; overflow: hidden;
            display: flex; align-items: center; justify-content: center;
            margin-bottom: 25px; position: relative;
        }
        .img-wrapper img { 
            width: 100%; 
            height: 100%; 
            object-fit: cover; 
            transition: 0.6s cubic-bezier(0.4, 0, 0.2, 1); 
        }
        .product-card:hover .img-wrapper img { transform: scale(1.1); }

        .product-name { font-size: 0.9rem; color: var(--text-dark); margin-bottom: 15px; height: 2.6em; overflow: hidden; font-weight: 500; }
        .price-container {
            display: flex;
            flex-direction: column; 
            align-items: center;    
            gap: 4px;
            margin-bottom: 20px;
        }

        .status-badge {
            position: absolute; z-index: 10;
            top: 10px;
            right: 10px;
            padding: 4px 8px;
            font-size: 0.6rem;
            color: white;
        }

        .badge-new { background: red; }
        .badge-hot { background: red; }
        .badge-sale { background: red; }

        .price-old {
            text-decoration: line-through;
            color: gray;
            font-size: 0.8rem;
        }

        .price-sale {
            color: red;
            font-weight: bold; font-size: 1.1rem;
        }

        .price-current {
            font-weight: bold; font-size: 1.1rem;
        }

        .btn-view {
            display: block; width: 100%; padding: 14px;
            border: 1px solid var(--text-dark); text-decoration: none;
            color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase;
            letter-spacing: 2px; transition: 0.3s;
        }
        .btn-view:hover { background: var(--gold-bright); color: #fff; }

        /* Dropdown User */
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

        /* Modal Auth */
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
        .breadcrumb {
            padding: 30px 8% 0;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-gray);
        }
        .breadcrumb a { color: var(--gold-bright); text-decoration: none; margin-right: 5px; }
        .breadcrumb span { margin: 0 10px; opacity: 0.5; }
        @media (max-width: 1024px) {
            nav { flex-wrap: wrap; gap: 15px; }
            .nav-left, .nav-search, .nav-center, .nav-right { flex: unset; width: auto; }
            .nav-links { display: none; }
            .main-container { grid-template-columns: 1fr; }
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
<body class="min-h-screen">

    <!-- Navigation -->
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
                <li><a href="SanPham" class="hover:text-[#B9935E]">Bộ Sưu Tập</a></li>
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
        </div>
    </nav>
    <div class="breadcrumb">
        <a href="TrangChu">Trang Chủ</a> <span>/</span> <a href="Contacts">Giỏ Hàng</a>
    </div>
    <main class="max-w-7xl mx-auto px-6 py-16">
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-4 border-b border-zinc-100 pb-12">
            <div>
                <h1 class="text-5xl font-luxury mb-4 italic text-zinc-900">Giỏ hàng của bạn</h1>
                <p class="text-zinc-400 text-xs uppercase tracking-[0.2em]">Luxury selection · Limited Editions</p>
            </div>
            <div class="text-right">
                <p class="text-[10px] uppercase text-zinc-400 font-bold">Số lượng sản phẩm</p>
                <p class="text-xl font-luxury text-zinc-800" id="total-items-display">
                    <c:choose>
                        <c:when test="${not empty cart.items}">
                            ${cart.totalQuantity} Items
                        </c:when>
                        <c:otherwise>0 Items</c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>

        <div class="grid grid-cols-12 gap-12">
            <!-- Left Side: Items List -->
            <div class="col-span-12 lg:col-span-8 space-y-6">
                <c:choose>
                    <c:when test="${not empty cart.items}">
                        <c:forEach items="${cart.items}" var="item">
                            <div class="cart-item-card rounded-2xl overflow-hidden flex flex-col sm:flex-row" data-product-id="${item.product.id}">
                                <div class="w-full sm:w-56 h-64 bg-zinc-100">
                                    <img src="${item.product.image}" class="w-full h-full object-cover">
                                </div>
                                <div class="flex-1 p-8 flex flex-col justify-between">
                                    <div class="flex justify-between items-start">
                                        <div>
                                            <h3 class="text-lg font-luxury gold-gradient">${item.product.name}</h3>
                                            <p class="text-[10px] text-zinc-500 uppercase mt-2">${item.product.description}</p>
                                        </div>
                                        <a href="DelCart?id=${item.product.id}" class="text-zinc-400 hover:text-red-500 transition-colors">
                                            <i data-lucide="trash-2" class="w-5 h-5"></i>
                                        </a>
                                    </div>
                                    <div class="flex items-end justify-between mt-8">
                                        <div>
                                            <span class="text-[9px] text-zinc-400 uppercase font-bold tracking-widest block mb-2">Số lượng</span>
                                            <div class="flex items-center border border-zinc-200 rounded-lg w-fit bg-white">
                                                <button onclick="updateQty('${item.product.id}', -1)" class="p-2 hover:text-[#b8860b] transition-colors">
                                                    <i data-lucide="minus" class="w-3 h-3"></i>
                                                </button>
                                                <input type="number" id="qty-${item.product.id}" value="${item.quantity}" class="qty-input w-10 text-center text-sm font-bold focus:outline-none" readonly />   
                                                <button onclick="updateQty('${item.product.id}', 1)" class="p-2 hover:text-[#b8860b] transition-colors">
                                                    <i data-lucide="plus" class="w-3 h-3"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <span class="text-[9px] text-zinc-400 uppercase font-bold tracking-widest">Giá</span>
                                            <div class="text-2xl font-luxury text-zinc-800">
                                                <span class="unit-price hidden"
                                                    data-price="${item.product.sale_price > 0 ? item.product.sale_price : item.product.price}">
                                                </span>
                                                <fmt:setLocale value="vi_VN"/>
                                                <c:choose>
                                                    <c:when test="${item.product.sale_price > 0}">
                                                        <p class="text-sm text-gray-400 line-through">
                                                            <fmt:formatNumber value="${item.product.price}" type="number"/> VNĐ
                                                        </p>
                                                        <p class="text-2xl font-luxury text-red-600">
                                                            <fmt:formatNumber value="${item.product.sale_price}" type="number"/> VNĐ
                                                        </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-2xl font-luxury text-zinc-800">
                                                            <fmt:formatNumber value="${item.product.price}" type="number"/> VNĐ
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="pt-8">
                                <a href="SanPham" class="group flex items-center gap-3 text-[10px] uppercase font-bold tracking-[0.2em] text-zinc-400 hover:text-black transition-colors w-fit">
                                    <div class="w-10 h-10 rounded-full border border-zinc-200 flex items-center justify-center group-hover:border-black transition-all">
                                        <i data-lucide="plus" class="w-4 h-4"></i>
                                    </div>
                                    Thêm sản phẩm khác vào giỏ
                                </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="flex flex-col items-center justify-center py-20 text-center">
                            <i data-lucide="shopping-cart" class="w-16 h-16 text-zinc-200 mb-6"></i>
                            <h2 class="text-2xl font-luxury mb-3">Giỏ hàng của bạn đang trống</h2>
                            <p class="text-zinc-400 text-sm mb-8">Hãy khám phá bộ sưu tập và thêm sản phẩm bạn yêu thích</p>
                            <a href="SanPham" class="px-8 py-3 border border-black text-[10px] uppercase tracking-[0.3em] font-bold hover:bg-black hover:text-white transition-all">
                                Mua sắm ngay
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- Right Side: Summary -->
            <c:if test="${not empty cart.items}">
                <div class="col-span-12 lg:col-span-4">
                    <div class="summary-card rounded-3xl p-10 sticky top-32">
                        <h2 class="text-xl font-luxury mb-10 italic text-zinc-900">Thanh toán</h2>
                        <div class="space-y-6 mb-12 border-b border-zinc-200 pb-10">
                            <div class="flex justify-between text-[11px] uppercase tracking-widest">
                                <span class="text-zinc-400 font-semibold">Tổng tiền hàng</span>
                                <span class="text-zinc-800 font-bold">
                                    <span id="subtotal-display"><fmt:formatNumber value="${cart.totalPrice}" type="number"/></span> VNĐ
                                </span>
                            </div>
                            <div class="flex justify-between text-[11px] uppercase tracking-widest">
                                <span class="text-zinc-400 font-semibold">Phí vận chuyển</span>
                                <span class="text-zinc-500 italic">Miễn phí toàn quốc</span>
                            </div>
                        </div>
                        <div class="flex justify-between items-end mb-10">
                            <span class="text-[10px] uppercase font-bold tracking-widest text-zinc-400">Tổng thanh toán</span>
                            <div class="text-right">
                                <p class="text-4xl font-luxury text-red-500 font-bold leading-none tracking-tight">
                                    <span id="total-display"><fmt:formatNumber value="${cart.totalPrice}" type="number"/></span>
                                </p>
                                <p class="text-[10px] text-zinc-400 mt-1 uppercase tracking-tighter">VNĐ</p>
                            </div>
                        </div>
                        <a href="ThanhToan"class="w-full gold-border-btn py-5 rounded-full text-[10px] uppercase font-bold tracking-[0.4em] mb-6 flex items-center justify-center">
                             Tiến hành đặt hàng
                        </a>
                    </div>
                </div>
            </c:if>                  
        </div>
    </main>

    <!-- Decorative background elements -->
    <div class="fixed top-0 right-0 w-1/3 h-1/3 bg-zinc-50 blur-[120px] rounded-full pointer-events-none -z-10"></div>
    <div class="fixed bottom-0 left-0 w-1/4 h-1/4 bg-[#d4af37]/5 blur-[100px] rounded-full pointer-events-none -z-10"></div>
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
        lucide.createIcons();

        // Hàm định dạng số tiền (VD: 1.000.000)
        function formatMoney(amount) {
            return new Intl.NumberFormat('vi-VN').format(amount);
        }
        function recalculateTotal() {
            let total = 0;
            let totalItems = 0;

            document.querySelectorAll('.cart-item-card').forEach(card => {

                const price = Number(
                    card.querySelector('.unit-price').dataset.price
                );

                const qty = Number(
                    card.querySelector('.qty-input').value
                );

                total += price * qty;
                totalItems += qty;
            });

            document.getElementById('subtotal-display').innerText =
                formatMoney(total);

            document.getElementById('total-display').innerText =
                formatMoney(total);

            document.getElementById('total-items-display').innerText =
                totalItems + " Items";

            document.getElementById('cart-count-badge').innerText =
                totalItems;
        }
        // Hàm cập nhật số lượng
        function updateQty(productId, change) {
            const input = document.getElementById('qty-' + productId);
            let currentQty = parseInt(input.value);
            let newQty = currentQty + change;

            // Không cho giảm xuống dưới 1
            if (newQty < 1) return;
            fetch('updateCart?id=' + productId + '&qty=' + newQty)
                .then(response => response.text())
                .then(data => {
                    if (data.trim() === "success") {
                        // cập nhật giao diện ngay
                        input.value = newQty;
                        recalculateTotal();
                    }
                });
        }

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