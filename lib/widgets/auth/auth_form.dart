import 'package:flutter/material.dart';

class AuthFormState extends StatefulWidget {
  @override
  State<AuthFormState> createState() => _AuthFormStateState();
}

class _AuthFormStateState extends State<AuthFormState> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                ), //email address form
                TextFormField(
                  decoration: const InputDecoration(labelText: 'UserName'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Create new account!'),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
