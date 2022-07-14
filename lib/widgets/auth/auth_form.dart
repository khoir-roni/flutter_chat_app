import 'package:flutter/material.dart';

class AuthForms extends StatefulWidget {
  @override
  State<AuthForms> createState() => _AuthFormsState();
}

class _AuthFormsState extends State<AuthForms> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print(_userEmail);
      print(_userName);
      print(_userPassword);

      //use these value to send out auth request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(labelText: 'Email Address'),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ), //email address form
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value;
                      },
                      decoration: const InputDecoration(labelText: 'UserName'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty || value.length < 7) {
                          return 'Password must be at least 7 character long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userPassword = value;
                      },
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: _trySubmit,
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
