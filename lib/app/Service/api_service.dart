import 'dart:convert';
import 'package:pt_biis_griya_nadi/app/models/food.dart';
import 'package:pt_biis_griya_nadi/app/models/user_model.dart';
import 'package:http/http.dart' as http;

//API REQRES.IN
class ApiServiceReqresin {
  final String baseUrl = 'https://reqres.in/api';

//POST
  Future<User?> postUser(String name, String job) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        body: {
          'name': name,
          'job': job,
        },
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map((user) => User.fromJson(user)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

//API MOCKUP
class ApiServiceMockup {
  final String _baseUrl = 'https://66b62721b5ae2d11eb6614ac.mockapi.io';

  // GET
  Future<List<Food>?> getFood() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/produk'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Food> food = it.map((e) => Food.fromJson(e)).toList();
        return food;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  // POST
  Future<void> postFood(String name, int price) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/produk'),
        body: {
          'name': name,
          'price': price.toString(),
        },
      );

      if (response.statusCode == 201) {
        print('Food added successfully');
      } else {
        print('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error posting data: $e');
    }
  }

// DELETE
  Future<void> deleteFood(int id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/produk/$id'));

      if (response.statusCode == 200) {
        print('Food deleted successfully');
      } else {
        print('Failed to delete data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}
