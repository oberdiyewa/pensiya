import 'package:http/http.dart' as http;
import 'package:retirement_app/prefs.dart';
import 'package:retirement_app/screens/register_screen.dart';

const baseUrl = "https://mlsp.gov.tm";

const ACCESS_KEY = "SHARED_FIELD_ACCESS_TOKEN";

final defaultHeaders = {
  "Accept": "application/json",
  "Content-Type": "application/json"
};

class HttpService {

  

  Future<http.Response> get(String route,
      {Map<String, String>? headers, bool authRequired = true}) async {
    final hds = {};
    hds.addAll(defaultHeaders);
    hds.addAll(headers ?? {});

    if (authRequired) {
      final token = SharedPref.instance.getString(ACCESS_KEY);
      hds['Authorization'] = 'Bearer $token';
    }

    return await http.get(Uri.parse('$baseUrl/$route'), headers: headers);
  }
}
