class ApiBase {
  static const url_base = "http://localhost:8080/";
  static const api_key = "DFDFDFDFDF";
  static const token = "xxxxxxx";
  Map<String, String> queryParameters = {
    'token' : ApiBase.token,
    'api_key': ApiBase.api_key
  };
}