import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoassistance/screens/auth/sign_in.dart';
import 'package:todoassistance/screens/auth/widgets/button.dart';
import 'package:todoassistance/screens/auth/widgets/input_deco.dart';
import 'package:todoassistance/shared/size_config.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  FocusScopeNode _focusScopeNode = FocusScopeNode();

  String email = '';

  String username = '';

  String fullname = '';

  String password = '';

  bool passwordState = true;
  void showPassword() {
    passwordState = !passwordState;
  }

  void _handleFieldSubmitted(String value) {
    _focusScopeNode.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FocusScope(
        node: _focusScopeNode,
        child: SafeArea(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            onFieldSubmitted: _handleFieldSubmitted,
                            textInputAction: TextInputAction.next,
                            decoration: KTextInputDeco.copyWith(
                                labelText: 'Email', hintText: 'Jonhdoe@mail.com'),
                            onChanged: (value) => email = value,
                            validator: (value) => EmailValidator.validate(value)
                                ? null
                                : 'please input a real email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            onFieldSubmitted: _handleFieldSubmitted,
                            textInputAction: TextInputAction.next,
                            decoration: KTextInputDeco.copyWith(
                              labelText: 'Username',
                            ),
                            onChanged: (value) => username = value,
                            validator: (value) =>
                                value.isEmpty ? 'username is required' : null,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            onFieldSubmitted: _handleFieldSubmitted,
                            textInputAction: TextInputAction.next,
                            decoration: KTextInputDeco.copyWith(
                                hintText: 'John Doe', labelText: 'full name'),
                            onChanged: (value) => fullname = value,
                            validator: (value) =>
                                value.isEmpty ? 'fullname is required' : null,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            onEditingComplete: () {print('i ma done');},
                            textInputAction: TextInputAction.done,
                            decoration: KTextInputDeco.copyWith(
                              hintText: 'password6',
                              labelText: 'password',
                              suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {
                                setState(() {
                                  showPassword();
                                });
                              }),
                            ),

                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            validator: (value) {
                              Pattern passwordPattern =
                                  r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                              RegExp regex = new RegExp(passwordPattern);
                              if (!regex.hasMatch(value)) {
                                return 'must  contain atleast 1 num, one letter and more than 6';
                              } else {
                                return null;
                              }
                            },
                            obscureText: passwordState,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Button(
                            buttonText: 'Sign Up',
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                print('success');
                              } else {
                                print('error');
                              }
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
                                      builder: (context) => SignIn(),),);
                              print('hello');
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Have an account? ',
                                style: TextStyle(color: Colors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Sign In',
                                      style: TextStyle(color: Color(0xFF6C63FF))),
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
      ),
    );
  }
}
