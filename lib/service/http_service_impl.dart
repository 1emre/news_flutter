import 'package:dio/dio.dart';

import 'http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "8c6ad9d3d65c4cff8a49645d25f906e5";

class HttpServiceImpl implements HttpService {
  Dio? _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    //Response response2;

    try {
      // response2 = await _dio!.get(
      //     "https://newsapi.org/v2/top-headlines?country=us&apiKey=8c6ad9d3d65c4cff8a49645d25f906e5");
      // print(response2.data.toString());
      response = await _dio!.get(url);
      //print(response.data.toString());
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio!.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler) {
        print(error.response);
        return errorInterceptorHandler.next(error);
      },
      onRequest: (request, requestInterceptorHandler) {
        print("${request.method} | ${request.path}");
        return requestInterceptorHandler.next(request);
      },
      onResponse: (response, responseInterceptorHandler) {
        print(
            "${response.statusCode} ${response.statusMessage} ${response.data}");
        return responseInterceptorHandler.next(response);
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        headers: {"authorization": "Bearer $API_KEY"},
        // validateStatus: (status) {
        //   print(status);
        //   return status! <= 500;
        // },
      ),
    );

    initializeInterceptors();
  }
}
