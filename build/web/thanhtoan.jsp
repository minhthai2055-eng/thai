<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán | LUXURY WATCH</title>
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
        .input-luxury {
            border: none;
            border-bottom: 1px solid #e5e7eb;
            padding: 12px 0;
            width: 100%;
            background: transparent;
            transition: all 0.3s ease;
            font-size: 14px;
            border-radius: 0;
        }
        .input-luxury:focus {
            outline: none;
            border-bottom-color: var(--gold);
        }
        .summary-card {
            background-color: var(--bg-gray);
            border-radius: 2.5rem;
        }
        .btn-confirm {
            background: #000;
            color: white;
            letter-spacing: 0.3em;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .btn-confirm:hover {
            background: #1a1a1a;
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        .payment-option {
            border: 1px solid #f1f1f1;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
        }
        .payment-option:hover {
            border-color: #e5e7eb;
        }
        .payment-option.active {
            border-color: var(--gold);
            background: #fffcf5;
            box-shadow: 0 4px 15px rgba(184, 134, 11, 0.05);
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
        /* Success Modal Styles */
        /* Success Modal Styles */
        #successModal {
            display: none;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        #successModal.show {
            display: flex;
            opacity: 1;
        }

        /* trạng thái ẩn */
        #successModal .modal-content {
            transform: translate(-50%, -50%) scale(0.9);
            transition: transform 0.5s ease;
        }

        /* trạng thái hiện */
        #successModal.show .modal-content {
            transform: translate(-50%, -50%) scale(1);
        }
        .close {
            position: absolute; right: 15px; top: 15px;
            font-size: 18px; cursor: pointer; color: #888;
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

    <!-- Success Modal Overlay -->
    <div id="successModal" class="fixed inset-0 z-[100] items-center justify-center bg-white/95 backdrop-blur-md p-6">
        <div class="modal-content max-w-md w-full bg-white text-center">
            <div class="mb-10 flex justify-center">
                <div class="w-24 h-24 rounded-full bg-zinc-50 flex items-center justify-center border border-zinc-100 shadow-sm">
                    <i data-lucide="check" class="w-10 h-10 text-[#b8860b]"></i>
                </div>
            </div>
            <h2 class="text-4xl font-luxury italic mb-4">Cảm ơn quý khách</h2>
            <p class="text-[10px] uppercase tracking-[0.3em] text-zinc-400 mb-8 font-luxury italic">Đơn hàng của bạn đã được ghi nhận</p>
            <div class="h-[1px] w-12 bg-zinc-200 mx-auto mb-10"></div>
            <p class="text-sm text-zinc-500 mb-12 leading-relaxed px-4">
                Luxury Watch đang chuẩn bị tuyệt phẩm cho bạn. Hệ thống sẽ sớm đưa bạn quay lại trang chủ.
            </p>
            <button onclick="window.location.href='TrangChu'" class="text-[9px] uppercase font-black tracking-[0.4em] border-b-2 border-black pb-2 hover:text-[#b8860b] transition-colors">
                Quay về trang chủ
            </button>
        </div>
    </div>

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
                                <span class="text-[9px] uppercase font-bold tracking-widest text-zinc-600">${sessionScope.acc.username}</span>
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
        <a href="TrangChu">Trang Chủ</a> <span>/</span> <a href="Cart">Giỏ Hàng</a> <span>/</span> <a href="ThanhToan">Thanh Toán</a>
    </div>

    <main class="max-w-7xl mx-auto px-6 py-16">
        <form id="checkoutForm" action="ThanhToan" method="post">
            <div class="grid grid-cols-12 gap-16">
                <!-- Left Side: Information & Payment -->
                <div class="col-span-12 lg:col-span-7">
                    <div class="mb-12">
                        <h2 class="text-3xl font-luxury italic mb-2">Thông tin giao hàng</h2>
                        <p class="text-xs text-zinc-400 tracking-wider uppercase">Vui lòng điền thông tin chính xác để nhận hàng</p>
                    </div>

                    <div class="grid grid-cols-2 gap-x-10 gap-y-12 mb-20">
                        <div class="col-span-2 md:col-span-1">
                            <label class="text-[9px] uppercase font-bold text-zinc-400 tracking-[0.2em]">Họ và tên</label>
                            <input type="text" name="receiverName" class="input-luxury" value="${sessionScope.acc.fullname}">
                        </div>
                        <div class="col-span-2 md:col-span-1">
                            <label class="text-[9px] uppercase font-bold text-zinc-400 tracking-[0.2em]">Số điện thoại liên lạc</label>
                            <input type="tel" name="phone" class="input-luxury" value="${sessionScope.acc.phone}">
                        </div>
                        <div class="col-span-2">
                            <label class="text-[9px] uppercase font-bold text-zinc-400 tracking-[0.2em]">Địa chỉ nhận hàng (Số nhà, Tòa nhà, Đường...)</label>
                            <input type="text" name="address" class="input-luxury" value="${sessionScope.acc.address}">
                        </div>
                        <div class="col-span-2 md:col-span-1">
                            <label class="text-[9px] uppercase font-bold text-zinc-400 tracking-[0.2em]">Tỉnh / Thành phố</label>
                            <input type="tel" name="city" class="input-luxury" placeholder="Hà Nội , Hồ Chí Minh , ...">
                        </div>
                        <div class="col-span-2 md:col-span-1">
                            <label class="text-[9px] uppercase font-bold text-zinc-400 tracking-[0.2em]">Ghi chú vận chuyển</label>
                            <input type="text" name="note" class="input-luxury" placeholder="Ví dụ: Giao sau 5h chiều...">
                        </div>
                        <c:if test="${not empty error}">
                            <p class="text-red-500 text-sm mt-4">${error}</p>     
                        </c:if>
                    </div>

                    <div class="mb-10">
                        <h2 class="text-3xl font-luxury italic mb-2">Phương thức thanh toán</h2>
                        <p class="text-xs text-zinc-400 tracking-wider uppercase">Mọi giao dịch đều được bảo mật tuyệt đối</p>
                    </div>

                    <div class="space-y-4">
                        <div class="p-8 rounded-3xl border border-zinc-200 bg-[#fffcf5]">
                            <div class="flex items-center gap-5">
                                <div class="w-12 h-12 rounded-2xl bg-zinc-50 flex items-center justify-center">
                                    <i data-lucide="truck" class="w-6 h-6 text-zinc-600"></i>
                                </div>
                                <div>
                                    <p class="text-sm font-bold tracking-tight uppercase">Thanh toán khi nhận hàng (COD)</p>
                                    <p class="text-[11px] text-zinc-400 mt-1">Kiểm tra sản phẩm trước khi thanh toán cho nhân viên giao hàng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side: Order Summary -->
                <div class="col-span-12 lg:col-span-5">
                    <div class="summary-card p-12 sticky top-32">
                        <h2 class="text-xl font-luxury mb-12 italic font-bold tracking-wide">Chi tiết đơn hàng</h2>

                        <div class="space-y-8 mb-12 border-b border-zinc-200 pb-12">
                            <!-- Danh sách sản phẩm -->
                            <c:forEach items="${cart.items}" var="item">
                                <div class="flex gap-6 items-center">
                                    <!-- ẢNH -->
                                    <div class="w-20 h-20 bg-white rounded-2xl p-2 border border-zinc-100 flex-shrink-0 shadow-sm">
                                        <img src="${item.product.image}" class="w-full h-full object-cover rounded-lg">
                                    </div>
                                    <!-- TÊN + SỐ LƯỢNG -->
                                    <div class="flex-1">
                                        <p class="text-[11px] font-bold uppercase tracking-widest leading-tight">${item.product.name}</p>
                                        <p class="text-[10px] text-zinc-400 mt-1 italic uppercase tracking-tighter">Số lượng: ${item.quantity}</p>
                                    </div>
                                    <!-- GIÁ -->
                                    <p class="text-[11px] font-bold tracking-tighter">
                                        <fmt:setLocale value="vi_VN"/>
                                        <fmt:formatNumber value="${item.totalPrice}" type="number"/> VNĐ
                                    </p>
                                </div>
                            </c:forEach>
                            <!-- Price Breakdown -->
                            <div class="space-y-4 mt-8">
                                <div class="flex justify-between text-[10px] uppercase font-bold tracking-widest text-zinc-400">
                                    <span>Tổng tiền hàng </span>
                                    <span class="text-zinc-800"><fmt:formatNumber value="${cart.totalPrice}" type="number"/>VNĐ</span>
                                </div>
                                <div class="flex justify-between text-[10px] uppercase font-bold tracking-widest text-zinc-400">
                                    <span>Phí vận chuyển</span>
                                    <span class="text-[#b8860b]">Miễn phí</span>
                                </div>
                                <div class="flex justify-between text-[10px] uppercase font-bold tracking-widest text-zinc-400">
                                    <span>Bảo hiểm Luxury</span>
                                    <span class="text-zinc-500 italic">Đã bao gồm</span>
                                </div>
                            </div>
                        </div>
                        <!-- Tổng tiền -->
                        <div class="flex justify-between items-end mb-12">
                            <span class="text-[10px] uppercase font-black tracking-[0.2em] text-zinc-400">Thanh toán</span>
                            <div class="text-right">
                                <p class="text-4xl font-luxury text-red-500 font-bold leading-none tracking-tight">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${cart.totalPrice}" type="number"/>
                                </p>
                                <p class="text-[9px] text-zinc-400 mt-3 uppercase tracking-[0.3em] font-bold">VNĐ</p>
                            </div>
                        </div>
                        <button type="submit" onclick="handleCheckout()" class="w-full btn-confirm py-5 rounded-full text-xs uppercase tracking-[0.35em] font-bold mb-8 shadow-xl hover:scale-[1.02] transition-all duration-300">Hoàn tất đặt hàng</button>                      
                    </div>
                </div>
            </div>
        </form>
    </main>
     <jsp:include page="footer.jsp"></jsp:include>                           
    <script>
        lucide.createIcons();
        function toggleUserMenu() {
            let menu = document.getElementById("dropdownUser");
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
        }
        <c:if test="${not empty success}">
            window.onload = function () {

                const modal = document.getElementById("successModal");

                modal.classList.add("show");

                setTimeout(() => {
                    window.location.href = "TrangChu";
                }, 3000);
            }
        </c:if>
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