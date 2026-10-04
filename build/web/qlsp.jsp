<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Quản lý Sản phẩm</title>
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

        /* Sidebar Styling */
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

        .collapsed .nav-text {
            opacity: 0;
            pointer-events: none;
        }

        /* Card Styling */
        .glass-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
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
        }

        .btn-action:hover {
            background: #e2e8f0;
            transform: translateY(-1px);
        }

        .gold-text {
            background: linear-gradient(135deg, #b45309 0%, #d97706 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Mobile Responsive */
        @media (max-width: 1024px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .sidebar.mobile-open {
                transform: translateX(0);
                width: 260px;
            }
            .main-content {
                margin-left: 0 !important;
            }
        }

        .price-old { color: #94a3b8; font-size: 0.8rem; text-decoration: line-through; }
        .price-current { color: #dc2626; font-size: 1rem; font-weight: 600; }
        
        input::placeholder { color: #94a3b8; }
    </style>
</head>
<body class="min-h-screen flex">
    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar fixed h-full top-0 left-0 flex flex-col">
        <div class="p-6 mb-4 flex items-center gap-3 border-b border-slate-100">
            <div class="w-12 h-12 rounded-xl bg-amber-100 flex items-center justify-center">
                <i data-lucide="user-cog" class="w-6 h-6 text-amber-600"></i>
            </div>
            <div class="flex flex-col">
                <span class="text-[11px] text-amber-600 font-bold uppercase tracking-wider">Hệ thống Admin</span>
                <span class="text-base font-bold text-slate-800">Quản trị viên</span>  
            </div>
        </div>

        <nav class="flex-1">
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
                    <a href="ManagerProduct" class="nav-item active">
                        <i data-lucide="package" class="w-4 h-4 shrink-0"></i>
                        <span class="nav-text text-sm">Quản Lý Sản Phẩm</span>
                    </a>
                    <a href="revenue" class="nav-item">
                        <i data-lucide="chart-column" class="w-4 h-4 shrink-0"></i>
                        <span class="nav-text text-sm"> Doanh Thu </span>
                    </a>
                    <a href="feedback" class="nav-item">
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

    <!-- Main Content Container -->
    <main id="mainContent" class="main-content flex-1 p-4 lg:p-8">
        <div class="max-w-7xl mx-auto">
            <!-- Header & Stats -->
            <div class="flex flex-col md:flex-row justify-between items-end gap-6 mb-8">
                <div class="space-y-1">
                    <h1 class="text-3xl font-bold text-slate-900 tracking-tight">Danh mục Sản phẩm</h1>
                    <p class="text-slate-500">Quản lý kho hàng và điều chỉnh giá trị tài sản.</p>
                </div>
                
                <div class="flex gap-4">
                    <div class="glass-card px-6 py-4 flex items-center gap-4">
                        <div class="w-10 h-10 rounded-full bg-amber-50 flex items-center justify-center text-amber-600">
                            <i data-lucide="package" class="w-5 h-5"></i>
                        </div>
                        <div>
                            <div class="text-[10px] uppercase tracking-widest text-slate-400 font-bold">Tổng sản phẩm</div>
                            <div class="text-xl font-bold text-slate-800">${totalProduct}</div>
                        </div>
                    </div>
                    
                    <div class="glass-card px-6 py-4 flex items-center gap-4 border-amber-200/50">
                        <div class="w-10 h-10 rounded-full bg-emerald-50 flex items-center justify-center text-emerald-600">
                            <i data-lucide="wallet" class="w-5 h-5"></i>
                        </div>
                        <div>
                            <div class="text-[10px] uppercase tracking-widest text-slate-400 font-bold">Giá trị kho</div>
                            <fmt:setLocale value="vi_VN"/>
                            <div class="text-xl font-bold gold-text">
                                <fmt:formatNumber value="${totalValue}" type="number"/>VNĐ
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Toolbar -->
            <div class="flex flex-col md:flex-row gap-4 mb-6 justify-between items-center">
                <form action="ManagerProduct" method="get" class="relative w-full md:w-96">
                    <i data-lucide="search" class="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400"></i>
                    <input type="text" name="txt" value="${txtS}" placeholder="Tìm tên, mã hoặc thương hiệu..." class="w-full bg-white border border-slate-200 rounded-xl py-2.5 pl-10 pr-4 text-sm focus:outline-none focus:ring-2 focus:ring-amber-500/20 focus:border-amber-500 transition-all">
                    <button type="submit" class="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-amber-500">
                        <i data-lucide="search" class="w-4 h-4"></i>
                    </button>
                </form>
                
                <div class="flex gap-2 w-full md:w-auto">
                    <form action="ManagerProduct" method="get" class="flex gap-2">
                        <input type="hidden" name="txt" value="${txtS}">
                        <select name="type" onchange="this.form.submit()" class="px-4 py-2 bg-white border border-slate-200 rounded-xl text-sm font-medium text-slate-600 focus:outline-none">
                            <option value="">Sắp xếp giá</option>
                            <option value="asc" ${sortType == 'asc' ? 'selected' : ''}>Giá tăng dần</option>
                            <option value="desc" ${sortType == 'desc' ? 'selected' : ''}>Giá giảm dần</option>
                        </select>
                    </form>
                    <button onclick="openModal()" type="button" class="flex-1 md:flex-none px-4 py-2 bg-slate-900 text-white rounded-xl text-sm font-bold flex items-center justify-center gap-2 shadow-lg shadow-slate-200 hover:bg-slate-800 transition-all">
                        <i data-lucide="plus" class="w-4 h-4"></i>Thêm sản phẩm
                    </button>
                </div>
            </div>

            <!-- Data Table -->
            <div class="glass-card overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left">
                        <thead>
                            <tr class="bg-slate-50 text-slate-500 text-[11px] uppercase tracking-wider font-bold">
                                <th class="px-6 py-4">Sản phẩm</th>
                                <th class="px-6 py-4">Mã số</th>
                                <th class="px-6 py-4">Thương hiệu</th>
                                <th class="px-6 py-4">Mô tả</th>
                                <th class="px-6 py-4 text-right">Giá niêm yết</th>
                                <th class="px-6 py-4 text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody class="text-sm">
                            <c:forEach items="${listP}" var="p">
                                <tr class="table-row">
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 rounded-lg overflow-hidden bg-slate-100">
                                                <img src="${p.image}" class="w-full h-full object-cover">
                                            </div>
                                            <span class="font-semibold text-slate-800">${p.name}</span>                                     
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-slate-500 font-mono">#SP-${p.id}</td>
                                    <td class="px-6 py-4">
                                        <span class="bg-amber-50 text-amber-700 px-2 py-1 rounded text-xs font-bold uppercase">
                                            <c:forEach items="${listb}" var="b">
                                                <c:if test="${b.id == p.brand}">${b.bname}</c:if>
                                            </c:forEach>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 text-slate-500 truncate max-w-[200px]">${p.description}</td>
                                    <td class="px-6 py-4 text-right">
                                        <fmt:setLocale value="vi_VN"/>
                                        <c:choose>
                                            <c:when test="${p.sale_price > 0}">
                                                <div class="price-old">
                                                    <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                                                </div>
                                                <div class="price-current">
                                                    <fmt:formatNumber value="${p.sale_price}" type="number"/> VNĐ
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="price-current !text-slate-800">
                                                    <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex justify-center gap-2">
                                            <a href="Edit?id=${p.id}" class="btn-action text-blue-600">
                                                <i data-lucide="edit-2" class="w-4 h-4"></i>
                                            </a>
                                            <button type="button" onclick="openDeleteModal(${p.id})" class="btn-action text-red-600">
                                                <i data-lucide="trash-2" class="w-4 h-4"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="px-6 py-4 bg-slate-50 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                    <div>Hiển thị ${(currentPage-1)*10+1} - ${currentPage*10 > totalProducts ? totalProducts : currentPage*10} trên ${totalProducts} sản phẩm</div>
                    <div class="flex gap-1">
                        <c:if test="${currentPage > 1}">
                            <a href="ManagerProduct?page=${currentPage-1}&txt=${txtS}&type=${sortType}" class="px-3 py-1 bg-white border border-slate-200 rounded"> Trước</a>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <a href="ManagerProduct?page=${i}&txt=${txtS}&type=${sortType}" class="px-3 py-1 rounded ${i == currentPage ? 'bg-amber-500 text-white font-bold' : 'bg-white border border-slate-200'}">${i}</a>
                        </c:forEach>
                        <c:if test="${currentPage < endPage}">
                            <a href="ManagerProduct?page=${currentPage+1}&txt=${txtS}&type=${sortType}" class="px-3 py-1 bg-white border border-slate-200 rounded">Sau</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
                    
    <div id="deleteModal" class="fixed inset-0 bg-black/70 hidden z-50 items-center justify-center backdrop-blur-sm">
        <div class="bg-white rounded-3xl w-full max-w-md p-8 relative shadow-2xl">
            <button onclick="closeDeleteModal()" class="absolute top-4 right-5 text-3xl text-slate-400 hover:text-red-500">&times;</button>
            <div class="w-20 h-20 rounded-full bg-red-100 flex items-center justify-center mx-auto mb-5">
                <i data-lucide="trash-2" class="w-10 h-10 text-red-600"></i>       
            </div>
            <h2 class="text-2xl font-bold text-center text-slate-800 mb-3">Xóa sản phẩm?</h2>
            <p class="text-center text-slate-500 mb-8">Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
            <div class="flex gap-4">
                <button onclick="closeDeleteModal()" class="flex-1 py-3 rounded-2xl border border-slate-300 font-semibold hover:bg-slate-100 transition">Hủy</button>
                <a id="confirmDeleteBtn" href="delete" class="flex-1 py-3 rounded-2xl bg-red-600 text-white text-center font-semibold hover:bg-red-700 transition">Xóa</a>
            </div>
        </div>
    </div>

    <div id="productModal" class="fixed inset-0 bg-black/60 hidden z-50 flex items-center justify-center backdrop-blur-sm">
        <div class="w-full flex justify-center items-center p-4 h-screen">
            <div class="bg-white w-full max-w-2xl rounded-3xl shadow-2xl relative overflow-hidden">
                <div class="bg-slate-900 px-6 py-4 flex items-center justify-between sticky top-0 z-10">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
                            <i class="fa-solid fa-box-open text-lg text-amber-400"></i>
                        </div>
                        <div>
                            <h2 class="text-xl font-bold text-white">Thêm sản phẩm</h2>
                            <p class="text-slate-300 text-xs mt-1">Nhập thông tin sản phẩm mới</p>
                        </div>
                    </div>
                    <button onclick="closeModal()" class="text-slate-400 hover:text-red-400 text-2xl transition"> &times;</button>
                </div>

                <form action="AddProduct" method="post" enctype="multipart/form-data" class="p-6 space-y-5 max-h-[80vh] overflow-y-auto">
                    <div>
                        <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-3">
                            <i class="fa-solid fa-layer-group text-amber-500"></i>Danh mục
                        </label>
                        <div class="grid grid-cols-2 md:grid-cols-5 gap-3">
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="1" class="peer hidden">
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 hover:border-amber-400 peer-checked:bg-amber-50 peer-checked:border-amber-500">
                                    <i class="fa-solid fa-user text-base text-slate-700 mb-2"></i>
                                    <div class="text-sm font-semibold">Nam</div>
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="2" class="peer hidden">
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 hover:border-pink-400 peer-checked:bg-pink-50 peer-checked:border-pink-500">
                                    <i class="fa-solid fa-user text-base text-pink-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Nữ</div>
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="3" class="peer hidden">
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 hover:border-emerald-400 peer-checked:bg-emerald-50 peer-checked:border-emerald-500">
                                    <i class="fa-solid fa-star text-base text-emerald-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Mới</div>
                                </div>

                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="4"  class="peer hidden">
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 hover:border-red-400 peer-checked:bg-red-50 peer-checked:border-red-500">
                                    <i class="fa-solid fa-fire text-base text-red-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Hot</div>
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" id="saleCheck" name="category_id" value="5" onchange="toggleSalePrice()" class="peer hidden">
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 hover:border-yellow-400 peer-checked:bg-yellow-50 peer-checked:border-yellow-500">
                                    <i class="fa-solid fa-tags text-base text-yellow-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Sale </div>
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-crown text-amber-500"></i> Thương hiệu
                            </label>
                            <select name="brand_id" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-amber-500">                                        
                                <c:forEach items="${listb}" var="b">
                                    <option value="${b.id}">${b.bname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-watch-smart text-amber-500"></i>Tên sản phẩm
                            </label>
                            <input type="text" name="name" required placeholder="Rolex Submariner" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-amber-500">
                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-money-bill-wave text-emerald-500"></i>Giá gốc                             
                            </label>
                            <input type="number" name="price" required placeholder="350000000" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-amber-500">
                        </div>
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-percent text-red-500"></i>Giá giảm     
                            </label>
                            <input type="number" id="salePriceInput" name="sale_price" readonly placeholder="Nhập giá giảm" class="w-full border border-slate-300 rounded-2xl px-4 py-3 bg-slate-100 focus:outline-none">        
                        </div>

                    </div>
                    <div>
                        <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                            <i class="fa-solid fa-image text-blue-500"></i>  Ảnh sản phẩm
                        </label>
                        <div class="border-2 border-dashed border-slate-300 rounded-2xl p-5 text-center hover:border-amber-500 transition">              
                            <i class="fa-solid fa-cloud-arrow-up text-3xl text-amber-500 mb-3"></i>
                            <input type="file" name="image" accept="image/*" required class="block w-full text-sm text-slate-500">
                            <p class="text-xs text-slate-400 mt-2">PNG, JPG, WEBP</p>
                        </div>
                    </div>
                    <div>
                        <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                            <i class="fa-solid fa-align-left text-slate-500"></i>Mô tả
                        </label>
                        <textarea name="description" rows="3" placeholder="Nhập mô tả sản phẩm..." class="w-full border border-slate-300 rounded-2xl px-4 py-3 resize-none focus:outline-none focus:border-amber-500"></textarea>
                    </div>
                    <div class="pt-2">
                        
                        <button type="submit" class="w-full bg-amber-500 hover:bg-amber-600 transition text-white py-3 rounded-2xl font-bold text-base shadow-lg">
                            <i class="fa-solid fa-plus mr-2"></i>Thêm sản phẩm
                        </button>
                        <c:if test="${not empty sessionScope.error}">
                            <div class="bg-red-100 text-red-600 p-3 rounded mb-4">
                                ${sessionScope.error}
                            </div>

                            <c:remove var="error" scope="session"/>
                        </c:if>

                        <c:if test="${not empty sessionScope.success}">
                            <div class="bg-green-100 text-green-600 p-3 rounded mb-4">
                                ${sessionScope.success}
                            </div>

                            <c:remove var="success" scope="session"/>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <c:if test="${detail != null}">
        <div id="editModal" class="fixed inset-0 bg-black/60 z-50 backdrop-blur-sm flex items-center justify-center p-4 overflow-y-auto">      
            <div class="bg-white w-full max-w-2xl rounded-3xl shadow-2xl relative overflow-hidden">
                <div class="bg-gradient-to-r from-blue-900 to-cyan-700 px-6 py-4 flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl bg-white/10 flex items-center justify-center">
                            <i class="fa-solid fa-pen-to-square text-white text-lg"></i>
                        </div>
                        <div>
                            <h2 class="text-xl font-bold text-white">Chỉnh sửa sản phẩm</h2>
                            <p class="text-cyan-100 text-xs mt-1">Cập nhật thông tin sản phẩm</p>
                        </div>
                    </div>
                    <a href="ManagerProduct" class="text-white/70 hover:text-red-300 text-3xl transition">&times;</a>
                </div>
                <form action="Edit" method="post" enctype="multipart/form-data" class="p-6 space-y-5 max-h-[80vh] overflow-y-auto">
                    <input type="hidden" name="id" value="${detail.id}">
                    <input type="hidden" name="oldImage" value="${detail.image}">
                    <div>
                        <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-3">
                            <i class="fa-solid fa-layer-group text-blue-500"></i>Danh mục                    
                        </label>
                        <div class="grid grid-cols-2 md:grid-cols-5 gap-3">
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="1" class="peer hidden" ${cate1 ? 'checked' : ''}>
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 peer-checked:border-blue-500 peer-checked:bg-blue-50">
                                    <i class="fa-solid fa-user text-slate-700 mb-2"></i>
                                    <div class="text-sm font-semibold">Nam </div>
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="2" class="peer hidden" ${cate2 ? 'checked' : ''}>
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 peer-checked:border-pink-500 peer-checked:bg-pink-50">
                                    <i class="fa-solid fa-user text-pink-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Nữ</div>
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="3" class="peer hidden" ${cate3 ? 'checked' : ''}>     
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 peer-checked:border-emerald-500 peer-checked:bg-emerald-50">                                  
                                    <i class="fa-solid fa-star text-emerald-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Mới</div>                    
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" name="category_id" value="4"  class="peer hidden" ${cate4 ? 'checked' : ''}>
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 peer-checked:border-red-500 peer-checked:bg-red-50">                   
                                    <i class="fa-solid fa-fire text-red-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Hot</div>
                                </div>
                            </label>
                            <label class="cursor-pointer">
                                <input type="checkbox" id="editSaleCheck" name="category_id" value="5" onchange="toggleEditSalePrice()" class="peer hidden" ${cate5 ? 'checked' : ''}>
                                <div class="border rounded-2xl p-3 text-center transition-all border-slate-200 peer-checked:border-yellow-500 peer-checked:bg-yellow-50">
                                    <i class="fa-solid fa-tags text-yellow-500 mb-2"></i>
                                    <div class="text-sm font-semibold">Sale</div>
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-crown text-amber-500"></i>Thương hiệu
                            </label>
                            <select name="brand_id" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-blue-500">
                                <c:forEach items="${listb}" var="b">
                                    <option value="${b.id}" ${detail.brand == b.id ? 'selected' : ''}> ${b.bname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-watch-smart text-blue-500"></i>Tên sản phẩm       
                            </label>
                            <input type="text" name="name" value="${detail.name}" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-blue-500">  
                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 gap-4">
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-money-bill-wave text-emerald-500"></i>Giá gốc
                            </label>
                            <input type="number" name="price" value="${detail.price.intValue()}" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-blue-500">
                        </div>
                        <div>
                            <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">
                                <i class="fa-solid fa-percent text-red-500"></i>Giá giảm
                            </label>
                            <input type="number" id="editSaleInput" name="sale_price" value="${detail.sale_price.intValue()}" class="w-full border border-slate-300 rounded-2xl px-4 py-3 focus:outline-none focus:border-blue-500 ${cate5 ? '' : 'bg-slate-100'}" ${cate5 ? '' : 'readonly'}>
                        </div>
                    </div>
                    <div>
                        <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-3">
                            <i class="fa-solid fa-image text-cyan-500"></i>Ảnh sản phẩm
                        </label>
                        <div class="flex items-center gap-5">
                            <img src="${detail.image}"  class="w-28 h-28 object-cover rounded-2xl border shadow">                        
                            <input type="file" name="image" class="w-full text-sm">
                        </div>
                    </div>
                    <div>
                        <label class="flex items-center gap-2 text-sm font-bold text-slate-700 mb-2">

                            <i class="fa-solid fa-align-left text-slate-500"></i>Mô tả
                        </label>
                        <textarea name="description" rows="4" class="w-full border border-slate-300 rounded-2xl px-4 py-3 resize-none focus:outline-none focus:border-blue-500">${detail.description}</textarea>              
                    </div>
                    <button type="submit" class="w-full bg-blue-700 hover:bg-blue-800 transition text-white py-3 rounded-2xl font-bold shadow-lg">
                        <i class="fa-solid fa-floppy-disk mr-2"></i>Cập nhật sản phẩm
                    </button>
                </form>
            </div>
        </div>
    </c:if>
    <script>
        // Initialize Lucide Icons
        lucide.createIcons();
        function openDeleteModal(id) {
            const modal = document.getElementById("deleteModal");
            modal.classList.remove("hidden");
            modal.classList.add("flex");
            document.getElementById("confirmDeleteBtn").href = "delete?id=" + id;
            document.body.style.overflow = "hidden";
        }

        function closeDeleteModal() {
            const modal = document.getElementById("deleteModal");
            modal.classList.add("hidden");
            modal.classList.remove("flex");
            document.body.style.overflow = "auto";
        }

        document.getElementById("deleteModal").addEventListener("click", function(e) {
               
            if (e.target === this) {
                closeDeleteModal();
            }
        });
        function openModal() {
            const modal = document.getElementById("productModal");
            modal.classList.remove("hidden");
            modal.classList.add("flex");
            modal.scrollTop = 0;
            document.body.style.overflow = "hidden";
        }

        function closeModal() {
            const modal = document.getElementById("productModal");
            modal.classList.add("hidden");
            modal.classList.remove("flex");
            document.body.style.overflow = "auto";
        }

        function toggleSalePrice() {
            const check = document.getElementById("saleCheck");
            const input = document.getElementById("salePriceInput");

            if (check.checked) {
                input.readOnly = false;
                input.classList.remove("bg-slate-100");
            } else {
                input.readOnly = true;
                input.value = "";
                input.classList.add("bg-slate-100");
            }
        }

        // đóng modal add khi click nền đen
        document.getElementById("productModal").addEventListener("click", function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        // đóng modal edit khi click nền đen
        const editModal = document.getElementById("editModal");

        if (editModal) {
            editModal.addEventListener("click", function(e) {
                if (e.target === this) {
                    window.location = "ManagerProduct";
                }
            });
        }
        function toggleEditSalePrice() {
            const check = document.getElementById("editSaleCheck");
            const input = document.getElementById("editSaleInput");
            if (check.checked) {
                input.readOnly = false;
                input.classList.remove("bg-slate-100");
            } else {
                input.readOnly = true;
                input.value = 0;
                input.classList.add("bg-slate-100");
            }
        }
        function toggleManagerMenu() {
            const menu = document.getElementById("managerMenu");
            menu.classList.toggle("hidden");
        }
        // chạy khi mở modal
        window.onload = toggleEditSalePrice;
    </script>

</body>
</html>