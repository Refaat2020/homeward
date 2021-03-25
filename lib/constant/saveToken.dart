import 'package:shared_preferences/shared_preferences.dart';

///for save token
saveCurrentLogin(String token) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString('token', token);
  return true;

}
