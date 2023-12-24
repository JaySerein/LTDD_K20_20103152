import 'package:app_login/ui/app_constant.dart';
import 'package:app_login/ui/page_forgot_password.dart';
import 'package:app_login/ui/page_register.dart';
import '../provides/loginviewmodel.dart';
import 'custom_control.dart';
import 'page_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatelessWidget {
  PageLogin({super.key});
  static String routeName = '/login';

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if (viewmodel.status == 3) {
      viewmodel.status = 0;
      Future.delayed(Duration.zero, () {
        Navigator.popAndPushNamed(context, MainPage.routeName);
      });
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(),
                  Text(
                    "HELLO",
                    style: AppConstant.textHeader,
                  ),
                  Text(
                    "LONG TIME NO SEE",
                    style: AppConstant.textHeaderV2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  viewmodel.status == 2
                      ? Text(
                          viewmodel.errorMessage,
                          style: const TextStyle(
                              color: Colors.red, fontStyle: FontStyle.italic),
                        )
                      : (const Text("")),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFill(
                    hintText: "user name",
                    textController: _emailController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFill(
                    hintText: "password",
                    textController: _passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      String username = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      viewmodel.login(username, password);
                    },
                    child: const CustomButton(
                      textButton: "LOGIN",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Haven't account? ",
                        style: AppConstant.textSize18,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(
                            context, PageRegister.routeName),
                        child:
                            Text("register now", style: AppConstant.textLink),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(
                          context, PageForgotPassword.routeName),
                      child: Text(
                        "Forgot password?",
                        style: AppConstant.textLink,
                      )),
                ],
              ),
              viewmodel.status == 1 ? CustomLoading(size: size) : Container(),
            ],
          ),
        ),
      )),
    );
  }
}
