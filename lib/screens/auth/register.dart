import 'package:flutter/material.dart';
import 'package:todoassistance/screens/auth/sign_in.dart';
import 'package:todoassistance/screens/auth/widgets/button.dart';
import 'package:todoassistance/screens/auth/widgets/input_deco.dart';
import 'package:todoassistance/shared/size_config.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

//  bool showPassword(bool state) {
//    return state = !state;
//  }

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
                          onChanged: (value) => print(value),
                          keyboardType: TextInputType.emailAddress,
                          decoration: KTextInputDeco.copyWith(labelText: 'Email', hintText: 'Jonhdoe@mail.com'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: KTextInputDeco.copyWith(labelText: 'Username',)
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: KTextInputDeco.copyWith(hintText: 'John Doe', labelText: 'full name')
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          decoration: KTextInputDeco.copyWith(hintText: '*******', labelText: 'password'),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Button(buttonText: 'Sign Up', onPressed: () {print('this is me');},),
                        SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                            print('hello');
                          },
                          child: Text('have account? Sign in'),
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
