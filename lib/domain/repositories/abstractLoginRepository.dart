abstract class AbstractLoginRepository {

  Future<String> doLogin(String username, String password);
  
  Future<void> doLogout();
  
}