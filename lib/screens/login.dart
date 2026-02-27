import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login ')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Write your gmail ')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'write valid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Write your password '),
                ),
                validator: (value) {
                  if (value == null || value.length < 4) {
                    return 'password must contains 4 letters ';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // print(Text('error'));
                    debugPrint("Form not valid");
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
