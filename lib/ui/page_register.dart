import 'package:app_login/model/profile.dart';
import 'package:app_login/provides/registerviewmodel.dart';
import 'package:app_login/ui/app_constant.dart';
import 'package:app_login/ui/custom_control.dart';
import 'package:app_login/ui/page_login.dart';
import 'package:app_login/ui/page_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  static String routeName = '/register';
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();
  bool agree = true;
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    final profile = Profile();
    if (profile.token != "") {
      Future.delayed(Duration.zero, () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      });
    }
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: viewmodel.status == 3 || viewmodel.status == 4
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    Text(
                      "Registered successfully",
                      style: AppConstant.textHeader,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    viewmodel.status == 3
                        ? Text(
                            "You need to confirm your email!",
                            style: AppConstant.textHeaderV2,
                          )
                        : const Text(""),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome to us, ",
                          style: AppConstant.textSize18,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.popAndPushNamed(
                              context, PageLogin.routeName),
                          child: Text(
                            "login now",
                            style: AppConstant.textLink,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppLogo(),
                          Text(
                            "Register",
                            style: AppConstant.textHeader,
                          ),
                          Text(
                            "create your account",
                            style: AppConstant.textHeaderV2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            viewmodel.errorMessage,
                            style: AppConstant.textError,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFill(
                              textController: _usernameController,
                              hintText: "username",
                              obscureText: false),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFill(
                              textController: _emailController,
                              hintText: "email",
                              obscureText: false),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFill(
                              textController: _pass1Controller,
                              hintText: "password",
                              obscureText: true),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFill(
                              textController: _pass2Controller,
                              hintText: "repassword",
                              obscureText: true),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    shape: const CircleBorder(),
                                    activeColor: Colors.blue,
                                    value: viewmodel.agree,
                                    onChanged: (value) {
                                      viewmodel.setAgree(value!);
                                    },
                                  ),
                                ),
                                Text(
                                  "Accept ",
                                  style: AppConstant.textSize18,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                title: const Text("The Terms"),
                                                content: SingleChildScrollView(
                                                    child:
                                                        Text(viewmodel.terms)),
                                              ));
                                    },
                                    child: Text(
                                      "the terms",
                                      style: AppConstant.textLink,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                              onTap: () {
                                final username =
                                    _usernameController.text.trim();
                                final email = _emailController.text.trim();
                                final pass1 = _pass1Controller.text.trim();
                                final pass2 = _pass2Controller.text.trim();
                                viewmodel.register(
                                    username, email, pass1, pass2);
                              },
                              child:
                                  const CustomButton(textButton: "REGISTER")),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have account? ",
                                style: AppConstant.textSize18,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.popAndPushNamed(
                                    context, PageLogin.routeName),
                                child: Text("login now",
                                    style: AppConstant.textLink),
                              ),
                            ],
                          )
                        ]),
                    viewmodel.status == 1
                        ? CustomLoading(size: size)
                        : Container(),
                  ],
                ),
        ),
      )),
    );
  }
}
