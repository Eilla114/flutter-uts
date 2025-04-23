import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Halo, _username!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $username'),
            Text('Status login: ${auth.isLoggedIn ? 'Aktif' : 'Tidak aktif'}'),
            ElevatedButton(
              onPressed: () {
                auth.logout();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}