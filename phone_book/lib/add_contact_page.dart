
import 'dart:io';

import 'package:phone_book/model/contact.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class AddConctactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Contact.contacts.add(Contact(name: "Test", phoneNumber: '0555 555 55 55'));
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Contact"),
      ),
      body: SingleChildScrollView(child:  AddContactForm()),
    );
  }
}

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String name;
    late String phoneNumber;
     File _file;

    return Column(
      children: <Widget>[
        Stack(children: [
          Image.asset(
            "assets/img/person.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
            bottom:8,
            right: 8,
              child: IconButton(
            onPressed: getFile,
            icon: Icon(Icons.camera_alt),
            color: Colors.white,
          )),
        ]),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Contact Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name required";
                        }
                      },
                      onSaved: (value) {
                        name = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: "Phone Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Phone Number required";
                        }
                      },
                      onSaved: (value) {
                        phoneNumber = value!;
                      },
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState?.save();
                        Contact.contacts
                            .add(Contact(name: name, phoneNumber: phoneNumber));

                        var snackBar = Scaffold.of(context).showSnackBar(
                          SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text("$name has been saved")),
                        );

                        snackBar.closed.then((onValue) {
                          Navigator.pop(context);
                        });
                      }
                    },
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  void getFile() {
   
    //var image =ImagePicker.pickImage(source:ImageSource.camera);
  }
}
