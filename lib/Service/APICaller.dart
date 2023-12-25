import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../Utils/Utils.dart';

class APICaller {
  static APICaller _apiCaller = APICaller();
  final String BASE_URL = "http://192.168.1.57:3000/";
  final _httpClient = http.Client();

  static APICaller getInstance() {
    if (_apiCaller == null) {
      _apiCaller = APICaller();
    }
    return _apiCaller;
  }

  Future<dynamic> get(String endpoint, {dynamic body}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri uri = Uri.parse(BASE_URL + endpoint);
    final finalUri = uri.replace(queryParameters: body);

    final response = await http
        .get(finalUri, headers: requestHeaders)
        .timeout(const Duration(seconds: 30), onTimeout: () {
      return http.Response(
          'Không kết nối được đến máy chủ, bạn vui lòng kiểm tra lại.', 408);
    });
    if (jsonDecode(response.body)['code'] != 200) {
      Utils.showSnackBar(
          title: 'Thông báo', message: jsonDecode(response.body)['message']);
      return null;
    }
    return jsonDecode(response.body);
  }

  Future<dynamic> post(String endpoint, dynamic body) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'bearer ${await Utils.getStringValueWithKey('token')}'
    };
    final uri = Uri.parse(BASE_URL + endpoint);
    final response = await http
        .post(uri, headers: requestHeaders, body: jsonEncode(body))
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response(
            'Không kết nối được đến máy chủ, bạn vui lòng kiểm tra lại.', 408);
      },
    );
    if (jsonDecode(response.body)['code'] != 200) {
      Utils.showSnackBar(
          title: 'Thông báo', message: jsonDecode(response.body)['message']);
      return null;
    }
    return jsonDecode(response.body);
  }

  Future<dynamic> put(String endpoint, dynamic body) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'bearer ${await Utils.getStringValueWithKey('token')}'
    };
    final uri = Uri.parse(BASE_URL + endpoint);

    final response = await http
        .put(uri, headers: requestHeaders, body: jsonEncode(body))
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response(
            "Không kết nối được đến máy chủ, bạn vui lòng kiểm tra lại.", 408);
      },
    );
    if (jsonDecode(response.body)['code'] != 200) {
      Utils.showSnackBar(
          title: 'Thông báo', message: jsonDecode(response.body)['message']);
      return null;
    }
    return jsonDecode(response.body);
  }

  Future<dynamic> delete(String endpoint, {dynamic body}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'bearer ${await Utils.getStringValueWithKey('token')}'
    };
    final uri = Uri.parse(BASE_URL + endpoint);

    final response = await http
        .delete(uri, headers: requestHeaders, body: jsonEncode(body))
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response(
            "Không kết nối được đến máy chủ, bạn vui lòng kiểm tra lại.", 408);
      },
    );
    if (jsonDecode(response.body)['code'] != 200) {
      Utils.showSnackBar(
          title: 'Thông báo', message: jsonDecode(response.body)['message']);
      return null;
    }
    return jsonDecode(response.body);
  }

  Future<dynamic> postFile(String endpoint, File filePath) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'bearer ${await Utils.getStringValueWithKey('token')}'
    };
    final uri = Uri.parse(BASE_URL + endpoint);

    final request = http.MultipartRequest('POST', uri);
    request.files
        .add(await http.MultipartFile.fromPath('image', filePath.path));
    request.headers.addAll(requestHeaders);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response(
            "Không kết nối được đến máy chủ, bạn vui lòng kiểm tra lại.", 408);
      },
    );

    if (jsonDecode(response.body)['code'] != 200) {
      Utils.showSnackBar(
          title: 'Thông báo', message: jsonDecode(response.body)['message']);
      return null;
    }
    return jsonDecode(response.body);
  }
}
