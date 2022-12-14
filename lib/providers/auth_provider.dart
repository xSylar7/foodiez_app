import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../client.dart';

class AuthProvider extends ChangeNotifier {
  String? username;

  Future<bool> register({
    required String username,
    required String password,
    required String first_name,
    required String last_name,
  }) async {
    try {
      var response = await Client.dio.post("/register/", data: {
        "username": username,
        "password": password,
        "first_name": first_name,
        "last_name": last_name,
      });
      var token = response.data['access'];

      Client.dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer $token';

      this.username = username;

      var pref = await SharedPreferences.getInstance();
      await pref.setString('token', token);

      return true;
    } on DioError catch (e) {
      print(e);
      print(e.response!.data);
    } catch (e) {
      print('Unkown Error');
    }

    return false;
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Client.dio.post("/login/", data: {
        "username": username,
        "password": password,
      });
      var token = response.data['access'];

      Client.dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer $token';

      this.username = username;

      var pref = await SharedPreferences.getInstance();
      await pref.setString('token', token);

      return true;
    } on DioError catch (e) {
      print(e);
      print(e.response!.data);
    } catch (e) {
      print('Unkown Error');
    }

    return false;
  }

  Future<bool> hasToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    if (token == null || JwtDecoder.isExpired(token)) {
      return false;
    }
    var tokenMap = JwtDecoder.decode(token);
    username = tokenMap['username'];
    return true;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    username = null;
    notifyListeners();
  }
}
