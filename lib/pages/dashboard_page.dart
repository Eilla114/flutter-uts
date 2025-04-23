import 'package:flutter/material.dart';
import 'dart:io';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            height: 150,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Dashboard',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          // Grid Menu
          Expanded(
            

            
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildGridCard(context, Icons.person, 'Profil Saya', () {
                  // Ganti dengan username sesuai input atau provider jika ada
                  Navigator.pushNamed(context, '/profile/username');
                }),
                _buildGridCard(context, Icons.countertops, 'Counter', () {
                  Navigator.pushNamed(context, '/counter');
                }),
                _buildGridCard(context, Icons.settings, 'Settings', () {}),
                
                _buildGridCard(context, Icons.info, 'Logout', () {
                  Navigator.pushNamed(context, '/login');
                }),
              ],
            ),
          ),
          // Stack Banner
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File('assets/profil-univ.jpg')), // Gambar lokal
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  'Welcome to the Dashboard',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}