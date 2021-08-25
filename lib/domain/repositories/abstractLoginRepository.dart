abstract class AbstractLoginRepository {

  Future<void> doLogin(String email, String password);
  
  Future<void> doLogout();
  
}