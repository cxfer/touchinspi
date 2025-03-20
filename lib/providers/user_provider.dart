import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../database/local_database.dart';

class UserProvider with ChangeNotifier {
  final LocalDatabase _localDatabase = LocalDatabase();
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null; // Added hasError getter

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
    return _users.firstWhere(
      (user) => user.id == userId,
      // orElse: () => null, // Added null-safety
    );
  }

  Future<void> updateUser(
      String userId, User updatedUser, BuildContext context) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _localDatabase.database;
      // Update user in local database
      await _localDatabase.updateUser(updatedUser);

      // Update user in the local list
      final index = _users.indexWhere((user) => user.id == userId);
      if (index != -1) {
        _users[index] = updatedUser;
      }

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User updated locally')),
      );
    } catch (e) {
      _error = 'Failed to update user: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_error!)),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateUserLocally(User updatedUser, BuildContext context) {
    final index = _users.indexWhere((user) => user.id == updatedUser.id);
    if (index != -1) {
      _users[index] = updatedUser;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Yoo your POST, PATCH and PUT aint working bro meanwhile, User changes saved locally! 😊 '),
        backgroundColor: Colors.green,
      ),
    );

    notifyListeners();
  }
}
