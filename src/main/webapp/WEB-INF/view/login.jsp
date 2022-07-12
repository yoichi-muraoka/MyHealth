<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>ログイン | My Health</title>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <div class="col-lg-4 offset-lg-4">
      <form action="" method="post">
      <h1 class="logo text-center mb-3 fw-normal">My Health</h1>
      
      <c:if test="${!empty error}">
      <div class="alert alert-danger" role="alert">
          メールアドレスまたはパスワードが間違っています。
      </div>
      </c:if>

      <div class="form-floating">
        <input type="text" name="email" class="form-control rounded-0 rounded-top" id="floatingInput" placeholder="メールアドレス">
        <label for="floatingInput">メールアドレス</label>
      </div>
      
      <div class="form-floating mb-3">
        <input type="password" name="pass" class="form-control border-top-0 rounded-0 rounded-bottom" id="floatingPassword" placeholder="パスワード">
        <label for="floatingPassword">パスワード</label>
      </div>

      <input class="w-100 btn btn-lg btn-primary mb-3" type="submit" value="ログイン">
      
      <a class="w-100 btn btn-lg btn-secondary mb-3" href="<%= request.getContextPath() %>/signup">新規登録</a>
      <p class="text-center text-muted">&copy; Somebody Somewhere</p>
      </form>
    </div>
  </div>
</div><!-- /.container -->
<c:import url="parts/commonJs.jsp" />
</body>
</html>