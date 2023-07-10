import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/util/styles.dart';
import 'package:bootcamp_starter/features/profile/widget/link_container.dart';
import 'package:bootcamp_starter/features/profile/widget/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_link/add_link.dart';

class ProfileView extends StatelessWidget {
  static String id = '/profileView';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Profile',
            style: Styles.titleStyle, textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            SizedBox(
              height: 36.h,
            ),
            ProfileContainer(),
            SizedBox(
              height: 24.h,
            ),
            LinkContainer(),
            Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AddLink.id);
                  },
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: kPrimaryColor),
                    child: Icon(
                      Icons.add_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
