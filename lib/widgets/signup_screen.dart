import 'package:flutter/material.dart';
import '../services/http_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final HttpService http = HttpService();

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      await http.sendSignup(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Message"),
          content: const Text(
            "Sign up sent!",
            style: TextStyle(color: Color(0xFFEC40AB)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/flutter_logo.png", height: 100),
                const SizedBox(height: 16),
                Text("Sign up", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    } else if (!_isValidEmail(value)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value) =>
                  value != null && value.length >= 7 ? null : 'At least 7 characters',
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _signup,
                    child: const Text("Sign up"),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}