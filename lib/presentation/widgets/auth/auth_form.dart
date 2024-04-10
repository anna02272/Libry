import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/auth/form_field.dart';
import 'package:flutter_internship_2024_app/theme.dart';

final buttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(textColor),
  backgroundColor: MaterialStateProperty.all<Color>(themeSeedColor),
  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
  elevation: MaterialStateProperty.all(5),
);

final _firebase = FirebaseAuth.instance;

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _form = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var _isLogin = true;
  var _emailValid = true;
  var _passwordValid = true;
  var _confirmPasswordValid = true;

  void _authenticate() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    try {
      if (!_isLogin) {
        await _firebase.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      }
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        // TODO show error message
      }
    }
  }

  void _resetForm() {
    _form.currentState!.reset();

    setState(() {
      _isLogin = !_isLogin;
      _emailValid = true;
      _passwordValid = true;
      _confirmPasswordValid = true;
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          //email
          CustomFormField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'Your email address',
            suffixIcon: _emailValid ? null : const Icon(Icons.error),
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !EmailValidator.validate(value)) {
                setState(() {
                  _emailValid = false;
                });
                return 'Email is not in correct format!';
              }
              setState(() {
                _emailValid = true;
              });
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Your password',
            suffixIcon: _passwordValid ? null : const Icon(Icons.error),
            validator: (value) {
              if (value == null || value.trim().isEmpty || value.length < 6) {
                setState(() {
                  _passwordValid = false;
                });
                return 'Password should contain 6 characters!';
              }
              setState(() {
                _passwordValid = true;
              });
              return null;
            },
          ),

          if (_isLogin)
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(0, 166, 141, 1))),
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),

          if (!_isLogin)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm password',
                  hintText: 'Repeat your password',
                  suffixIcon:
                      _confirmPasswordValid ? null : const Icon(Icons.error),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value != _passwordController.text) {
                      setState(() {
                        _confirmPasswordValid = false;
                      });
                      return 'Passwords do not match!';
                    }
                    setState(() {
                      _confirmPasswordValid = true;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _authenticate,
              style: buttonStyle,
              child: Text(_isLogin ? 'Login' : 'Sign up'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _resetForm,
              style: buttonStyle,
              child: Text(_isLogin ? 'Sign up' : 'Login'),
            ),
          ),
        ],
      ),
    );
  }
}
