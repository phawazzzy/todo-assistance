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
                        onChanged: (value) => print(value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: KTextInputDeco.copyWith(labelText: 'Email', hintText: 'Jonhdoe@mail.com'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));

                          print('hello');
                        },
                        child: Text('New user? SignUp'),
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


//Row(
//children: <Widget>[
//Checkbox(value: false, onChanged: (value) {}),
//Text(
//'Remember me',
//style: TextStyle(fontSize: 12),
//),
//SizedBox(
//width: 20,
//),
//Text(
//'Forget Password?',
//style: TextStyle(
//fontSize: 12,
//color: Color.fromRGBO(108, 99, 255, 0.9),
//),
//),
//],
//),