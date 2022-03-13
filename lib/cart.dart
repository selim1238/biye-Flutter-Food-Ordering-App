import "package:flutter/material.dart";

import 'colors.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: customColor4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on),
              const SizedBox(
                width: 10,
              ),
              const Text("İş - (İstanbul - Beyoğlu)", // Adress Bar
                  style: TextStyle(fontSize: 18, fontFamily: "ProximaNova")),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SizedBox(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: const Text("Sepetiniz:",
                          style: TextStyle(
                              fontSize: 18, fontFamily: "ProximaNova")),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.005,
                    color: customColor1.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: const Text("Toplam Tutar:",
                          style: TextStyle(
                              fontSize: 18, fontFamily: "ProximaNova")),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: customColor2,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: const Center(
                      child: Text("Kupon Kodu Kullan",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "ProximaNova",
                              color: customColor4)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: customColor1,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: const Center(
                      child: Text("Ödeme Sayfasına Geç",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "ProximaNova",
                              color: customColor4)),
                    ),
                  ),
                ),
              ],
            ))));
  }
}
