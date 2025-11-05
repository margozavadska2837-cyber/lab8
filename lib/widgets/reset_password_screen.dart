import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/flutter_logo.png",
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                  "Reset Password",
                  style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 4),
              const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                  labelText: "Email"
                  ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Message"),
                        content: Text("Need to implement"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'Ok'),
                              child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Reset"),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
