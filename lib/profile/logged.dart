import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../database/firebase_auth.dart';
import 'login.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({Key key}) : super(key: key);

  @override
  _LoggedPageState createState() => _LoggedPageState();
}

Future<LoginPage> _signOut() async {
  await FirebaseAuth.instance.signOut();
  return new LoginPage();
}

class _LoggedPageState extends State<LoggedPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: customColor4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Hesabım",
                    style: TextStyle(
                        color: customColor1,
                        fontSize: 22,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: ListView(children: [
          Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Card(
                    child: Row(
                      children: [
                        Image(image: NetworkImage(user.photoURL)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 2),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        user.displayName,
                                        style: const TextStyle(
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            color: Colors.black),
                                      ),
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.check),
                                          const Text(
                                            "Toplam Sipariş: 14",
                                            style: TextStyle(
                                                fontFamily: "ProximaNova",
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              CategoryTab(context, "Bilgilerim"),
              CategoryTab(context, "Önceki Siparişlerim"),
              CategoryTab(context, "Adreslerim"),
              CategoryTab(context, "Kredi Kartlarım"),
              CategoryTab(context, "Kuponlarım"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Çıkış yapmak istediğinden emin misiniz?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Hayır",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _signOut();
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Evet",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Card(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Çıkış Yap",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: "ProximaNova",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.logout_rounded,
                          size: 20.0,
                          color: Colors.red,
                        )
                      ],
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: SvgPicture.asset("assets/svg/profile.svg"),
              ),
            ],
          )
        ]));
  }

  SizedBox CategoryTab(BuildContext context, String tablabel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tablabel,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 20.0)
                ],
              ),
            )),
      ),
    );
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
            color: customColor2, fontSize: 40, fontFamily: "ProximaNova"),
      ),
    );
  }
}
