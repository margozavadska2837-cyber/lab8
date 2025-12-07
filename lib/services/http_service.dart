import 'package:dio/dio.dart';

class HttpService {
  final Dio dio = Dio();

  final String baseUrl = "https://lab12.requestcatcher.com/test";

  Future<void> sendLogin(String name, String password) async {
    await dio.post(
      "$baseUrl/login",
      data: {"name": name, "password": password},
    );
  }

  Future<void> sendSignup(String name, String email, String password) async {
    await dio.post(
      "$baseUrl/signup",
      data: {"name": name, "email": email, "password": password},
    );
  }

  Future<void> sendReset(String email) async {
    await dio.post(
      "$baseUrl/reset",
      data: {"email": email},
    );
  }
}