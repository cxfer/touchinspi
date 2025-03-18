import 'package:flutter/material.dart';
import '../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final bool isSmall;
  final VoidCallback onTap;

  UserCard({required this.user, required this.isSmall, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 200,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: isSmall ? 20 : 30,
                  backgroundImage: const AssetImage('assets/images/bm.png'),
                  onBackgroundImageError: (error, stackTrace) {
                    print('Image load error: $error');
                  },
                  child: Icon(Icons.error),
                ),
                SizedBox(height: 8),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: isSmall ? 12 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  'ID: ${user.id}',
                  style: TextStyle(
                    fontSize: isSmall ? 10 : 12,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: isSmall ? 10 : 12,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  user.occupation,
                  style: TextStyle(
                    fontSize: isSmall ? 10 : 12,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  user.bio,
                  style: TextStyle(
                    fontSize: isSmall ? 10 : 12,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
