class JSONResponse {
  JSONResponse({this.code, this.msg, this.data, this.meta});
  final dynamic code;
  final dynamic msg;
  final dynamic data;
  final dynamic meta;

  Map<String, dynamic> toJson() => {
    "code" : code,
    "msg" : msg,
    "data" : data,
    "meta" : meta,
  };

  factory JSONResponse.fromJson(Map<String, dynamic> json) => JSONResponse(
    code: json["code"],
    msg: json["msg"],
    data: json["data"],
    meta: json["meta"],
  );
}