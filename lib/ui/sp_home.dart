import 'package:app_login/ui/app_constant.dart';
import 'package:flutter/material.dart';

class SPTrangChu extends StatelessWidget {
  const SPTrangChu({super.key});
  static int idPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: AppConstant.backgroundColor,
        child: Center(
            child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "BÀI VIẾT",
                style: AppConstant.textHeaderV2,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomPost(
                image: 'assets/images/home_1.jpg',
                size: size,
                title: "Tuyển sinh 2023",
                subtitle: "Thông tin tuyển sinh Đại học Tây Nguyên 2023",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPost(
                image: 'assets/images/home_2.jpg',
                size: size,
                title: "Lịch sử Đại học Tây Nguyên",
                subtitle: "Lịch sử thành lập Đại học Tây Nguyên",
              )
            ],
          ),
        )));
  }
}

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final Size size;
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
        ListTile(
          title: Text(
            title,
            style: AppConstant.textCourseBold,
          ),
          subtitle: Text(
            subtitle,
            style: AppConstant.textCourse,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: size.width * 0.4,
              height: 30,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  gradient: AppConstant.colorGradient,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.keyboard_control,
                color: Colors.white,
                size: 30,
              ),
            ),
            Container(
              width: size.width * 0.4,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: AppConstant.colorGradient,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.thumb_up_alt_sharp,
                color: Colors.white,
                size: 15,
              ),
            )
          ],
        )
      ]),
    );
  }
}
