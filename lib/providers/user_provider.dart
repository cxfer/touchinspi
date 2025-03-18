import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUsers() async {
    if (_isLoading) return;
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/api/users'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _users = data.map((user) => User.fromJson(user)).toList();
      } else {
        _error = 'Failed to load users: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Failed to load users: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  User? getUserById(String userId) {
    return _users
        .firstWhere((user) => user.id == userId /*, orElse: () => null)*/);
  }
}
