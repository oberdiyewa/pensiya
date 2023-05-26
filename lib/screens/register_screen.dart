// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://mlsp.gov.tm";
const headers = {
  "Accept": "application/json",
  "Content-Type": "application/json"
};
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

      const logindata = {"phone": "63494718", "password": "password"};
      final reqData = jsonEncode(logindata);

      final response = await http.post(uri, headers: headers, body: reqData);

      print(response.body);
    } catch (e) {
      print(e);
      rethrow;
    } finally {
      setState(() => isLoading = false);
    }
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
        ],
      )),
    );
  }
}
