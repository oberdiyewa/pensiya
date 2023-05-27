// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retirement_app/prefs.dart';
import 'package:retirement_app/screens/http.dart';
import 'package:retirement_app/screens/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

///  |   ACCESS_TOKEN   |  
///       <value>



const baseUrl = "https://mlsp.gov.tm";

const data = {
  "phone": "63494718",
  "name": "Flutter",
  "surname": "Meredow",
  "second_name": "Meredowich",
  "entity": "example@example.com",
  "pension_number": "732782783783278",
  "password": "password",
  "password_confirmation": "password",
  "is_employer": true,
  "email": "atabek@mail.com",
  "tax_code": "string",
  "name_employer": "string",
  "hsuk_code": "string",
  "real_address": "string",
  "legal_address": "string",
  "insurance_code": "string",
  "province_id": "string"
};


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  void register() async {
    try {
      setState(() => isLoading = true);

      final uri = Uri.parse('$baseUrl/api/auth/register');

      final reqData = jsonEncode(data);

      final response = await http.post(uri, headers: headers, body: reqData);

      print(response.body);
    } catch (e) {
      print(e);
      rethrow;
    } finally {
      setState(() => isLoading = false);
    }
  }

  void login() async {
    try {
      setState(() => isLoading = true);

      final uri = Uri.parse('$baseUrl/api/auth/login');

                        // dart map
      const logindata = {"phone": "63494718", "password": "password"};
                      // dart -> json
      final reqData = jsonEncode(logindata);

      final response = await http.post(uri, headers: headers, body: reqData);

                      // json -> dart
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;

      print(decoded);

      // convert to model
      final body = ResponseBody.fromJson(decoded['data']);

      // save token to db
      // initialize

      // save
      SharedPref.instance.setString(ACCESS_KEY, body.accessToken!);

    } catch (e) {
      print(e);
      rethrow;
    } finally {
      setState(() => isLoading = false);
    }
  }

  void getInfo() async {
    // get user info: GET /api/account/info
    final token = SharedPref.instance.getString(ACCESS_KEY);
    headers['Authorization'] = 'Bearer $token';



    print(token);

    HttpService

    final url = Uri.parse('$baseUrl/api/account/info');
    final res = await http.get(url, headers: headers);

    print(res.statusCode == 200);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          isLoading
              ? const CircularProgressIndicator()
              : TextButton(onPressed: register, child: const Text('Register')),
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator()
              : TextButton(onPressed: login, child: const Text('Login')),
          
          const SizedBox(height: 20),

          TextButton(onPressed: getInfo, child: const Text('Get info')),
        ],
      )),
    );
  }
}
