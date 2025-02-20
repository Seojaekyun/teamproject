<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 작성하기</title>
<style>
        /* 공통 스타일 정의 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        section header {
            background-color: #00467F;
            padding: 20px;
            text-align: center;
            color: white;
        }
        section header h1 {
            margin: 0;
            font-size: 24px;
        }
        section nav {
            background-color: #0059A3;
            padding: 10px;
            text-align: center;
        }
        section nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-size: 16px;
        }
        section nav a:hover {
            text-decoration: underline;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .content h2 {
            font-size: 22px;
            color: #00467F;
            margin-bottom: 10px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        form div {
            width: 100%;
            max-width: 500px;
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        select, input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }
        select:focus, input[type="text"]:focus, textarea:focus {
            border-color: #0059A3;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            max-width: 200px;
            padding: 10px;
            background-color: #00467F;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #003A66;
        }
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 10px;
            text-align: center;
        }
        
        /* 비회원 문의 확인 섹션 스타일 */
        .non-member-section {
            text-align: center;
            margin-bottom: 20px;
        }
        .non-member-section span {
            color: #23297A;
            cursor: pointer;
            text-decoration: underline;
        }
        .non-member-form {
            display: none;
            margin-top: 10px;
        }
        .non-member-form input[type="text"] {
            width: 80%;
            padding: 8px;
            margin-bottom: 10px;
        }
        .non-member-form input[type="submit"] {
            width: 50%;
            padding: 8px;
            background-color: #23297A;
        }
        .non-member-form input[type="submit"]:hover {
            background-color: #1A1F6B;
        }
        /* 반응형 디자인 */
        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }
            form div {
                max-width: 100%;
            }
            input[type="submit"] {
                max-width: 100%;
            }
        }
    </style>
    <script>
        function toggleNonMemberForm() {
            var form = document.getElementById("nonMemberForm");
            if (form.style.display === "none" || form.style.display === "") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>
</head>
<body> <!-- inquiry/write.jsp -->
    <section>
        <header>
            <h1>즐거운 여행 후기</h1>
        </header>

        <nav>
            <a href="../gongji/list">공지사항</a>
            <a href="../inquiry/list">Q ＆ A</a>
            <a href="">FAQ</a>
        </nav>
        
        <div class="container">
            <div class="content">
                <h2>작성하기</h2>
                <!-- 문의 작성 폼 -->
                <form method="post" action="writeOk" enctype="multipart/form-data">
                <input type="hidden" name="name" value="${userid}">
                    <div>
                        <label for="title">제목</label>
                        <input type="text" name="title" id="title" placeholder="제목을 입력하세요">
                    </div>
                    <div>
                        <label for="content">내용</label>
                        <textarea name="content" id="content" maxlength="400" placeholder="후기를 입력하세요" required></textarea>
                    </div>
                    <div class="flex-item">
						<label for="fname">파일 등록</label>
						<input type="file" id="fname" name="file">
					</div>
                    
                    <div>
                        <input type="submit" value="후기 등록">
                    </div>
                </form>
            </div>
        </div>

    </section>
</body>
</html>