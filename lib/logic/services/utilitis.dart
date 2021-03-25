import 'dart:io';
import 'package:homeward/constant/get_api.dart';
import 'package:homeward/constant/get_token.dart';
import 'package:http/http.dart' as http;

///for restful api calls***


class UtilitiesService {
  String _apiEndPoint = getEnvAPI();


  ///post for login
  Future<http.Response> postWithParams(String api, dynamic params) async {
    String reqUrl = _apiEndPoint + api ;
    print(reqUrl);
    http.Response response;
    response = await http.post(
      reqUrl,
      body: params,
      headers: {},
    );
    // errorHandle(response);
    return response;
  }


  ///get the blogs
  Future<http.Response> getWithParams(
      String api, Map<String, dynamic> params) async {
    String reqUrl = _apiEndPoint + api + "?";
    params.forEach((key, val) {
      if (val != null) {
        reqUrl += key + "=" + val + '&';
      }
    });
    http.Response response;
    print(reqUrl);
    if (await getToken('login') != null && await getToken('login') != '') {
      response = await http.get(
        reqUrl,
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + await getToken('login')
        },
      );
    } else {
      response = await http.get(
        reqUrl,
        headers: {},
      );
    }
    print('the request url');
    print(reqUrl);
    // errorHandle(response);
    print(response.body);
    return response;
  }



}