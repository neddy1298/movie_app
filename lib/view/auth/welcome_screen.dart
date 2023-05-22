import 'package:flutter/material.dart';
import 'package:cinema_app/view/auth/login_screen.dart';
import 'package:cinema_app/view/auth/register_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool showLoginForm = false;
  bool showRegisterForm = false;

  void toggleLoginForm() {
    setState(() {
      showLoginForm = !showLoginForm;
      showRegisterForm = false;
    });
  }

  void toggleRegisterForm() {
    setState(() {
      showRegisterForm = !showRegisterForm;
      showLoginForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/welcome_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 100.0),
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Nikmati pengalaman menonton film yang lebih baik',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  if (!showLoginForm && !showRegisterForm)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 40.0, left: 20.0, right: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60.0,
                          child: ElevatedButton(
                            onPressed: toggleLoginForm,
                            child: const Text(
                              'Mulai',
                              style: TextStyle(fontSize: 26),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Visibility(
                    visible: showLoginForm || showRegisterForm,
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: LoginForm(
                        onRegisterClicked: toggleRegisterForm,
                      ),
                      secondChild: RegisterForm(
                        onLoginClicked: toggleLoginForm,
                      ),
                      crossFadeState: showLoginForm
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
