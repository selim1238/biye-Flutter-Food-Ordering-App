import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../database/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            Center(child: logo()),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  provider.login();
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    color: Colors.transparent,
                                    child: Card(
                                        color: customColor1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Image(
                                                  image: AssetImage(
                                                      "assets/pngs/google_logo.png")),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                  "Google Hesabınızla Giriş Yapın",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                        ))),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    color: Colors.transparent,
                                    child: Card(
                                        color: customColor1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Image(
                                                  image: AssetImage(
                                                      "assets/pngs/facebook.png")),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                  "Facebook Hesabınızla Giriş Yapın",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                        ))),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    color: Colors.transparent,
                                    child: Card(
                                        color: customColor1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(
                                                Icons.mail_outline,
                                                color: customColor4,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                  "Email Hesabınızla Giriş Yapın",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                        ))),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: SvgPicture.asset("assets/svg/profile.svg"),
                    )
                  ],
                ))));
  }

  Container logo() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 10),
          borderRadius: BorderRadius.circular(30)),
      child: const Text(
        "bi.ye",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: customColor2, fontSize: 50, fontFamily: "ProximaNova"),
      ),
    );
  }
}
