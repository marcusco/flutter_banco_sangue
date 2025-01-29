class ApiBase {
  static const url_base = "http://192.168.18.150:8080/";
  static const api_key = "DFDFDFDFDF";
  static const token = "xxxxxxx";
  Map<String, String> queryParameters = {
    'token' : ApiBase.token,
    'api_key': ApiBase.api_key,
    'Content-type': 'application/json',
    'Accept': 'application/json;charset=UTF-8',
  };
}