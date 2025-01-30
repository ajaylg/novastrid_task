import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 600 ? true : false;
        return Center(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: isDesktop ? 400 : double.infinity),
            child: Padding(
              padding: isDesktop ? EdgeInsets.zero : const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment:
                          isDesktop ? Alignment.center : Alignment.topLeft,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _emailTextField(),
                    const SizedBox(height: 12),
                    _pwdTextField(),
                    const SizedBox(height: 12),
                    _submitBtn()
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  TextFormField _emailTextField() {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Email")),
      validator: (value) {
        if (value == null || value.isEmpty || !emailRegex.hasMatch(value)) {
          return "Enter valid Email Id";
        }
        return null;
      },
    );
  }

  TextFormField _pwdTextField() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Password")),
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 8) {
          return "Password should have atleast 8 charatcers";
        }
        return null;
      },
    );
  }

  ElevatedButton _submitBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size(200, 40)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.go("/home");
        }
      },
      child: const Text("Login"),
    );
  }
}
