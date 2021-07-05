import 'package:flutter/material.dart';
import 'package:jujutsu_high/pages/login/login_controller.dart';
import 'package:jujutsu_high/shared/validator/input_text_validator.dart';
import 'package:jujutsu_high/shared/widgets/custom_input_text.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late LoginController controller = LoginController(onUpdate: () {
    setState(() {});
  });

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var name;
  var email;
  var password;

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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0XFF011629),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRect(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      CustomInputTextWidget(
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        onChanged: (value) => {name = value},
                                        validator: (value) =>
                                            InputTextValidator()
                                                .validateName(value!),
                                        labelText: "Insert Name",
                                        controller: _nameController,
                                        focusNode: _nameFocusNode,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomInputTextWidget(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        obscureText: false,
                                        onChanged: (value) => {email = value},
                                        validator: (value) =>
                                            InputTextValidator()
                                                .validateEmail(value!),
                                        labelText: "Insert Email",
                                        controller: _emailController,
                                        focusNode: _emailFocusNode,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomInputTextWidget(
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        onChanged: (value) =>
                                            {password = value},
                                        validator: (value) =>
                                            InputTextValidator()
                                                .validatePassword(value!),
                                        labelText: "Insert Password",
                                        controller: _passwordController,
                                        focusNode: _passwordFocusNode,
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  controller.userModel.name =
                                                      name;
                                                  controller.userModel.email =
                                                      email;
                                                  controller.userModel
                                                      .password = password;
                                                  controller.saveUser();
                                                  Navigator
                                                      .pushReplacementNamed(
                                                    context,
                                                    '/login',
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 250,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "Register",
                                                )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
