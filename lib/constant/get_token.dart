import 'package:shared_preferences/shared_preferences.dart';

///for get the token
getToken(String type) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("token")??'';
}