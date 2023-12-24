import 'package:app_login/provides/forgotviewmodel.dart';
import 'package:app_login/ui/app_constant.dart';
import 'package:app_login/ui/custom_control.dart';
import 'package:app_login/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageForgotPassword extends StatelessWidget {
  PageForgotPassword({super.key});
  static String routeName = '/forgot_password';
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ForgotViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: viewmodel.status == 3
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    Text(
                      "Request successfully",
                      style: AppConstant.textHeader,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Check your email",
                      style: AppConstant.textSize18,
                    ),
                    Text(
                      "to change your password ",
                      style: AppConstant.textSize18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          "Forgot Password",
                          style: AppConstant.textHeader,
                        ),
                        Text(
                          "Reset you password now",
                          style: AppConstant.textHeaderV2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        viewmodel.status == 2
                            ? Text(
                                viewmodel.errorMessage,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic),
                              )
                            : (const Text("")),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFill(
                          hintText: "enter your email",
                          textController: _emailController,
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            String email = _emailController.text.trim();

                            viewmodel.forgotPassword(email);
                          },
                          child: const CustomButton(
                            textButton: "SEND REQUEST",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.popAndPushNamed(
                                context, PageLogin.routeName),
                            child: Text(
                              "Login now",
                              style: AppConstant.textLink,
                            )),
                      ],
                    ),
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
