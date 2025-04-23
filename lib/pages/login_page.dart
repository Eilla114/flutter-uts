import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Username tidak boleh kosong' : null,
                onChanged: (value) => _username = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length < 6 ? 'Password minimal 6 karakter' : null,
                onChanged: (value) => _password = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final success = auth.login(_username, _password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(success ? 'Login Berhasil' : 'Periksa kembali input Anda')),
                    );
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    }
                  }
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}