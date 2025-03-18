import 'package:flutter/material.dart';
import '../models/user.dart';

class UserItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  UserItem({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email: ${user.email}'),
          Text('Occupation: ${user.occupation}'),
          Text('Bio: ${user.bio}'),
          Text('ID: ${user.id}'),
        ],
      ),
      onTap: onTap,
    );
  }
}
