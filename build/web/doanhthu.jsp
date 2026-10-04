<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDA Luxury - Quản trị Doanh thu</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap&subset=vietnamese" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
        }
        .admin-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            border: 1px solid #f1f1f1;
        }

        .stat-icon {
            width: 45px;
            height: 45px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fff4d6;
            color: #b7791f;
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
    </style>
</head>
<body class="flex min-h-screen">
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
                    <a href="ManagerProduct" class="nav-item">
                        <i data-lucide="package" class="w-4 h-4 shrink-0"></i>
                        <span class="nav-text text-sm">Quản Lý Sản Phẩm</span>
                    </a>
                    <a href="revenue" class="nav-item active">
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

    <main class="ml-[260px] flex-1 p-8">
        <div class="max-w-7xl mx-auto">
            
            <header class="mb-8">
                <h1 class="text-2xl font-bold text-gray-800">Thống Kê Doanh Thu Cửa Hàng</h1>
                <p class="text-gray-500 text-sm">Phân tích hiệu suất kinh doanh các thương hiệu cao cấp</p>
            </header>

            <!-- Thống kê nhanh -->
            <div class="grid grid-cols-3 gap-6 mb-8">
                <div class="admin-card p-6 flex items-center gap-4">
                    <div class="stat-icon"><i class="fa-solid fa-receipt text-xl"></i></div>
                    <div>
                        <p class="text-xs text-gray-400 font-bold uppercase">Tổng đơn hàng</p>
                        <h3 class="text-2xl font-bold text-gray-800">${totalOrders}</h3>
                    </div>
                </div>
                <div class="admin-card p-6 flex items-center gap-4">
                    <div class="stat-icon"><i class="fa-solid fa-coins text-xl"></i></div>
                    <div>
                        <p class="text-xs text-gray-400 font-bold uppercase">Tổng doanh thu</p>
                        <h3 class="text-2xl font-bold text-gray-800"><fmt:formatNumber value="${revenue}" type="number"/>VNĐ</h3>
                    </div>
                </div>
                <div class="admin-card p-6 flex items-center gap-4">
                    <div class="stat-icon"><i class="fa-solid fa-award text-xl"></i></div>
                    <div>
                        <p class="text-xs text-gray-400 font-bold uppercase">Thương hiệu chủ đạo</p>
                        <h3 class="text-2xl font-bold text-gray-800">${topBrand}</h3>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ -->
            <div class="grid grid-cols-12 gap-6">
                <!-- Biểu đồ cột -->
                <div class="col-span-8 admin-card p-8">
                    <div class="flex items-center justify-between mb-6">
                        <h4 class="font-bold text-gray-800 uppercase text-sm tracking-wide">Doanh thu theo thương hiệu</h4>
                        <div class="flex items-center gap-2 text-xs text-gray-400">
                            <span class="w-2 h-2 rounded-full bg-yellow-500"></span> Đơn vị: VNĐ
                        </div>
                    </div>
                    <div class="h-[450px]">
                        <canvas id="salesChart"></canvas>
                    </div>
                </div>
                <div class="col-span-4 admin-card p-8">
                    <h4 class="font-bold text-gray-800 uppercase text-sm tracking-wide mb-6">Tỉ lệ chiếm lĩnh thị phần </h4>
                    <div class="space-y-6">
                        <c:set var="totalRevenueBrand" value="0" />
                        <c:forEach items="${brandRevenue}" var="b" >
                            <c:set var="totalRevenueBrand" value="${totalRevenueBrand + b.revenue}" />  
                        </c:forEach>
                        <c:forEach items="${brandRevenue}" var="b" varStatus="loop">
                            <c:set var="percent" value="${(b.revenue * 100) / totalRevenueBrand}" />
                            <div>
                                <div class="flex justify-between text-xs font-bold mb-2">
                                    <span>${b.brandName}</span>
                                    <span><fmt:formatNumber value="${percent}" maxFractionDigits="0"/>%</span>
                                </div>
                                <div class="w-full bg-gray-100 h-2 rounded-full overflow-hidden">
                                    <div class="
                                        ${loop.index == 0 ? 'bg-yellow-500' : ''}
                                        ${loop.index == 1 ? 'bg-indigo-500' : ''}
                                        ${loop.index == 2 ? 'bg-green-500' : ''}
                                        ${loop.index == 3 ? 'bg-red-500' : ''}
                                        ${loop.index == 4 ? 'bg-orange-500' : ''}
                                        ${loop.index == 5 ? 'bg-cyan-500' : ''}
                                        ${loop.index == 6 ? 'bg-purple-500' : ''}
                                        h-full"
                                        style="width: ${percent}%">
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        lucide.createIcons();
        const labels = [];
        const revenues = [];
        <c:forEach items="${brandRevenue}" var="b">
            labels.push("${b.brandName}");
            revenues.push(Number("${b.revenue}"));
        </c:forEach>
            
        console.log(labels);
        console.log(revenues);

        const ctx = document.getElementById('salesChart');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Doanh thu',
                    data: revenues,
                    backgroundColor: [
                        '#d69e2e',
                        '#4f46e5',
                        '#10b981',
                        '#ef4444',
                        '#f59e0b',
                        '#06b6d4',
                        '#8b5cf6'
                    ],
                    hoverBackgroundColor: [
                        '#b7791f',
                        '#4338ca',
                        '#059669',
                        '#dc2626',
                        '#d97706',
                        '#0891b2',
                        '#7c3aed'
                    ],
                    borderRadius: 8,
                    barThickness: 45
                }]
            },

            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.raw.toLocaleString('vi-VN') + ' VNĐ';
                            }
                        }
                    }
                },

                scales: {
                   y: {
                        beginAtZero: true,
                        max: Math.max(...revenues) * 1.1,
                        grid: {
                            color: '#f1f1f1'
                        },

                        ticks: {
                            callback: function(value) {
                                if (value >= 1000000000) {
                                    return (value / 1000000000).toFixed(0) + ' TỶ';
                                }
                                if (value >= 1000000) {
                                    return (value / 1000000).toFixed(0) + ' TR';
                                }
                                return value;
                            },
                            color: '#a0aec0'
                        }
                    }
                }
            }
        });
        function toggleManagerMenu() {
            const menu = document.getElementById("managerMenu");
            menu.classList.toggle("hidden");
        }
    </script>
</body>
</html>