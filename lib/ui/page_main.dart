import 'package:app_login/model/profile.dart';
import 'package:app_login/provides/mainviewmidel.dart';
import 'package:app_login/ui/app_constant.dart';
import 'package:app_login/ui/page_fill_info.dart';
import 'package:app_login/ui/page_login.dart';
import 'package:app_login/ui/sp_course.dart';
import 'package:app_login/ui/sp_register_course.dart';
import 'package:app_login/ui/sp_list_student.dart';
import 'package:app_login/ui/sp_profile.dart';
import 'package:app_login/ui/sp_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static String routeName = '/home';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewmodel = Provider.of<MainViewModel>(context);
    Profile profile = Profile();
    if (profile.token == "") {
      return PageLogin();
    }
    if (profile.student.msSV == "") {
      return const PageFillInfo();
    }
    Widget body = const SPTrangChu();
    if (viewmodel.activeMenu == SPProfile.idPage) {
      body = SPProfile();
    } else if (viewmodel.activeMenu == SPRegisterCourse.idPage) {
      body = const SPRegisterCourse();
    } else if (viewmodel.activeMenu == SPCourse.idPage) {
      body = const SPCourse();
    } else if (viewmodel.activeMenu == SPListSV.idPage) {
      body = const SPListSV();
    } else if (viewmodel.activeMenu == SPTrangChu.idPage) {
      body = const SPTrangChu();
    }
    return Scaffold(
        appBar: AppBar(
          leadingWidth: size.width,
          leading: Container(
            decoration: BoxDecoration(gradient: AppConstant.colorGradient),
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "QUẢN LÝ SINH VIÊN - K20",
                    style: AppConstant.textButton,
                  ),
                  GestureDetector(
                    onTap: () {
                      viewmodel.logout();
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: size.width,
                      height: size.height,
                      child: Container(
                          color: Colors.blue, child: Center(child: body)),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: 50,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Future.delayed(
                          Duration.zero,
                          () => viewmodel.setActive(0),
                        );
                      },
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: viewmodel.activeMenu == 0
                            ? const Color.fromARGB(255, 0, 102, 255)
                            : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Future.delayed(
                          Duration.zero,
                          () => viewmodel.setActive(3),
                        );
                      },
                      child: Icon(
                        Icons.line_style,
                        size: 25,
                        color: viewmodel.activeMenu == 3
                            ? const Color.fromARGB(255, 0, 102, 255)
                            : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Future.delayed(
                          Duration.zero,
                          () => viewmodel.setActive(2),
                        );
                      },
                      child: Icon(
                        Icons.class_,
                        size: 25,
                        color: viewmodel.activeMenu == 2
                            ? const Color.fromARGB(255, 0, 102, 255)
                            : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Future.delayed(
                          Duration.zero,
                          () => viewmodel.setActive(4),
                        );
                      },
                      child: Icon(
                        Icons.group_rounded,
                        size: 25,
                        color: viewmodel.activeMenu == 4
                            ? const Color.fromARGB(255, 0, 102, 255)
                            : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Future.delayed(
                          Duration.zero,
                          () => viewmodel.setActive(1),
                        );
                      },
                      child: Icon(
                        Icons.person_sharp,
                        size: 25,
                        color: viewmodel.activeMenu == 1
                            ? const Color.fromARGB(255, 0, 102, 255)
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
