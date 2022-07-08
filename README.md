# プロジェクト概要
- JSP/Servlet/JDBC/JavaScript学習用
- ユーザーの日々の体重、運動を記録するアプリ
- 記録された体重、及び運動の記録はグラフ表示することが可能

# ページ構成
| ページ           | URL                | Servlet           | JSP |
| ---              | ---                | ---               | --- |
| ログイン         | /login             | LoginServlet      | login.jsp |
| ユーザー登録     | /signup            | SignupServlet     | signup.jsp |
| ログアウト       | /logout            | LogoutServlet     | - |
| ユーザー基本情報 | /user/base         | BaseServlet       | user/base.jsp |
| 日々の記録表示   | /user/showRecord   | ShowRecordServlet | user/record.jsp |
| 日々の記録追加   | /user/addRecord    | AddRecordServlet  | user/saveRecord.jsp |
| 日々の記録編集   | /user/editRecord   | EditRecordServlet | user/saveRecord.jsp |
| 日々の記録削除   | /user/deleteRecord | DeleteRecordServlet | - |