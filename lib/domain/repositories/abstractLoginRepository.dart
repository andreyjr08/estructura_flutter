abstract class AbstractLoginRepository {

  Future<String> doLogin(String email, String password);
  
  Future<void> doLogout();
  
}