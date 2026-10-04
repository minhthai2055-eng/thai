<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Phản hồi | KDA LUXURY Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap&subset=vietnamese" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
       
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #f8fafc; /* Nền trắng xám nhạt để làm nổi bật các card trắng */
            color: #1e293b;
            overflow-x: hidden;
        }

        /* Đồng bộ Sidebar trắng & Menu Highlight vàng nhạt từ ảnh image_8cefc9.png */
        .sidebar {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            width: 260px;
            background: #ffffff;
            border-right: 1px solid #e2e8f0;
            z-index: 50; 
        }

        .sidebar.collapsed {
            width: 80px;
        }

        .main-content {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            margin-left: 260px;
        }
        .nav-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            margin: 0.25rem 0.75rem;
            border-radius: 12px;
            color: #64748b;
            transition: all 0.2s;
            cursor: pointer;
            white-space: nowrap;
            overflow: hidden;
        }

        .nav-item:hover {
            background: #f1f5f9;
            color: #0f172a;
        }

        .nav-item.active {
            background: #fef3c7;
            color: #b45309;
            font-weight: 600;
        }

        .nav-text {
            transition: opacity 0.2s;
            margin-left: 0.75rem;
        }

        .admin-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            border: 1px solid #f1f1f1;
        }

        .table-row {
            transition: all 0.2s ease;
            border-bottom: 1px solid #f1f5f9;
        }

        .table-row:hover {
            background: #f8fafc;
        }

        .btn-action {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            transition: all 0.2s;
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
        }

        .btn-action:hover {
            background: #e2e8f0;
            transform: translateY(-1px);
        }
    </style>
</head>
<body class="flex min-h-screen">

    <!-- SIDEBAR (Đồng bộ 100% cấu trúc, màu sắc, icon của KDA LUXURY Admin) -->
    <aside class="sidebar fixed h-full flex flex-col py-6">
        <div class="p-6 mb-4 flex items-center gap-3 border-b border-slate-100">
            <div class="w-12 h-12 rounded-xl bg-amber-100 flex items-center justify-center">
                <i data-lucide="user-cog" class="w-6 h-6 text-amber-600"></i>
            </div>
            <div class="flex flex-col">
                <span class="text-[11px] text-amber-600 font-bold uppercase tracking-wider">Hệ thống Admin</span>
                <span class="text-base font-bold text-slate-800">Quản trị viên</span>  
            </div>
        </div>

        <nav class="flex-grow space-y-1">
            <a href="TrangChu" class="nav-item">
                <i data-lucide="house" class="w-5 h-5 shrink-0"></i>
                <span class="nav-text">Trang Chủ</span>
            </a>
            <a href="SanPham" class="nav-item">
                <i data-lucide="watch" class="w-5 h-5 shrink-0"></i>
                <span class="nav-text">Bộ Sưu tập</span>
            </a>
            <div class="relative">
                <button onclick="toggleManagerMenu()" class="nav-item w-full">     
                    <i data-lucide="layout-dashboard" class="w-5 h-5 shrink-0"></i>
                    <span class="nav-text">Quản Lý</span>
                    <i data-lucide="chevron-down" class="w-4 h-4 ml-auto"></i>
                </button>
                <div id="managerMenu" class="hidden ml-8 mt-2 space-y-2">        
                    <a href="ManagerProduct" class="nav-item">
                        <i data-lucide="package" class="w-4 h-4 shrink-0"></i>
                        <span class="nav-text text-sm">Quản Lý Sản Phẩm</span>
                    </a>
                    <a href="revenue" class="nav-item ">
                        <i data-lucide="chart-column" class="w-4 h-4 shrink-0"></i>
                        <span class="nav-text text-sm"> Doanh Thu </span>
                    </a>
                    <a href="feedback" class="nav-item active">
                        <i data-lucide="messages-square" class="w-4 h-4 shrink-0"></i>
                        <span class="nav-text text-sm"> Phản Hồi Khách Hàng </span>
                    </a>
                </div>
            </div>
            <a href="Cart" class="nav-item">
                <i data-lucide="shopping-bag" class="w-5 h-5 shrink-0"></i>
                <span class="nav-text">Giỏ Hàng</span>
            </a>
        </nav>
        <div class="p-4 border-t border-slate-100">
            <a href="Logout" class="nav-item">
                <i data-lucide="log-out" class="w-5 h-5 text-red-500"></i>
                <span class="nav-text">Đăng xuất</span>
            </a>
        </div>
    </aside>

    <!-- MAIN CONTENT AREA (Bên phải hiển thị danh sách phản hồi) -->
    <main class="ml-[260px] flex-1 p-8">
        <div class="max-w-7xl mx-auto">
            
            <!-- Header & Thống kê nhanh đồng bộ ảnh mẫu -->
            <div class="flex flex-col md:flex-row justify-between items-end gap-6 mb-8">
                <div class="space-y-1">
                    <h1 class="text-3xl font-bold text-slate-900 tracking-tight">Phản hồi khách hàng</h1>
                    <p class="text-slate-500 text-sm">Xem, kiểm tra lời nhắn gửi từ biểu mẫu liên hệ của KDA Luxury.</p>
                </div>
                
                <!-- Hộp thống kê nhanh -->
                <div class="flex gap-4">
                    <div class="admin-card px-6 py-4 flex items-center gap-4 bg-white">
                        <div class="w-10 h-10 rounded-full bg-amber-50 flex items-center justify-center text-amber-600">
                            <i data-lucide="message-square-text" class="w-5 h-5"></i>
                        </div>
                        <div>
                            <div class="text-[10px] uppercase tracking-widest text-slate-400 font-bold">Tổng phản hồi</div>
                            <div class="text-xl font-bold text-slate-800" id="total-feedback">9</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bảng hiển thị thông tin phản hồi (Đồng bộ dữ liệu SQL từ image_8cf38d.png) -->
            <div class="admin-card overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left">
                        <thead>
                            <tr class="bg-slate-50 text-slate-500 text-[11px] uppercase tracking-wider font-bold border-b border-slate-200">
                                <th class="px-6 py-4">Họ và Tên</th>
                                <th class="px-6 py-4">Địa chỉ Email</th>
                                <th class="px-6 py-4">Số điện thoại</th>
                                <th class="px-6 py-4">Nội dung tin nhắn</th>
                            </tr>
                        </thead>

                        <tbody class="text-sm divide-y divide-slate-100">
                            <c:forEach items="${listF}" var="f">
                                <tr class="table-row">
                                    <td class="px-6 py-4 font-semibold text-slate-900"> ${f.fullname}</td>
                                    <td class="px-6 py-4 text-slate-600">${f.email}</td>
                                    <td class="px-6 py-4 text-slate-600 font-mono text-xs">${f.phone}</td>
                                    <td class="px-6 py-4 text-slate-500">${f.message}</td>                              
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <!-- MODAL XEM CHI TIẾT PHẢN HỒI (Tối giản tinh tế) -->
    <div id="detailModal" class="hidden fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-[100] px-6">
        <div class="bg-white max-w-md w-full p-8 rounded-xl border border-amber-200 shadow-2xl relative animate-in fade-in duration-200">
            <button onclick="closeModal()" class="absolute top-4 right-4 text-gray-400 hover:text-black transition-colors">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
            <div class="flex items-center gap-3 mb-6">
                <div class="w-10 h-10 bg-amber-50 rounded-lg flex items-center justify-center text-amber-700">
                    <i data-lucide="mail-open" class="w-5 h-5"></i>
                </div>
                <h3 class="serif text-xl font-bold text-gray-800">Chi tiết lời nhắn</h3>
            </div>
            
            <div class="space-y-4 text-sm">
                <div>
                    <span class="text-[10px] text-gray-400 font-bold uppercase tracking-wider block">Họ và Tên</span>
                    <p class="font-semibold text-gray-800 mt-0.5" id="modalName"></p>
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <span class="text-[10px] text-gray-400 font-bold uppercase tracking-wider block">Email</span>
                        <p class="text-gray-600 mt-0.5 font-medium break-all" id="modalEmail"></p>
                    </div>
                    <div>
                        <span class="text-[10px] text-gray-400 font-bold uppercase tracking-wider block">Số điện thoại</span>
                        <p class="text-gray-600 mt-0.5 font-mono" id="modalPhone"></p>
                    </div>
                </div>
                <div class="pt-4 border-t border-gray-100">
                    <span class="text-[10px] text-gray-400 font-bold uppercase tracking-wider block">Nội dung liên hệ</span>
                    <div class="bg-slate-50 p-4 rounded-lg mt-1 text-gray-700 leading-relaxed text-xs border border-slate-100" id="modalMsg"></div>
                </div>
            </div>

            <div class="mt-8 flex justify-end">
                <button onclick="closeModal()" class="bg-black text-white px-6 py-2.5 text-xs font-bold uppercase tracking-wider hover:bg-[#b7791f] transition-all rounded-sm">
                    Đóng cửa sổ
                </button>
            </div>
        </div>
    </div>

    <!-- TOAST THÔNG BÁO -->
    <div id="toast" class="fixed bottom-6 right-6 bg-black text-white text-xs font-bold uppercase tracking-widest px-6 py-4 rounded shadow-lg transform translate-y-20 opacity-0 transition-all duration-300 pointer-events-none z-[200]">
        Cập nhật thành công!
    </div>

    <script>
        lucide.createIcons();
        function toggleManagerMenu() {
            const menu = document.getElementById("managerMenu");
            menu.classList.toggle("hidden");
        }
    </script>
</body>
</html>