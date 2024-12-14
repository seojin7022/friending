import 'dart:convert';

import 'package:friending/types.dart';
import 'package:http/http.dart';

Future<UserData?> login(String token) async {
  const baseUrl = "http://localhost:4000/api/login";
  final url = Uri.parse(baseUrl);
  final res = await post(
    url,
    body: {
      "token": token,
    },
  );

  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    return UserData(
        username: data['username'], email: data['email'], age: data['age']);
  }

  return null;
}
