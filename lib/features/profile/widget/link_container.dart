import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';

class LinkContainer extends StatelessWidget {
  const LinkContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          var ContainerColor = Color(0xffFEE2E7);
          var titleColor = Color(0xff783341);
          var subTitleColor = Color(0xff9B6A73);
          if (index % 2 != 0) {
            ContainerColor = Color(0xffE7E5F1);
            titleColor = kPrimaryColor;
            subTitleColor = Color(0xff807D99);
          }
          return Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Container(
                height: 60.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.edit_rounded, color: Colors.white),
              ),
            ),
            secondaryBackground: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Container(
                height: 60.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: kDangerColor,
                    borderRadius: BorderRadius.circular(10.r)),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {}
              if (direction == DismissDirection.startToEnd) {}
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Container(
                height: 60.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: ContainerColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instagram',
                        style: Styles.profileContenairLinkesStyle.copyWith(
                          color: titleColor,
                        ),
                      ),
                      Text(
                        'https://www.instagram.com/a7medhq/',
                        style: Styles.profileContenairLinkesStyle.copyWith(
                          color: subTitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
