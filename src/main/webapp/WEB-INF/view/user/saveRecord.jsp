<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="../parts/commonCss.jsp" />
<title><c:out value="${title}" /> | My Health</title>
</head>
<body>
  <c:import url="navbar.jsp" />

  <div class="container mt-3">
    <h1 class="mb-4"><c:out value="${title}" /></h1>
    <form action="" method="post">
    <div class="row">
        <div class="col-12 mb-3">体重: <input name="weight" type="number" value="<c:out value="${record.weight}" />" step="0.1" min="1" max="300"> kg</div>
        <div class="col-6 col-md-4 col-xl-2 mb-3">ウォーク: <input name="walk" type="number" value="<c:out value="${record.walk}" />" step="1" min="0" max="600"> 分</div>
        <div class="col-6 col-md-4 col-xl-2 mb-3">ジョギング: <input name="jogging" type="number" value="<c:out value="${record.walk}" />" step="1" min="0" max="600"> 分</div>
        <div class="col-6 col-md-4 col-xl-2 mb-3">プール: <input name="pool" type="number" value="<c:out value="${record.pool}" />" step="1" min="0" max="600"> 分</div>
        <div class="col-6 col-md-4 col-xl-2 mb-3">筋トレ: <input name="training" type="number" value="<c:out value="${record.training}" />" step="1" min="0" max="600"> 分</div>
        <div class="col-6 col-md-4 col-xl-2 mb-3">球技: <input name="ball" type="number" value="<c:out value="${record.ball}" />" step="1" min="0" max="600"> 分</div>
        <div class="col-6 col-md-4 col-xl-2 mb-3">その他: <input name="other" type="number" value="<c:out value="${record.other}" />" step="1" min="0" max="600"> 分</div>
        <div>
          <input name="id" type="hidden" value="<c:out value="${record.id}" />">
          <input name="user_id" type="hidden" value="<c:out value="${record.userId}" />">
          <input class="btn btn-primary" type="submit" value="保存">
          <a class="ms-2 btn btn-secondary" href="<%= request.getContextPath() %>/user/showRecord">キャンセル</a>
        </div>
      </div><!-- /.row -->
    </form>
  </div><!-- /.container -->

<c:import url="../parts/commonJs.jsp" />
</body>
</html>