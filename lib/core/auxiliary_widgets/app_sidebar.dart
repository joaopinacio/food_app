import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

class AppSidebar extends StatelessWidget {
  final bool isRestaurant;
  final Function() onTapLogout;

  const AppSidebar({
    Key? key,
    required this.isRestaurant,
    required this.onTapLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 140.h,
              child: DrawerHeader(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextStyles.bold_24(text: "Admin", color: Colors.white),
                      IconButton(
                        icon: Icon(Icons.logout),
                        color: Colors.white,
                        onPressed: onTapLogout,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppThemes.colors.primaryColor,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isRestaurant,
            child: ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.edit_rounded,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  AppTextStyles.bold_14(text: 'edit_restaurant'.tr),
                ],
              ),
              onTap: () {
                Get.toNamed(AppPages.instance.restaurantEdit);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 48);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 55);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
