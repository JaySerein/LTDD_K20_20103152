import 'package:app_login/model/course.dart';
import 'package:app_login/provides/courseviewmodel.dart';
// import 'package:app_login/provides/mainviewmidel.dart';
import 'package:app_login/ui/app_constant.dart';
import 'package:app_login/ui/custom_control.dart';
import 'package:flutter/material.dart';

class SPRegisterCourse extends StatefulWidget {
  const SPRegisterCourse({super.key});
  static int idPage = 2;

  @override
  State<SPRegisterCourse> createState() => _SPRegisterCourseState();
}

class _SPRegisterCourseState extends State<SPRegisterCourse> {
  List<RegisterCourse>? list = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: AppConstant.backgroundColor,
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "HỌC PHẦN ĐÃ ĐĂNG KÍ",
                  style: AppConstant.textHeaderV2,
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: CourseViewModel().getRegisterCourse(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CustomLoading(size: size);
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else {
                      list = snapshot.data;
                      return Container(
                        padding: const EdgeInsets.all(10),
                        width: size.width,
                        height: size.height,
                        child: ListView.builder(
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 80,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  list![index].tenhocphan,
                                  style: AppConstant.textCourseBold,
                                ),
                                subtitle: Text(
                                  "Giảng viên: ${list![index].tengv}",
                                  style: AppConstant.textCourse,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
