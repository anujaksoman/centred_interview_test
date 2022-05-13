import 'dart:convert';
import 'package:centered_interview_test/utils/nothing.dart';
import 'package:centered_interview_test/utils/request_type.dart';
import 'package:centered_interview_test/utils/request_type_exception.dart';
import 'package:http/http.dart';



class ApiClient {
  static const _baseUrl = 'https://pixabay.com';

  final Client _client;

  ApiClient(this._client);

  Future<Response> request(
      {required RequestType requestType,
        required String path,
        dynamic parameter = Nothing}) async {
    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.parse("$_baseUrl/$path")) ;

      case RequestType.POST:
        return _client.post(Uri.parse("$_baseUrl/$path"),
            headers: {"Content-Type": "application/json"},
            body: json.encode(parameter));
      case RequestType.DELETE:
        return _client.delete(Uri.parse("$_baseUrl/$path"));
      default:
        return throw RequestTypeNotFoundException("Method not found");
    }
  }
}

