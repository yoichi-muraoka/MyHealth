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
  <c:import url="navbar.jsp" />

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
        <a class="btn btn-primary" href="<%= request.getContextPath() %>/user/showRecord">日々の記録</a>
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
            <p>変更後の身長: <input id="modal-new-height" type="number" name="height" step="0.1" min="30" max="300"> cm</p>
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