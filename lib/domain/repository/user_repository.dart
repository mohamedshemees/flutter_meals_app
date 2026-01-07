abstract class UserRepository {
  Future<bool>isFirstTime();
  Future<String> getUserName();
  void setUserName(String userName);
}
