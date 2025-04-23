import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/counter_controller.dart';
import 'controllers/auth_controller.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/counter_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/dashboard': (_) => DashboardPage(),
        '/counter': (_) => CounterPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/profile/')) {
          final username = settings.name!.replaceFirst('/profile/', '');
          return MaterialPageRoute(builder: (_) => ProfilePage(username: username));
        }
        return null;
      },
    );
  }
}