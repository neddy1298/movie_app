
import 'package:cinema_app/view/main/home_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onRegisterClicked;

  const LoginForm({Key? key, required this.onRegisterClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12.withOpacity(0.86),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Username',
              ),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              style: TextStyle(
                fontSize: 24,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: onRegisterClicked,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Belum memiliki akun?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Daftar sekarang!',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
