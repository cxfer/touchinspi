import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'EditUserScreen.dart';

class UserDetailScreen extends StatelessWidget {
  final String userId;

  UserDetailScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.getUserById(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text(user?.name ?? 'Loading...'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color.fromARGB(255, 28, 9, 83),
      body: user == null
          ? const Center(child: Text('User not found'))
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: 500,
                    height: 400,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${user.name}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text('Email: ${user.email}',
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 10),
                        Text('Occupation: ${user.occupation}',
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 10),
                        Text('Bio: ${user.bio}',
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 10),
                        Text('ID: ${user.id}', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditUserScreen(user: user),
                              ),
                            );
                          },
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
