// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iappoint/screens/login.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  String? _fname, _lname, _age, _phoneNumber, _homeAddress, _comment;

  dynamic data;
  Future getData(email) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(email).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      setState(() {
        _fname = data?['f_name'];
        _lname = data?['l_name'];
        _age = data?['age'];
        _phoneNumber = data?['phone_number'];
        _homeAddress = data?['home_address'];
        _comment = data?['comment'];
      });
    }
  }

  @override
  void initState() {
    setState(() {
      super.initState();
      getData(LoginPage.getEmail()).whenComplete(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 50),
            child: const Text(
              "Confirm Your \nInformation",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  children: [
                    TextField(
                      controller: TextEditingController()
                        ..text = _fname.toString(),
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          // _email = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: TextEditingController()
                        ..text = _lname.toString(),
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          // _email = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: TextEditingController()
                        ..text = _age.toString(),
                      decoration: InputDecoration(
                        labelText: "Age",
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          // _email = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: TextEditingController()
                        ..text = _homeAddress.toString(),
                      decoration: InputDecoration(
                        labelText: "Home Address",
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          // _email = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: TextEditingController()
                        ..text = _phoneNumber.toString(),
                      decoration: InputDecoration(
                        labelText: "Home Address",
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                      keyboardType: TextInputType.streetAddress,
                      onChanged: (value) {
                        setState(() {
                          // _email = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: TextEditingController()
                        ..text = _comment.toString(),
                      decoration: InputDecoration(
                        labelText: "Additional Comments",
                        labelStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          // _email = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, 'thank_you')},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),

                              // margin: EdgeInsets.all(0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: const [
                                      Color.fromARGB(255, 64, 153, 222),
                                      Color.fromARGB(255, 41, 156, 194),
                                      Color.fromARGB(255, 95, 186, 255),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth: double.infinity, minHeight: 50),
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, 'user_details')
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: const [
                                      Color.fromARGB(255, 64, 153, 222),
                                      Color.fromARGB(255, 41, 156, 194),
                                      Color.fromARGB(255, 95, 186, 255),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth: double.infinity, minHeight: 50),
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
