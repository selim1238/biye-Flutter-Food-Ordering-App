import 'package:biye/profile/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile/logged.dart';
import 'database/firebase_auth.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return LoggedPage();
              } else {
                return LoginPage();
              }
            },
          ),
        ),
      );
}
