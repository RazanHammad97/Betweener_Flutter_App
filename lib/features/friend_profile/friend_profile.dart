import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/util/constants.dart';
import '../../core/util/styles.dart';
import '../../models/user_model.dart';
import '../profile/widget/profile_container.dart';

class FriendProfile extends StatelessWidget {
  static String id = '/friendProfile';

  const FriendProfile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "${user.name}",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp),
        ),
        centerTitle: true,
        toolbarHeight: 100.h,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FadeInLeft(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Column(
            children: [
              SizedBox(height: 36.h),
              FadeInRight(
                  child: Container(
                height: 126.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 18.w, left: 24.w, bottom: 21.h, top: 21.h),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 14.0.w, top: 8.h, bottom: 8.h, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.name}',
                          style: Styles.textStyle,
                        ),
                        Text(
                          '${user.email}',
                          style: Styles.textStyle.copyWith(fontSize: 12.sp),
                        ),
                        Text(
                          '${user.id}',
                          style: Styles.textStyle.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
