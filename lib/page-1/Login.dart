import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/Home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(brightness: Brightness.light),
      home: const FormPage(title: 'Login'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff7095b5),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SignUpForm()),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  int _ID = -1;
  String _maritalStatus = 'single';
  String _password = '';
  bool _termsChecked = true;

  List<DropdownMenuItem<int>> genderList = [];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(TextFormField(
      decoration: const InputDecoration(hintText: 'ID', labelText: 'Enter ID'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter ID';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _ID = int.parse(value.toString());
        });
      },
    ));

    formWidget.add(
      TextFormField(
          key: _passKey,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Password', labelText: 'Enter Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter password';
            } else if (value.length < 8) {
              return 'Password should be more than 8 characters';
            } else {
              return null;
            }
          }),
    );

    void onPressedSubmit() {
      if (_formKey.currentState!.validate() && _termsChecked) {
        _formKey.currentState?.save();

        print("Marital Status " + _maritalStatus);
        print("Password " + _password);
        print("Termschecked " + _termsChecked.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Form Submitted')));
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    }

    formWidget.add(ElevatedButton(
      child: const Text('Login'),
      onPressed: onPressedSubmit,
    ));

    return formWidget;
  }
}
