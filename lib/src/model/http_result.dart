class HttpResult {
  bool isSuccess;
  int statusCode;
  var result;

  HttpResult({
    required this.isSuccess,
    required  this.statusCode,
    required  this.result,
  });
}
