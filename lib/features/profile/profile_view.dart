import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/util/styles.dart';
import 'package:bootcamp_starter/features/profile/widget/link_container.dart';
import 'package:bootcamp_starter/features/profile/widget/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/link_api_controller.dart';
import '../../models/user_link_model.dart';
import '../add_link/add_link.dart';
import '../edit_user_info/edit_user_info.dart';

class ProfileView extends StatefulWidget {
  static String id = '/profileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
            FadeInRight(child: ProfileContainer(
              onPressed: () {
                Navigator.pushNamed(context, EditUserInfo.id);
              },
            )),
            SizedBox(
              height: 24.h,
            ),
            FutureBuilder<List<UserLinkModel>>(
              future: LinkApiController().getMyLink(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return FadeInLeft(
                      child: LinkContainer(
                    user: snapshot.data!,
                  ));
                } else {
                  return Center(
                    child: Text('NO DATA'),
                  );
                }
              },
            ),
            FadeInRight(
              child: Padding(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
