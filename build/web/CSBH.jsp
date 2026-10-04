<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chính Sách Bảo Hành - Luxury Watch</title>
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
                --danger: #c62828; /* Màu cho nhãn Sale */
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
        /* Navbar */
        nav {
            position: fixed; top: 0; width: 100%;
            display: flex; justify-content: space-between; align-items: center;
            padding: 30px 8%; z-index: 1000;
            background: linear-gradient(to bottom, rgba(255,255,255,0.9), transparent);
            transition: 0.5s;
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
        nav.scrolled { 
            padding: 15px 8%; 
            background: rgba(255, 255, 255, 0.98); 
            border-bottom: 1px solid var(--border-light);
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }
        .nav-links { display: flex; gap: 40px; list-style: none; margin-right: -150px;}
        .nav-links a { 
            color: var(--text-dark); text-decoration: none; font-size: 0.75rem; 
            text-transform: uppercase; letter-spacing: 2px; opacity: 0.7;
            transition: 0.3s; display: inline-block;
        }
        .nav-links a:hover { opacity: 1; color: var(--text-dark); transform: scale(1.2); }
        .nav-search {  margin-left: -100px; }
        /* --- Search Bar Style --- */
        .search-container {
            position: relative;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 2px 5px;
            width: 200%;
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
        .auth-controls { display: flex; align-items: center; gap: 15px; margin-right:  -100px;  }
        .auth-link { text-decoration: none; color: var(--text-dark); font-size: 0.7rem; text-transform: uppercase; letter-spacing: 1px; transition: 0.3s; opacity: 0.8; }
        .auth-link:hover { color: var(--text-dark); opacity: 1; transform: scale(1.2); }
        .auth-divider { width: 2px; height: 14px; background: var(--text-gray); opacity: 1; }
        @keyframes slowZoom { from { transform: scale(1); } to { transform: scale(1.1); } }
        /* Header with Background Image */
        .page-header {
            height: 85vh; /* Tăng chiều cao để hiệu ứng lùi khung rõ hơn */
            background: linear-gradient(to bottom, rgba(255,255,255,0.1), #ffffff), 
                        url('https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=2000') center/cover no-repeat;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            text-align: center;
            position: relative;
        }
        .header-content {
            transform: translateY(-50px);
        }
        .page-header h1 { 
            font-family: 'Cinzel', serif; 
            font-size: 4rem; 
            letter-spacing: 15px; 
            margin-bottom: 15px;
            color: #000;
        }
        .page-header p { 
            text-transform: uppercase; 
            letter-spacing: 6px; 
            font-size: 0.95rem; 
            color: var(--text-gray);
            margin-bottom: 5px;
        }

        /* Layout Split Content */
        .main-content {
            max-width: 1350px;
            margin: -220px auto 100px; /* Lùi sâu xuống dưới ảnh nền */
            padding: 0 40px;
            display: grid;
            grid-template-columns: 1.8fr 1fr;
            gap: 30px;
            position: relative;
            z-index: 20;
            /* Hiệu ứng mờ ban đầu cho góc phải trên */
            transition: opacity 0.6s ease, filter 0.6s ease;
        }

        .card {
            background: #fff;
            padding: 60px 50px;
            border-radius: 2px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.08);
            border: 1px solid var(--border-color);
            position: relative;
        }
        .warranty-card {
            border-top: 6px solid #28a745;
        }
        .exclusion-card {
            background: #fafafa;
            border-top: 6px solid var(--danger);
        }

        .section-title {
            font-family: 'Cinzel', serif;
            font-size: 1.5rem;
            margin-bottom: 35px;
            display: flex;
            align-items: center;
            gap: 15px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        .warranty-card .section-title i { color: #28a745; }
        .exclusion-card .section-title i { color: var(--danger); }

        /* Warranty Grid */
        .warranty-info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 45px 35px;
        }
        .info-item { display: flex; gap: 20px; }
        .info-item i { font-size: 1.5rem; color: var(--text-gray); margin-top: 5px; }
        .info-item .fas.fa-gem { font-size: 1.5rem; color: #87cefa; margin-top: 5px; }
        .info-item  .fas.fa-tint-slash  { font-size: 1.5rem; color: #007bff; margin-top: 5px; }
        .info-item .fas.fa-battery-full , .fas.fa-check-double { font-size: 1.5rem; color: #28a745; margin-top: 5px; }
        .info-item h4 { font-family: 'Tenor Sans', serif; font-size: 0.9rem; letter-spacing: 1px; margin-bottom: 10px; }
        .info-item p { font-size: 0.88rem; color: var(--text-gray); line-height: 1.6; }

        /* Exclusion List */
        .exclusion-list { list-style: none; }
        .exclusion-list li {
            padding: 22px 0;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            display: flex;
            gap: 15px;
        }
        .exclusion-list li:last-child { border-bottom: none; }
        .exclusion-list i { color: var(--danger); font-size: 1rem; margin-top: 4px; }
        .exclusion-list h5 { font-family: 'Tenor Sans', sans-serif; font-weight: 700; font-size: 0.95rem; margin-bottom: 5px; }
        .exclusion-list p { font-size: 0.85rem; color: var(--text-gray); }

        @media (max-width: 1024px) {
            .main-content { grid-template-columns: 1fr; margin-top: -100px; }
            .page-header h1 { font-size: 2.8rem; letter-spacing: 8px; }
        }
        @media (max-width: 768px) {
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
                            <a href="CSBH.jsp">Chính sách bảo hành</a>
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
                        <a href="#dangnhap" onclick="openLogin()" class="auth-link">Đăng Nhập</a>
                        <span class="auth-divider"></span>
                        <a href="Register" class="auth-link">Đăng Ký</a>
                    </c:otherwise>
                </c:choose> 
        </div>
    </nav>

    <header class="page-header">
        <div class="header-content">
            <h1>WARRANTY</h1>
            <p>Cam kết chất lượng thượng lưu</p>
            <p>Bảo chứng cho sự trường tồn</p>
        </div>
    </header>

    <!-- Thêm class is-top mặc định -->
    <div class="main-content is-top" id="scrollContent">
        <!-- Cột Trái: Bảo hành chính hãng quốc tế -->
        <section class="card warranty-card">
            <h2 class="section-title"><i class="fas fa-shield-alt"></i> Bảo Hành Chính Hãng Quốc Tế</h2>
            <p style="color: var(--text-gray); margin-bottom: 45px; font-size: 1rem; border-left: 2px solid #28a745; padding-left: 20px;">
                Mỗi sản phẩm không chỉ là một chiếc đồng hồ, mà còn là biểu tượng của đẳng cấp, độ chính xác và giá trị bền vững theo thời gian. 
                Được chế tác theo tiêu chuẩn Thụy Sỹ danh tiếng, từng chi tiết đều đạt độ hoàn thiện tinh xảo và độ chính xác cao nhất. 
                Chúng tôi cam kết mang đến trải nghiệm toàn diện, giúp khách hàng an tâm tuyệt đối trong suốt quá trình sử dụng.
            </p>

            <div class="warranty-info-grid">
                <div class="info-item">
                    <i class="fas fa-clock"></i>
                    <div>
                        <h4>Thời Hạn 5 Năm</h4>
                        <p> Sản phẩm được bảo hành chính hãng trong thời gian lên đến 60 tháng kể từ ngày kích hoạt.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-gem"></i>
                    <div>
                        <h4>Dịch Vụ Spa Cao Cấp</h4>
                        <p>Miễn phí vệ sinh siêu âm và đánh bóng vỏ kim loại định kỳ hàng năm bằng thiết bị chuyên dụng, giữ đồng hồ luôn như mới.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-battery-full"></i>
                    <div>
                        <h4>Thay Pin Trọn Đời</h4>
                        <p>Đặc quyền thay pin miễn phí không giới hạn số lần cho các dòng máy chính hãng.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-check-double"></i>
                    <div>
                        <h4>Linh Kiện Gốc</h4>
                        <p>Cam kết chỉ sử dụng linh kiện nhập khẩu chính hãng từ các nhà sản xuất máy Thụy Sỹ.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-tint-slash"></i>
                    <div>
                        <h4>Chống Nước Tuyệt Đối</h4>
                        <p>Kiểm tra áp suất chân không và thay gioăng chống nước miễn phí khi thực hiện bảo trì.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-truck-moving"></i>
                    <div>
                        <h4>Giao Nhận Tận Nơi</h4>
                        <p>Hỗ trợ nhận và giao đồng hồ tận nơi, miễn phí toàn quốc.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Cột Phải: Điều khoản từ chối -->
        <aside class="card exclusion-card">
            <h2 class="section-title"><i class="fas fa-exclamation-triangle"></i> Từ Chối Bảo Hành</h2>
            <ul class="exclusion-list">
                <li>
                    <i class="fas fa-times-circle"></i>
                    <div>
                        <h5>Lỗi Do Va Đập</h5>
                        <p>Không áp dụng trong các trường hợp hư hỏng do rơi, vỡ và va chạm hoặc tác động mạnh.</p>
                    </div>
                </li>
                <li>
                    <i class="fas fa-times-circle"></i>
                    <div>
                        <h5>Sử Dụng Sai Cách</h5>
                        <p>Không bảo hành nếu sử dụng sai hướng dẫn hoặc trong môi trường không phù hợp.</p>
                    </div>
                </li>
                <li>
                    <i class="fas fa-times-circle"></i>
                    <div>
                        <h5>Can Thiệp Bên Ngoài</h5>
                        <p>Sản phẩm đã bị tháo mở hoặc sửa chữa bởi các đơn vị không thuộc hệ thống chính hãng.</p>
                    </div>
                </li>
                <li>
                    <i class="fas fa-times-circle"></i>
                    <div>
                        <h5>Lão Hóa Tự Nhiên</h5>
                        <p>Không áp dụng cho các biến đổi về màu sắc, chất liệu do quá trình sử dụng tự nhiên.</p>
                    </div>
                </li>
            </ul>
        </aside>
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
    <script>
        // Xử lý hiệu ứng mờ khi cuộn trang
        window.addEventListener('scroll', function() {
            const content = document.getElementById('scrollContent');
            const navbar = document.getElementById('navbar');
            const scrollPos = window.scrollY;

            // Khi cuộn xuống quá 100px thì hiện rõ
            if (scrollPos > 100) {
                content.classList.remove('is-top');
                navbar.style.background = "rgba(255,255,255,0.95)";
                navbar.style.boxShadow = "0 2px 10px rgba(0,0,0,0.05)";
            } else {
                content.classList.add('is-top');
                navbar.style.background = "transparent";
                navbar.style.boxShadow = "none";
            }
        });
        window.addEventListener('scroll', () => {
            const nav = document.getElementById('navbar');
            if (window.scrollY > 50) nav.classList.add('scrolled');
            else nav.classList.remove('scrolled');
        });
        lucide.createIcons();
        function openLogin() {
            document.getElementById("loginModal").style.display = "block";
            history.replaceState(null, null, "#dangnhap");
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
    </script>
     <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>