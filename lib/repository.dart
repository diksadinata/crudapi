import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_crud_api_sample_app/model.dart';

// ignore: camel_case_types
class Repository {
  // ignore: unused_field
  final _baseUrl = 'https://627ce0febf2deb7174e31c71.mockapi.io';

  Future getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://627ce0febf2deb7174e31c71.mockapi.io/users'));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Users> user = it.map((e) => Users.fromJson(e)).toList();
        return user;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future postData(String tittel, String content) async {
    try {
      final response = await http.post(
          Uri.parse('https://627ce0febf2deb7174e31c71.mockapi.io/users'),
          body: {
            "tittel": tittel,
            "content": content,
          });
      if (response.statusCode == 201) {
        // ignore: avoid_print
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future putData(int id, String tittel, String content) async {
    try {
      final response = await http.put(
          Uri.parse('https://627ce0febf2deb7174e31c71.mockapi.io/users/' +
              id.toString()),
          body: {
            "tittel": tittel,
            "content": content,
          });
      if (response.statusCode == 200) {
        // ignore: avoid_print
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(
          Uri.parse('https://627ce0febf2deb7174e31c71.mockapi.io/users/' + id));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
