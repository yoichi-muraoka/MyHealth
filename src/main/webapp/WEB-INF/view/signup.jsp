<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="parts/commonCss.jsp" />
<title>新規登録 | My Health</title>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <div class="col-lg-4 offset-lg-4">
      <form action="" method="post">
      <h1 class="logo text-center mb-3 fw-normal">My Health</h1>
      <h2 class="text-center">新規登録</h2>
      <c:if test="${!empty errors}">
      <div class="alert alert-danger" role="alert">
          <c:forEach items="${errors}" var="error" varStatus="vs">
            <c:out value="${error}" />
            <c:out value="${vs.last ? '' : '<br>'}" escapeXml="false" />
          </c:forEach>
      </div>
      </c:if>

      <div class="form-floating">
        <input type="text" value="<c:out value="${email}" />" name="email" class="form-control rounded-0 rounded-top" id="floatingInput" placeholder="メールアドレス">
        <label for="floatingInput">メールアドレス</label>
      </div>
      
      <div class="form-floating">
        <input type="password" name="pass" class="form-control border-top-0 rounded-0" id="floatingPassword" placeholder="パスワード">
        <label for="floatingPassword">パスワード</label>
      </div>

      <div class="form-floating mb-3">
        <input type="password" name="confPass" class="form-control border-top-0 rounded-0 rounded-bottom" id="floatingPassword2" placeholder="パスワード(確認用)">
        <label for="floatingPassword2">パスワード(確認用)</label>
      </div>

      <div class="form-floating">
        <input type="text" value="<c:out value="${name}" />" name="name" class="form-control rounded-0 rounded-top" id="floatingName" placeholder="名前">
        <label for="floatingName">名前</label>
      </div>

      <div class="form-floating mb-3">
        <input type="number" step="0.1" min="30" max="300" value="<c:out value="${height}" />" name="height" class="form-control border-top-0 rounded-0 rounded-bottom" id="floatingHeight" placeholder="身長">
        <label for="floatingHeight">身長(cm)</label>
      </div>

      <input class="w-100 btn btn-lg btn-primary mb-3" type="submit" value="登録">
      
      <a class="w-100 btn btn-lg btn-secondary mb-3" href="<%= request.getContextPath() %>/login">ログイン</a>
      <p class="text-center text-muted">&copy; Somebody Somewhere</p>
      </form>
    </div>
  </div>
</div><!-- /.container -->
<c:import url="parts/commonJs.jsp" />
</body>
</html>