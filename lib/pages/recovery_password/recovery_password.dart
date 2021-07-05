import 'package:flutter/material.dart';
import 'package:jujutsu_high/pages/login/login_controller.dart';
import 'package:jujutsu_high/shared/validator/input_text_validator.dart';
import 'package:jujutsu_high/shared/widgets/custom_input_text.dart';

class RecoveryPassword extends StatefulWidget {
  RecoveryPassword({Key? key}) : super(key: key);

  @override
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  late LoginController controller = LoginController(onUpdate: () {
    setState(() {});
  });

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmationController =
      TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _passwordConfirmationFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var password;
  var passwordConfirmation;

  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmationFocusNode.dispose();
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
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 32.0),
                                  child: Column(
                                    children: [
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
                                        height: 20,
                                      ),
                                      CustomInputTextWidget(
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        onChanged: (value) =>
                                            {passwordConfirmation = value},
                                        validator: (value) =>
                                            InputTextValidator()
                                                .validatePassword(value!),
                                        labelText: "Confirm Password",
                                        controller:
                                            _passwordConfirmationController,
                                        focusNode:
                                            _passwordConfirmationFocusNode,
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
                                                  if (password ==
                                                      passwordConfirmation) {
                                                    controller.userModel
                                                        .password = password;
                                                    controller.saveUser();
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context, '/login');
                                                  }
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
                                                  "Reset",
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
