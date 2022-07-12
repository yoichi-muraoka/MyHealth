<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="../parts/commonCss.jsp" />
<title>My Health</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="logo navbar-brand" href="<%= request.getContextPath() %>/user/base">My Health</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <svg class="mb-1" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
              </svg>
              <c:out value="${user.name}" /> さん
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="<%= request.getContextPath() %>/user/base">基本情報</a></li>
              <li><a class="dropdown-item" href="<%= request.getContextPath() %>/logout">ログアウト</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div><!-- /.container -->
  </nav>

  <div class="container mt-3">
    <h1 class="h2">基本情報</h1>
    <div class="row">
      <div class="col-md-6">
        <table class="table table-bordered">
          <tr class="align-middle">
            <th>身長</th>
            <td><span id="current-height">${user.height}</span>cm 
              <button class="btn btn-warning ms-4" data-bs-toggle="modal" data-bs-target="#heightModal" id="change-height">変更</button></td>
          </tr>
          <tr>
            <th>体重</th>
            <td>
              <c:choose>
                <c:when test="${!empty weight}">
                  <c:out value="${weight}" /> kg
                </c:when>
                <c:otherwise>
                  記録なし                
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
          <tr>
            <th>BMI</th>
            <td><c:choose>
                <c:when test="${!empty bmi}">
                  <c:out value="${bmi}" /> (<c:out value="${bmiMessage}" /> )
                </c:when>
                <c:otherwise>
                  <c:out value="${bmiMessage}" />              
                </c:otherwise>
              </c:choose></td>
          </tr>
        </table>
        <a class="btn btn-primary" href="record.html">日々の記録</a>
      </div>
    </div>
  </div><!-- /.container -->
  
  <!-- 身長変更用モーダル -->
  <div class="modal fade" id="heightModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel">身長の変更</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="form" action="" method="post">
            <p>現在の身長: <span id="modal-current-height"></span>cm</p>
            <p>変更後の身長: <input id="modal-new-height" type="number" step="0.1" min="30" max="300"> cm</p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">キャンセル</button>
          <button type="button" class="btn btn-danger" id="change">変更する</button>
        </div>
      </div>
    </div>
  </div>
<c:import url="../parts/commonJs.jsp" />
<script>
  // 身長変更用モーダル
  $(document).ready(function() {
    const currentHeight = parseFloat($('#current-height').text());
    $('#modal-current-height').text(currentHeight);
    $('#modal-new-height').val(currentHeight);

    $('#change').click(function() {
      $('#form').submit();
    });
  });
</script>
</body>
</html>