import 'package:flutter/material.dart';
import 'package:todoassistance/screens/auth/register.dart';
import 'package:todoassistance/screens/auth/widgets/button.dart';
import 'package:todoassistance/screens/auth/widgets/input_deco.dart';
import 'package:todoassistance/shared/size_config.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  FocusScopeNode _focusScopeNode = FocusScopeNode();

  bool passwordState = true;
  void showPassword() {
      passwordState = !passwordState;
  }

  void _handleFieldSubmitted(String value) {
    _focusScopeNode.nextFocus();
  }

  @override
  void dispose() {
   _focusScopeNode.dispose();
    super.dispose();
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
                children: <Widget>[
                  Text(
                    'Sign In',
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
                          onFieldSubmitted: _handleFieldSubmitted,
                          textInputAction: TextInputAction.next,
                          validator: (value) =>
                            EmailValidator.validate(value)
                                ? null
                                : 'please input a real email',

                          onChanged: (value) => print(value),
                          keyboardType: TextInputType.emailAddress,
                          decoration: KTextInputDeco.copyWith(
                            labelText: 'Email',
                            hintText: 'Jonhdoe@mail.com',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: passwordState,
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
                          decoration: KTextInputDeco.copyWith(
                            hintText: 'password6',
                            labelText: 'password',
                            suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    showPassword();
                                  });
                                }),
                          ),
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
                                  color: Colors.grey,
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
                                builder: (context) => Register(),
                              ),
                            );
                            print('hello');
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'New User? ',
                              style: TextStyle(color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF6C63FF),
                                  ),
                                ),
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
      ),
    );
  }
}
