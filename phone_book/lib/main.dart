import 'package:flutter/material.dart';
//import 'package:phone_book/add_contact_page.dart';
import 'package:phone_book/contact_page.dart';

//import 'package:phone_book/model/contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: ContactPage());
  }
}
