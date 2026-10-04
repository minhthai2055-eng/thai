<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Footer Scoping */
        .main-footer {
            background-color: #0f0f0f; /* Fallback color */
            background-color: var(--footer-bg, #0f0f0f);
            color: #a0a0a0; /* Fallback color */
            color: var(--footer-text, #a0a0a0);
            padding: 50px 3% 30px;
            font-family: 'Tenor Sans', sans-serif;
            border-top: 2px solid #9c824a;
            border-top-color: var(--gold-bright, #9c824a);
            margin-top: auto; /* Đẩy xuống đáy nếu dùng flexbox */
        }

        .footer-container {
            display: flex;
    justify-content: center;
    text-align: center;
        }

        .footer-section h4 {
            font-family: 'Tenor Sans', serif;
            color: #9c824a;
            color: var(--gold-bright, #9c824a);
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 25px;
            font-size: 1rem;
        }

        .footer-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-list li {
            margin-bottom: 15px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
        }

        .footer-list li i {
            color: var(--gold-bright, #9c824a);
            margin-right: 12px;
            width: 15px;
            text-align: center;
        }

        .footer-links a {
            color: inherit;
            text-decoration: none;
            transition: 0.3s ease;
        }

        .footer-links a:hover {
            color: #fff;
            padding-left: 8px;
        }
        @media (max-width: 992px) {
            .footer-container {
                grid-template-columns: 1fr 1fr;
            }
        }
        @media (max-width: 768px) {
            .footer-container {
                grid-template-columns: 1fr;
                text-align: center;
                gap: 40px;
            }
            .footer-list li {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <footer class="main-footer">
    <div class="footer-container">
            <!-- Đội ngũ -->
            <div class="footer-section">
                <h4>Đội ngũ phát triển</h4>
                <ul class="footer-list">
                    <li><i class="fas fa-user-tie"></i> Hai Mình Tao</li>
                </ul>
            </div>
    </footer>

</body>
</html>