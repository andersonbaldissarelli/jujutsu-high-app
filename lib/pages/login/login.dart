import 'package:flutter/material.dart';
import 'package:jujutsu_high/pages/login/login_controller.dart';
import 'package:jujutsu_high/shared/validator/input_text_validator.dart';
import 'package:jujutsu_high/shared/widgets/custom_input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller = LoginController(onUpdate: () {
    setState(() {});
  });

  var email;
  var password;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/assets/gojou2.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  "Jujutsu Sorcery School",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 60,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  color: Colors.black.withOpacity(0.65),
                ),
                width: MediaQuery.of(context).size.width / 1.1,
                height: 350,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      CustomInputTextWidget(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onChanged: (value) => {email = value},
                        validator: (value) =>
                            InputTextValidator().validateEmail(value!),
                        labelText: "Insert Email",
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                      ),
                      CustomInputTextWidget(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) => {password = value},
                        validator: (value) =>
                            InputTextValidator().validatePassword(value!),
                        labelText: "Insert Password",
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 350,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.red),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {
                                if (controller.userModel.email != email) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Invalid e-mail'),
                                          content: Text(
                                              'Your e-mail is incorrect. If you dont have a account, create'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(
                                                    context, '/create_account');
                                              },
                                              child: Text('Create'),
                                            ),
                                          ],
                                        );
                                      });
                                }
                                if (controller.userModel.email == email &&
                                    controller.userModel.password == password) {
                                  Navigator.pushReplacementNamed(
                                      context, '/home_page');
                                } else if (controller.userModel.email ==
                                        email &&
                                    controller.userModel.password != password) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Wrong Password'),
                                          content: Text(
                                              'Your password is incorrect, do you want to reset your password?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    '/recovery_password');
                                              },
                                              child: Text('Reset'),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create_account');
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
