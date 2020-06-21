import 'package:flutter/material.dart';
import 'package:todoassistance/screens/auth/sign_in.dart';
import 'package:todoassistance/screens/auth/widgets/button.dart';
import 'package:todoassistance/screens/auth/widgets/input_deco.dart';
import 'package:todoassistance/shared/size_config.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  String email = '';

  String username = '';

  String fullname = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              right: 30,
              left: 30,
              top: 80,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: KTextInputDeco.copyWith(labelText: 'Email', hintText: 'Jonhdoe@mail.com'),
                          onChanged: (value) => email = value,
                          validator: (value) => value.isEmpty ? 'email is required' : null,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                            decoration: KTextInputDeco.copyWith(labelText: 'Username',),
                            onChanged: (value) => username = value,
                            validator: (value) => value.isEmpty ? 'username is required' : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                            decoration: KTextInputDeco.copyWith(hintText: 'John Doe', labelText: 'full name'),
                            onChanged: (value) => fullname = value,
                            validator: (value) => value.isEmpty ? 'fullname is required' : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: KTextInputDeco.copyWith(hintText: '********', labelText: 'password'),
                          onChanged: (value) { setState(()=> password = value); },
                          validator: (value) => value.length <= 6  ? 'at least six charaters' : null,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Button(buttonText: 'Sign Up', onPressed: () {
                          if(_formKey.currentState.validate()) {
                            print('success');
                          } else {
                            print('error');
                          }

                        },),
                        SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                            print('hello');
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'New user? ',
                              style: TextStyle(color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(text: ' Sign In', style: TextStyle(color: Color(0xFF6C63FF))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
