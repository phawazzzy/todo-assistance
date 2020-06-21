import 'package:flutter/material.dart';
import 'package:todoassistance/screens/auth/register.dart';
import 'package:todoassistance/screens/auth/widgets/button.dart';
import 'package:todoassistance/screens/auth/widgets/input_deco.dart';
import 'package:todoassistance/shared/size_config.dart';

class SignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
              children: <Widget>[
                Text(
                  'Signin',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                  ),
                ),
                SizedBox(height: 12),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) => value.isEmpty ? 'email is required' : null,
                        onChanged: (value) => print(value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: KTextInputDeco.copyWith(
                            labelText: 'Email', hintText: 'Jonhdoe@mail.com'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        validator: (value) => value.length <= 6  ? 'at least six charaters' : null,
                        decoration: KTextInputDeco.copyWith(
                            hintText: '*******', labelText: 'password'),
                      ),

                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10.0),
                            child: InkWell(
                              onTap: () => print('forget password'),
                              child: Text(
                                'Forget Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(108, 99, 255, 0.9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Button(
                        buttonText: 'Sign In',
                        onPressed: () {
                          _formKey.currentState.validate();
                        },
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));

                          print('hello');
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'New User? ',
                            style: TextStyle(color: Colors.grey),
                            children: <TextSpan>[
                              TextSpan(text: ' Sign Up', style: TextStyle(color: Color(0xFF6C63FF),),),
                            ],
                          ),
                        ),
                      ),
                    ],
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

