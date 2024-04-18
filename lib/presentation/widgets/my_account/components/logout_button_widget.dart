import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (await confirm(
          context,
          title: Text(t.logout),
          content: Text(t.confirm_logout),
          textOK: Text(t.yes),
          textCancel: Text(t.no),
        )) {
          await FirebaseAuth.instance.signOut();
        }
      },
      child: Text(
        t.logout,
        style: const TextStyle(color: Colors.red, fontSize: 25),
      ),
    );
  }
}
