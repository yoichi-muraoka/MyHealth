package dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DaoFactory {

  public static UserDao createUserDao() {
    return new UserDaoImpl(getDataSource());
  }

  private static DataSource getDataSource() {
    InitialContext ctx = null;
    DataSource ds = null;
    try {
      ctx = new InitialContext();
      ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myhealth_db");
    } catch (NamingException e) {
      if (ctx != null) {
        try {
          ctx.close();
        } catch (NamingException e1) {
          throw new RuntimeException(e1);
        }
      }
      throw new RuntimeException(e);
    }
    return ds;
  }
}
