import 'dart:convert';

import 'package:get/get.dart';
import 'package:structured_todo/config/routes/endpoint_config.dart';
import 'package:structured_todo/models/http/json_response.dart';
import 'package:http/http.dart' as http;
import 'package:structured_todo/services/token_storage_services.dart';
import 'package:structured_todo/utils/shared_pref.dart';

import 'endpoint_services.dart';

class APIService extends GetxService {
  static final client = http.Client();

  static makeJSONResponse(response) {
    JSONResponse r = new JSONResponse.fromJson(jsonDecode(response.body));
    return r;
  }

  static formatRequestHeaders(authenticationRequired) async {
    Map<String, String> _headers = {
      "Content-Type": "application/json",
      "accept": "application/json",
      // "Authorization": SharedPrefs.to.obs.toString(),
    };

    if (authenticationRequired == true) {
      if (TokenStorageService.to.getToken() != null) {
        _headers
            .addAll({"Authorization": "${TokenStorageService.to.getToken()}"});
      }
    }
    return _headers;
  }

  static get(path, {queryParameters, authenticationRequired}) async {
    Map<String, String> _headers =
    await formatRequestHeaders(authenticationRequired);
    print(
        EndpointService.to.getPrefixedUri(path, queryParameters));
    print("111111112222222222344444444");
    print(_headers);
    final response = await client.get(
      EndpointService.to.getPrefixedUri(path, queryParameters),
      headers: _headers,
    );
    print(response);
    print("error 1");
    return makeJSONResponse(response);
  }

  static post(path, body, {queryParameters, authenticationRequired}) async {
    Map<String, String> _headers =
    await formatRequestHeaders(authenticationRequired);
    String _body = jsonEncode(body);

    final response = await client.post(
      EndpointService.to.getPrefixedUri(path, queryParameters),
      body: _body,
      headers: _headers,
    );
    print(response.body);
    return makeJSONResponse(response);
  }

  static put(path, body,
      {queryParameters, authenticationRequired = true}) async {
    Map<String, String> _headers =
    await formatRequestHeaders(authenticationRequired);
    String _body = jsonEncode(body);
    final response = await client.put(
      EndpointService.to.getPrefixedUri(path, queryParameters),
      body: _body,
      headers: _headers,
    );
    print(response.body);
    return makeJSONResponse(response);
  }

  static delete(path, {queryParameters, authenticationRequired = true}) async {
    Map<String, String> _headers =
    await formatRequestHeaders(authenticationRequired);
    final response = await client.delete(
      EndpointService.to.getPrefixedUri(path, queryParameters),
      headers: _headers,
    );
    return makeJSONResponse(response);
  }
}

