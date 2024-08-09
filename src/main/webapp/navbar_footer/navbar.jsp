<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        /*폰트 설정*/
        @font-face {
            font-family: 'NanumSquareRound';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'MaplestoryOTFBold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        nav {
            width: 100%;
            height: 80px;
            font-family: 'NanumSquareRound', 'sans-serif';
            transition: background-color 0.3s, font-size 0.3s;
        }


        .navbar-collapse{
            display: flex;
            justify-content: flex-end;
            margin-right: 30px;


        }
        .nav-link.disabled, .nav-link:disabled {
            color: black;
            cursor: pointer;
            pointer-events: all;
        }

        .nav-item {
            padding-left: 60px;
            margin-left: 50px;
            margin-right: 20px;
        }

        .nav-link:hover {
            font-weight: bold;
        }

        .nav-link:active {
            font-weight: normal;
        }

        #nav {
            position: absolute;
            position: fixed;
            z-index: 1;
            background-color: transparent;
        }

        .navbar-brand {
            margin-left: 50px;
            font-family: 'MaplestoryOTFBold','sans-serif';
        }

        .navbar-nav {
            display: flex;
            align-items: center;

        }

        /* Style to be applied on scroll */
        .scrolled {
            font-size: 14px;
        }

        .scrolled .nav-link {
            font-size: 14px;
        }

        .scrolled .navbar-brand {
            font-size: 18px;
        }
    </style>
</head>
<body>

<!-- nav 바 시작-->
<nav class="navbar navbar-expand-lg bg-body-tertiary" id="nav">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><b>dailyEat</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">나의 기록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">마이페이지</a>
                </li>

                <li class="nav-item">
                    <button type="button" class="btn btn-primary btn-sm aria-disabled=true">로그인</button>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- nav 바 끝-->

<script>
    window.addEventListener('scroll', function () {
        var nav = document.getElementById('nav');
        if (window.scrollY > 50) {
            nav.classList.add('scrolled');
        } else {
            nav.classList.remove('scrolled');
        }
    });
</script>

</body>
</html>
