import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/google_button_widget.dart';

class RegisterView extends StatelessWidget {
  static String id = '/registerView';

  TextEditingController nameController = TextEditingController(text: 'ss');
  TextEditingController emailController =
      TextEditingController(text: 'ss@ss.com');
  TextEditingController passwordController = TextEditingController(text: '123');

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: FadeInLeft(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              child: Column(
                children: [
                  const Spacer(),
                  FadeInRight(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Hero(
                            tag: 'authImage',
                            child: SvgPicture.asset(AssetsData.authImage))),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: nameController,
                    hint: 'John Doe',
                    label: 'Name',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: emailController,
                    hint: 'example@gmail.com',
                    label: 'Email',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: passwordController,
                    hint: 'Enter password',
                    label: 'password',
                    password: true,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SecondaryButtonWidget(onTap: () {}, text: 'REGISTER'),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    '-  or  -',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GoogleButtonWidget(onTap: () {}),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
