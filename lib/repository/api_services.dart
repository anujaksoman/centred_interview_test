
import 'dart:convert';
import 'package:centered_interview_test/model/image_model.dart';
import 'package:centered_interview_test/repository/api_client.dart';
import 'package:centered_interview_test/utils/request_type.dart';
import 'package:centered_interview_test/utils/result.dart';
import 'package:http/http.dart';


class ApiService {
  ApiService._privateConstructor();

  static final ApiService instance =
  ApiService._privateConstructor();

  factory ApiService() => instance;

  ///Initializing HttpClient
  static Client httpClient = Client();

  get getClient => httpClient;

  void setClient(client) => httpClient = client;
  ApiClient client = ApiClient(httpClient);

  Future<Result> getSearchData(String apiKey,String query) async {
    try {
      String path = "/api/?key=${apiKey}&q=${query}&image_type=photo";
      print("image path = $path");
      final res = await client.request(
        requestType: RequestType.GET,
        path: path,
      );
      if (res.statusCode == 200) {
        SearchModel searchData =
        SearchModel.fromJson(jsonDecode(res.body));
        return Result<SearchModel>.success(searchData);
      } else {
        return Result.error("Error in connection");
      }
    } catch (error) {
      return Result.error("${error}");
    }
  }

  void init() {

  }


}
