import 'dart:convert';
import "package:http/http.dart" as http;

Future createUser(String password, String username) async {
  Uri url = Uri.parse('https://diyorbekmajidov.pythonanywhere.com/createuser/');

  final response = await http.post(
    url,
    headers: {'Content-type': 'application/json'},
    body: jsonEncode(
      {
        'password': password,
        'username': username,
      },
    ),
  );

  if (response.statusCode == 200) {
    print('Todo added');
  } else {
    print("Failed");
  }
}

  Future<void> addTodo(String title,String description) async {
    // final prefs = await SharedPreferences.getInstance();
    // final Map userData = jsonDecode(prefs.getString('user')!);
    Uri url = Uri.parse('https://diyorbekmajidov.pythonanywhere.com/add/');
    final String basicAuth = base64Encode(utf8.encode("ogabek12:qazcdewsx"));

    // final String basicAuth = base64Encode(utf8.encode("${userData['username']}:${userData['password']}"));
    print(basicAuth);
    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            'title': title,
            'description': description,
          },
        ),
        headers: {
          "Content-Type": "application/json",
          "authorization": "Basic $basicAuth",
        },
      );
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }

  

Future<void> getTodo() async {
    // final prefs = await SharedPreferences.getInstance();
    // final Map userData = jsonDecode(prefs.getString('user')!);
    Uri url = Uri.parse('https://diyorbekmajidov.pythonanywhere.com/get/');

    final String basicAuth = base64Encode(utf8.encode("ogabek12:qazcdewsx"));
    // final String basicAuth = base64Encode(utf8.encode("${userData['username']}:${userData['password']}"));

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "authorization": "Basic ogabek12:qazcdewsx",
        },
      );
      print(response.body);
    } catch (_) {
      rethrow;
    }
  }
