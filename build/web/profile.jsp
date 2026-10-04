<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài khoản | KDA LUXURY</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap&subset=vietnamese" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
      
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400;500;600&display=swap');
        root {
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

        .brand-font { font-family: 'Bodoni Moda', serif; }
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

        /* Sidebar - REFINED HOVER LOGIC */
        .sidebar-container {
            /* Container chính không còn scale */
        }

        .sidebar-link{
    display:flex;
    align-items:center;
    width:100%;
    height:56px;
    padding:0 24px;

    font-size:12px;
    text-transform:uppercase;
    letter-spacing:1px;
    color:#555;
    cursor:pointer;

    border-radius:4px;
    margin-bottom:8px;

    transition:all .3s cubic-bezier(0.4,0,0.2,1);
    box-sizing:border-box;
}

/* icon cố định chiều rộng */
.sidebar-link svg{
    width:18px;
    height:18px;
    flex-shrink:0;
    margin-right:14px;
}

/* text luôn bắt đầu cùng 1 hàng */
.sidebar-link span{
    flex:1;
    text-align:left;
}

.sidebar-link:hover{
    transform:translateX(6px);
    color:#000;
    background:#f9f9f9;
}

.sidebar-link.active{
    background:#000 !important;
    color:#fff !important;
    box-shadow:0 10px 20px rgba(0,0,0,.08);
}

.sidebar-link.active:hover{
    background:#111 !important;
    color:#fff;
}
    #account-tabs {
    display: flex;
    flex-direction: column;
}
        /* Avatar Upload - REFINED HOVER */
        .avatar-wrapper {
            position: relative;
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            cursor: pointer;
            transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .avatar-display {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #fff;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            background-color: #f8f9fa;
        }

        .avatar-placeholder {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            color: #333;
            font-size: 32px;
            font-weight: 700;
            border: 2px dashed #ddd;
            transition: all 0.3s;
        }

        /* Content Transitions */
        .tab-content { 
            display: none; 
            animation: slideUp 0.5s ease forwards;
        }
        .tab-content.active { display: block; }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        input.form-control {
            width: 100%;
            border: none;
            border-bottom: 1px solid #eee;
            padding: 12px 0;
            font-size: 14px;
            margin-bottom: 25px;
            outline: none;
            transition: border-color 0.3s, padding-left 0.3s;
        }
        input.form-control:focus { 
            border-bottom-color: #000; 
            padding-left: 5px;
        }

        .label-small {
            font-size: 10px;
            text-transform: uppercase;
            color: #999;
            font-weight: 700;
            letter-spacing: 1.5px;
            margin-bottom: 4px;
        }
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
<body>

    <!-- HEADER -->
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

    <!-- MAIN CONTENT -->
    <div class="max-w-[1200px] mx-auto flex px-8 py-16 gap-20">
        
        <!-- LEFT SIDEBAR -->
        <aside class="w-64 flex-shrink-0 sidebar-container">
            <div class="mb-12 text-center">
                <div class="avatar-wrapper">
                    <img id="avatar-preview" src="" alt="Avatar" class="avatar-display hidden">
                    <div id="avatar-initial" class="avatar-placeholder">
                        <i data-lucide="user-round" class="w-10 h-10 text-gray-500"></i>
                    </div>
                </div>

                <h2 id="sidebar-name" class="brand-font text-2xl font-bold tracking-widest uppercase">${sessionScope.acc.username}</h2>
            </div>

            <nav id="account-tabs" class="space-y-2">
                <div class="sidebar-link active" data-tab="profile">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                    Thông tin cá nhân
                </div>
                <div class="sidebar-link" data-tab="orders">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M9 3v18"/><path d="m14 8 3 3-3 3"/></svg>
                    Đơn hàng 
                </div>
                <div class="sidebar-link" data-tab="password">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                    Đổi mật khẩu 
                </div>
                <a href="Logout" class="sidebar-link text-red-500 pt-8" onclick="window.location.reload()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" x2="9" y1="12" y2="12"/></svg>
                    Đăng xuất
                </a>
            </nav>
        </aside>

        <!-- RIGHT CONTENT -->
        <main class="flex-1">
            
            <div id="profile" class="tab-content active">
                <h1 class="brand-font text-3xl mb-10 tracking-tight">Thông Tin Cá Nhân</h1>
                <form action="UpdateProfile" method="post">
                    <div class="grid grid-cols-2 gap-x-12">
                        <div>
                            <p class="label-small">Họ Tên</p>
                            <input type="text" name="fullname" id="input-fullname" class="form-control" value="${sessionScope.acc.fullname}">
                            <p class="label-small">Số điện thoại</p>
                            <input type="text" name="phone" class="form-control" value="${sessionScope.acc.phone}">    
                        </div>
                        <div>
                            <p class="label-small">Địa chỉ email</p>
                            <input type="email" name="email" class="form-control" value="${sessionScope.acc.email}">
                            <p class="label-small">Địa chỉ giao hàng</p>
                            <input type="text" name="address" class="form-control" value="${sessionScope.acc.address}">  
                        </div>
                    </div>
                        <c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>
                    <button type="submit" class="bg-black text-white text-[10px] font-bold uppercase tracking-[4px] px-10 py-5 hover:bg-[#b08d57] transition-all duration-300 mt-6 block">Cập Nhật</button>
                </form>
            </div>
            <div id="orders" class="tab-content">
                <div class="max-w-4xl mx-auto">
                    <div class="mb-8">
                        <h1 class="brand-font text-3xl mb-2">Đơn hàng của bạn</h1>
                        <p class="text-gray-500">Xem thông tin chi tiết các giao dịch gần đây.</p>
                    </div>
                    <c:choose>
                        <c:when test="${not empty orderHistory}">
                            <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                                <div class="divide-y divide-gray-100">
                                    <c:forEach items="${orderHistory}" var="o">
                                        <div class="p-5 flex items-center justify-between hover:bg-gray-50 transition-colors">
                                            <div class="flex items-center gap-4">
                                                <div class="w-12 h-12 bg-blue-50 text-blue-600 rounded-full flex items-center justify-center">
                                                    <i class="fas fa-shopping-cart"></i>
                                                </div>
                                                <div>
                                                    <h3 class="font-semibold text-gray-900">
                                                        Đơn hàng ${o.items[0].product.name}
                                                        <c:if test="${fn:length(o.items) > 1}"> và ${fn:length(o.items)-1} sản phẩm khác </c:if>
                                                    </h3>
                                                    <p class="text-sm text-gray-500">
                                                        <fmt:setLocale value="vi_VN"/>
                                                        <fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm"/> Tổng tiền hàng : 
                                                        <fmt:formatNumber value="${o.totalPrice}" type="number"/> VNĐ
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="flex items-center gap-4 shrink-0">
                                                <span class="px-3 py-1 bg-green-100 text-green-700 text-xs font-bold rounded-full whitespace-nowrap">${o.status}</span>
                                                <button onclick="document.getElementById('detail-${o.id}').classList.toggle('hidden')" class="text-blue-600 hover:text-blue-800 text-sm font-semibold whitespace-nowrap">Xem chi tiết</button>
                                            </div>
                                        </div>
                                        <div id="detail-${o.id}" class="hidden bg-gray-50 p-6 border-t">
                                            <div class="grid grid-cols-2 gap-4 mb-6">
                                                <div>
                                                    <p class="text-sm text-gray-500">Người nhận</p>
                                                    <p class="font-semibold text-gray-800">${o.receiverName}</p>
                                                </div>
                                                <div>
                                                    <p class="text-sm text-gray-500">Số điện thoại</p>
                                                    <p class="font-semibold text-gray-800">${o.phone}</p>
                                                </div>
                                                <div class="col-span-2">
                                                    <p class="text-sm text-gray-500">Địa chỉ</p>
                                                    <p class="font-semibold text-gray-800"> ${o.address}, ${o.city}</p>
                                                </div>
                                                <div class="col-span-2">
                                                    <p class="text-sm text-gray-500">Ghi chú</p>
                                                    <p class="font-semibold text-gray-800">${o.note}</p>
                                                </div>
                                            </div>
                                            <div class="border-t pt-4">
                                                <h4 class="font-bold text-gray-800 mb-4">Sản phẩm</h4>
                                                <c:forEach items="${o.items}" var="i">
                                                    <div class="flex justify-between items-center py-4 border-b">
                                                        <div class="flex items-center gap-4">
                                                            <img src="${i.product.image}" class="w-20 h-20 object-cover rounded-lg border">
                                                            <div>
                                                                <p class="font-semibold text-gray-800">${i.product.name}</p>
                                                                <p class="text-sm text-gray-500 mt-1">SL: ${i.quantity}</p>    
                                                            </div>
                                                        </div>
                                                        <div class="font-bold text-gray-800">
                                                            <fmt:setLocale value="vi_VN"/>
                                                            <fmt:formatNumber value="${i.price}" type="number"/> VNĐ
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="flex justify-between items-center mt-5 pt-4 border-t">
                                                <span class="text-lg font-bold text-gray-800">Tổng cộng</span>
                                                <span class="text-2xl font-extrabold text-red-500">
                                                    <fmt:formatNumber value="${o.totalPrice}" type="number"/> VNĐ
                                                </span>
                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p class="text-gray-400 italic">Bạn chưa có đơn hàng nào.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div id="password" class="tab-content">
                <h1 class="brand-font text-3xl mb-10">Đổi mật khẩu</h1>
                <form action="ChangePassword" method="post" class="max-w-md">
                    <p class="label-small">Mật khẩu hiện tại</p>
                    <input type="password" name="oldPassword" class="form-control" required>
                    <p class="label-small">Mật khẩu mới</p>
                    <input type="password" name="newPassword" class="form-control" required>
                    <p class="label-small">Xác nhận mật khẩu mới</p>
                    <input type="password" name="confirmPassword" class="form-control" required>
                    <button type="submit" class="bg-black text-white text-[10px] font-bold uppercase tracking-[4px] w-full py-4 hover:bg-[#b08d57] transition-all">Đổi mật khẩu</button>
                    <c:if test="${not empty mess}"><p class="mt-4 text-red-500">${mess}</p></c:if>
                </form>
            </div>
        </main>
    </div>

    <script>
        lucide.createIcons();
        // Xử lý chuyển tab
        const tabs = document.querySelectorAll('.sidebar-link[data-tab]');
        const contents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const target = tab.getAttribute('data-tab');
                tabs.forEach(t => t.classList.remove('active'));
                contents.forEach(c => c.classList.remove('active'));
                tab.classList.add('active');
                document.getElementById(target).classList.add('active');
            });
        });

        function toggleUserMenu() {
            let menu = document.getElementById("dropdownUser");
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
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