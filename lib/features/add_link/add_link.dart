import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';

class AddLink extends StatelessWidget {
  AddLink({super.key});
  static String id = '/AddLink';

  final TextEditingController _textTitleController = TextEditingController();
  final TextEditingController _textLinkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Add Link",
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          backgroundColor: Colors.black45,
        ),
        body: FadeInLeft(
          child: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 80.h),
                  child: Column(
                    children: [
                      PrimaryLabeledTextFieldWidget(
                        controller: _textTitleController,
                        hint: 'Title',
                        keyboardType: TextInputType.emailAddress,
                        label: 'Title',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PrimaryLabeledTextFieldWidget(
                        controller: _textLinkController,
                        hint: 'Link',
                        keyboardType: TextInputType.emailAddress,
                        label: 'Link',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      SecondaryButtonWidget(
                        width: 100.w,
                        onTap: () {},
                        text: 'Add ',
                      ),
                    ],
                  ))),
        ));
  }
}
