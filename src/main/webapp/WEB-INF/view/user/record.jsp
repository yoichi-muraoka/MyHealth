<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:import url="../parts/commonCss.jsp" />
<title>日々の記録 | My Health</title>
</head>
<body>
  <c:import url="navbar.jsp" />

  <div class="container mt-3">
    <h1 class="mb-4 d-inline-block">日々の記録</h1>
    <a class="btn btn-success mb-4 mt-2 ms-4" href="<%= request.getContextPath() %>/user/addRecord">記録を付ける</a>
    <div class="row">
      <ul id="display-toggler" class="nav nav-pills mb-3">
        <li class="nav-item">
          <a class="nav-link active" href="#table-view">テーブル表示</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#weight-view">体重の変遷</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#exercise-view">運動の内訳</a>
        </li>
      </ul>

      <div id="table-view" class="toggle-display col-12">
        <table class="table table-bordered table-hover">
          <thead id="record-head">
            <tr class="bg-light">
              <th>日付</th>
              <th>体重</th>
              <th>ウォーク</th>
              <th>ジョギング</th>
              <th>プール</th>
              <th>筋トレ</th>
              <th>球技</th>
              <th>その他</th>
              <th>情報の編集</th>
            </tr>
          </thead>
          <tbody id="record-body">
            <c:if test="${empty records}">
            <tr>
              <td colspan="9">記録はありません</td>
            </tr>
            </c:if>
            
            <c:forEach items="${records}" var="record">
            <tr class="align-middle">
              <td><fmt:formatDate value="${record.registered}" pattern="y-MM-dd" /></td>
              <td><c:out value="${record.weight}" /></td>
              <td><c:out value="${record.walk}" /></td>
              <td><c:out value="${record.jogging}" /></td>
              <td><c:out value="${record.pool}" /></td>
              <td><c:out value="${record.training}" /></td>
              <td><c:out value="${record.ball}" /></td>
              <td><c:out value="${record.other}" /></td>
              <td>
                <a class="btn btn-warning" href="<%= request.getContextPath() %>/user/editRecord?id=<c:out value="${record.id}" />">変更</a>
                <button class="btn btn-danger delete" data-bs-toggle="modal" data-bs-target="#deleteModal" data-href="<%= request.getContextPath() %>/user/deleteRecord?id=<c:out value="${record.id}" />">削除</button>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div><!-- /.col テーブル -->
      <div id="weight-view" class="toggle-display hide">
        <canvas id="weight-chart"></canvas>
      </div>
      <div id="exercise-view" class="toggle-display hide col-md-8 offset-md-2">
        <canvas id="exercise-chart"></canvas>
      </div>
    </div><!-- /.row -->
  </div><!-- /.container -->
  
  <!-- 削除用モーダル -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel">記録の削除</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>「<span id="modal-date"></span>」の記録を削除します。よろしいですか？</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">キャンセル</button>
          <a id="delete-link" class="btn btn-danger" href="">削除する</a>
        </div>
      </div>
    </div>
  </div>

<c:import url="../parts/commonJs.jsp" />
<script src="<%= request.getContextPath() %>/js/chart-3.8.0.min.js"></script>
<script>
  // 削除ボタン
  $(document).ready(function() {
    $('button.delete').click(function() {
      const date = $(this).parent().parent().children('td:first-child').text();
      $('#delete-link').attr('href', $(this).attr('data-href'));
      $('#modal-date').text(date);
    });
  });
</script>
<script>
  // 体重変遷グラフ表示
  function createWeightGraph() {
    // 日付と体重の取得
    const weightLabels = [];
    const weightList = [];
    $('#record-body > tr').each(function() {
      weightLabels.push($(this).children('td:nth-child(1)').text().split('-')[2]);
      weightList.push(parseFloat($(this).children('td:nth-child(2)').text()));
    });

    const weightData = {
    labels: weightLabels.reverse(),
    datasets: [{
        label: '体重の変遷',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: weightList.reverse(),
      }]
    };

    const weightConfig = {
      type: 'line',
      data: weightData,
      options: {}
    };

    window.weightChart = new Chart(
      document.getElementById('weight-chart'),
      weightConfig
    );
  }
</script>
<script>
  // 運動の内訳グラフの表示
  function createExerciseGraph() {
    // 運動項目の取得
    const exerciseLabels = [];
    $('#record-head th:nth-child(n + 3):nth-child(-n + 8)').each(function() {
      exerciseLabels.push($(this).text());
    });
    
    // 各項目の合計値
    const exerciseAmount = [0, 0, 0, 0, 0, 0];
    $('#record-body tr').each(function() {
      let i = 0;
      $(this).children('td:nth-child(n + 3):nth-child(-n + 8)').each(function() {
        exerciseAmount[i] += parseFloat($(this).text());
        i++;
      });
    });

    const data = {
      labels: exerciseLabels,
      datasets: [{
        label: 'My First Dataset',
        data: exerciseAmount,
        backgroundColor: [
          '#845EC2',
          '#FF6F91',
          '#FFC75F',
          '#D65DB1',
          '#FF9671',
          '#F9F871'
        ],
        hoverOffset: 4
      }]
    };

    const config = {
      type: 'doughnut',
      data: data,
    };

    window.exerciseChart = new Chart(
      document.getElementById('exercise-chart'),
      config
    );
  }
</script>
<script>
  // 表示項目の切り替え
  $(document).ready(function() {
    $('#display-toggler .nav-link').click(function() {
      $('#display-toggler .nav-link').removeClass('active');
      $(this).addClass('active');
      $('.toggle-display').hide();

      const showingElementId = $(this).attr('href');
      $(showingElementId).show(0,'', function() {
        if(showingElementId === '#weight-view') {
          if (typeof weightChart !== 'undefined' && weightChart) {
            weightChart.destroy();
          }
          createWeightGraph();
        }
        else if(showingElementId === '#exercise-view') {
          if (typeof exerciseChart !== 'undefined' && exerciseChart) {
            exerciseChart.destroy();
          }
          createExerciseGraph();
        }
      });
      return false;
    });
  });
</script>
</body>
</html>