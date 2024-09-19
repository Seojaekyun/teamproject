<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공사 웹사이트</title>

<!-- Swiper.js CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- Font Awesome CDN for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

section {
    width: 1000px;
    max-width: 90%;
    margin: auto;
    padding: 50px 0;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

section.visible {
    opacity: 1;
    transform: translateY(0);
}

.home-banner {
    width: 100%;
    margin: auto;
    padding-bottom: 100px;
    padding-top: 100px;
    position: relative;
    background: url('banner-image.jpg') no-repeat center center;
    background-size: cover;
    display: flex;
    align-items: center;
    justify-content: center;
}

.search-box {
    width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: rgba(255, 255, 255, 0.9);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.search-box h3 {
    text-align: center;
    margin-bottom: 20px;
}

.search-box div {
    margin-bottom: 10px;
}

.search-box label {
    display: block;
    margin-bottom: 5px;
    font-size: 14px;
}

.search-box input, .search-box select {
    width: 100%;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.search-box button {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.search-box button:hover {
    background-color: #45a049;
    transform: translateY(-2px);
}

.sec2 {
    background: #E0F2F1;
    margin: auto;
}

.sec2 h2 {
    text-align: center;
    margin-bottom: 40px;
    color: #00796B;
}

.sec2 .features {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.sec2 .feature {
    width: 30%;
    background: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.sec2 .feature:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.sec2 .feature i {
    font-size: 40px;
    color: #00796B;
    margin-bottom: 15px;
}

.sec2 .feature h4 {
    margin-bottom: 10px;
    color: #004D40;
}

.sec2 .feature p {
    font-size: 14px;
    color: #555;
}

.sec3 {
    background: #EDE7F6;
    margin: auto;
    overflow: hidden; /* 오버플로우 숨김 추가 */
}

.sec3 h2 {
    text-align: center;
    margin-bottom: 40px;
    color: #5E35B1;
}

.sec3 .testimonials {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.sec3 .testimonial {
    width: 100%;
    background: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.sec3 .testimonial:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.sec3 .testimonial p {
    font-style: italic;
    margin-bottom: 10px;
    color: #333;
}

.sec3 .testimonial .author {
    text-align: right;
    font-weight: bold;
    color: #5E35B1;
}

.sec4 {
    background: #FFF3E0;
    margin: auto;
}

.sec4 h2 {
    text-align: center;
    margin-bottom: 40px;
    color: #F57C00;
}

.sec4 .promotions {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.sec4 .promotion {
    width: 100%;
    background: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.sec4 .promotion:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.sec4 .promotion img {
    width: 80px;
    height: 80px;
    margin-bottom: 15px;
}

.sec4 .promotion h4 {
    margin-bottom: 10px;
    color: #E65100;
}

.sec4 .promotion p {
    font-size: 14px;
    color: #555;
}

.footer {
    background: #333;
    color: white;
    text-align: center;
    padding: 20px 0;
}

.footer a {
    color: #4CAF50;
    text-decoration: none;
}

@media (max-width: 768px) {
    .sec2 .features, .sec3 .testimonials, .sec4 .promotions {
        flex-direction: column;
        align-items: center;
    }

    .sec2 .feature, .sec3 .testimonial, .sec4 .promotion {
        width: 100%;
    }

    section {
        width: 95%;
        padding: 30px 0;
    }

    .search-box {
        width: 90%;
    }
}

/* Swiper Custom Styles */
.swiper-container {
    width: 100%;
    padding: 20px 0;
}

.swiper-slide {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.swiper-slide p {
    font-style: italic;
    color: #333;
}

.swiper-slide .author {
    text-align: right;
    font-weight: bold;
    color: #5E35B1;
}

.swiper-pagination-bullet-active {
    background: #5E35B1 !important;
}
</style>

<!-- Swiper.js JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>
<body>

    <!-- Home Banner Section -->
    <section id="container" class="home-banner">
        <form method="post" action="flightSearch">
            <div class="search-box">
                <h3>항공기 검색</h3>
                
                <div>
                    <label for="departure">출발지</label>
                    <input type="text" id="departure" name="departure" placeholder="출발지 입력" required>
                </div>
                
                <div>
                    <label for="arrival">도착지</label>
                    <input type="text" id="arrival" name="arrival" placeholder="도착지 입력" required>
                </div>
                
                <div>
                    <label for="departure-date">출발일</label>
                    <input type="date" id="departure-date" name="departure-date" required>
                </div>
                
                <div>
                    <label for="arrival-date">도착일</label>
                    <input type="date" id="arrival-date" name="arrival-date" required>
                </div>
                
                <button type="submit">항공기 검색</button>
            </div>
        </form>
    </section>
    
    <!-- sec2: 서비스 및 혜택 -->
    <section id="sec2" class="sec2">
        <h2>우리의 서비스 및 혜택</h2>
        <div class="features">
            <div class="feature">
                <i class="fas fa-calendar-check"></i>
                <h4>편리한 예약</h4>
                <p>간편한 온라인 예약 시스템으로 빠르게 항공권을 예매하세요.</p>
            </div>
            <div class="feature">
                <i class="fas fa-shield-alt"></i>
                <h4>안전한 비행</h4>
                <p>최신 항공기와 전문 승무원이 안전한 비행을 보장합니다.</p>
            </div>
            <div class="feature">
                <i class="fas fa-headset"></i>
                <h4>우수한 고객 서비스</h4>
                <p>24시간 고객 지원으로 언제든지 도움을 받을 수 있습니다.</p>
            </div>
            <div class="feature">
                <i class="fas fa-plane"></i>
                <h4>다양한 노선</h4>
                <p>전 세계 다양한 목적지로 직항 및 환승 항공편을 제공합니다.</p>
            </div>
            <div class="feature">
                <i class="fas fa-wallet"></i>
                <h4>합리적인 가격</h4>
                <p>경쟁력 있는 가격으로 최고의 가치를 제공합니다.</p>
            </div>
            <div class="feature">
                <i class="fas fa-umbrella-beach"></i>
                <h4>특별 프로모션</h4>
                <p>정기적으로 업데이트되는 특별 할인 및 프로모션을 이용해보세요.</p>
            </div>
        </div>
    </section>
    
    <!-- sec3: 고객 후기 -->
    <section id="sec3" class="sec3">
        <h2>고객 후기</h2>
        <!-- Swiper -->
        <div class="swiper-container testimonials-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide testimonial">
                    <p>"항상 만족스러운 서비스와 편안한 비행 경험을 제공합니다."</p>
                    <div class="author">- 김민수</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"친절한 직원들과 깨끗한 기내가 인상적이었습니다."</p>
                    <div class="author">- 이지은</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"온라인 예약이 정말 쉬웠고, 비행기 시간도 정확했습니다."</p>
                    <div class="author">- 박준영</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"특별한 프로모션 덕분에 저렴하게 항공권을 구매할 수 있었습니다."</p>
                    <div class="author">- 최은지</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"항공사 직원들의 세심한 배려가 인상적이었습니다. 다시 이용하고 싶어요."</p>
                    <div class="author">- 송지훈</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"비행기 내 엔터테인먼트 시스템이 훌륭해서 긴 비행도 지루하지 않았습니다."</p>
                    <div class="author">- 한지민</div>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Navigation -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </section>
    
    <!-- sec4: 특별 프로모션 -->
    <section id="sec4" class="sec4">
        <h2>특별 프로모션</h2>
        <!-- Swiper -->
        <div class="swiper-container promotions-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide promotion">
                    <img src="promo1.png" alt="봄맞이 할인">
                    <h4>봄맞이 할인</h4>
                    <p>봄철 여행을 위한 특별 할인 항공권을 만나보세요!</p>
                </div>
                <div class="swiper-slide promotion">
                    <img src="promo2.png" alt="가족 여행 패키지">
                    <h4>가족 여행 패키지</h4>
                    <p>가족과 함께하는 편안한 여행을 위한 패키지 상품.</p>
                </div>
                <div class="swiper-slide promotion">
                    <img src="promo3.png" alt="조기 예약 혜택">
                    <h4>조기 예약 혜택</h4>
                    <p>조기 예약 시 추가 할인 및 혜택을 제공합니다.</p>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Navigation -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </section>
    
    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 항공사. 모든 권리 보유.</p>
        <p>
            <a href="#">개인정보 처리방침</a> | 
            <a href="#">이용 약관</a> | 
            <a href="#">고객 지원</a>
        </p>
    </footer>

    <!-- Swiper.js Initialization -->
    <script>
    // Initialize Swiper for Testimonials
    var testimonialsSwiper = new Swiper('.testimonials-swiper', {
        loop: true,
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.testimonials-swiper .swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.testimonials-swiper .swiper-button-next',
            prevEl: '.testimonials-swiper .swiper-button-prev',
        },
    });

    // Initialize Swiper for Promotions
    var promotionsSwiper = new Swiper('.promotions-swiper', {
        loop: true,
        autoplay: {
            delay: 7000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.promotions-swiper .swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.promotions-swiper .swiper-button-next',
            prevEl: '.promotions-swiper .swiper-button-prev',
        },
        slidesPerView: 1,
        spaceBetween: 20,
        breakpoints: {
            640: {
                slidesPerView: 2,
            },
            1024: {
                slidesPerView: 3,
            },
        },
    });

    // Intersection Observer for Fade-in Animation
    document.addEventListener('DOMContentLoaded', function() {
        const sections = document.querySelectorAll('section');
        const options = {
            threshold: 0.1
        };

        const observer = new IntersectionObserver(function(entries, observer) {
            entries.forEach(entry => {
                if(entry.isIntersecting){
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, options);

        sections.forEach(section => {
            observer.observe(section);
        });
    });
    </script>

</body>
</html>
