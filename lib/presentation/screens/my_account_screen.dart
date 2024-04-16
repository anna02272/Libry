import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/account_detals_widget.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'My Account',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                size: 30,
              ),
              onPressed: () async {
                if (await confirm(
                  context,
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  textOK: const Text('Yes'),
                  textCancel: const Text('No'),
                )) {
                  return FirebaseAuth.instance.signOut();
                }
                return;
              },
            ),
          ),
        ],
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(239, 245, 243, 1), width: 1),
        ),
      ),
      body: AccountDetails(user: user!),
    );
  }
}