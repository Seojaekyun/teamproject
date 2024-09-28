<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 통계</title>
    <!-- Chart.js 버전 2.9.4 사용 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4"></script>
    <style>
        canvas {
            display: block;
            width: 100% !important;
            height: 400px !important;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h2>일자별 예약 현황</h2>
    <canvas id="reservationChart" width="400" height="200"></canvas>

    <script>
        window.onload = function() {
            var ctx = document.getElementById('reservationChart').getContext('2d');
            var testChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['2024-09-01', '2024-09-02', '2024-09-03'],
                    datasets: [{
                        label: '테스트 데이터',
                        data: [1, 2, 3],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{  // Chart.js 2.x에서는 'yAxes' 사용
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        };
    </script>
</body>
</html>
