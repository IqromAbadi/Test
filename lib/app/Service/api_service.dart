import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pt_biis_griya_nadi/app/models/produk_model.dart';
import 'package:pt_biis_griya_nadi/app/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServiceReqresin {
  final String baseUrl = 'https://reqres.in/api';

//POST USER DENGAN API REQRES.IN
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

class ApiServiceMockup {
  final String BaseUrl = 'https://66b62721b5ae2d11eb6614ac.mockapi.io';

  // POST PRODUK
  Future<ProdukModel?> postProduk(String name, int harga) async {
    try {
      final response = await http.post(
        Uri.parse('$BaseUrl/produk'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'harga': harga}),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        return ProdukModel.fromJson(data);
      } else {
        print('Failed to post product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error posting product: $e');
      return null;
    }
  }

  // GET PRODUK
  Future<List<ProdukModel>> getProduk() async {
    try {
      final response = await http.get(Uri.parse('$BaseUrl/produk'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((produk) => ProdukModel.fromJson(produk)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //DELETE PRODUK
  Future<bool> deleteProduk(String id) async {
    try {
      final response = await http.delete(Uri.parse('$BaseUrl/produk/$id'));

      if (response.statusCode == 204) {
        // Updated to check for 204 No Content
        return true;
      } else {
        print('Failed to delete product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error deleting product: $e');
      return false;
    }
  }
}
