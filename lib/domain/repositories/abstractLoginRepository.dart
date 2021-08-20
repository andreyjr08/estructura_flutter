abstract class AbstractLoginRepository {

  Future<String> doLogin({required String username, required String password});
  
  Future<void> doLogout();
  
}