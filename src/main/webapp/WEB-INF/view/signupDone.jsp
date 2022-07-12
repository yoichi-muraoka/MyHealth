<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>新規登録完了 | My Health</title>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <div class="col-lg-4 offset-lg-4">
      <form action="" method="post">
      <h1 class="logo text-center mb-3 fw-normal">My Health</h1>
      <h2 class="text-center">新規登録</h2>
      <div class="alert alert-success mb-3" role="alert">
          ご登録、ありがとうございました。<br>
          登録処理が完了しました。
      </div>
      <a class="w-100 btn btn-lg btn-primary mb-3" href="<%= request.getContextPath() %>/login">ログインページ</a>
      <p class="text-center text-muted">&copy; Somebody Somewhere</p>
      </form>
    </div>
  </div>
</div><!-- /.container -->
<c:import url="parts/commonJs.jsp" />
</body>
</html>