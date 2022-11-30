import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'localhost:8000/'));
}
