import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/link_api_controller.dart';
import '../../pref/shared_pref.dart';
import 'package:bootcamp_starter/features/home/search.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 1;

  late List<Widget?> screensList = [
    const ReceiveView(),
    const HomeView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    String name = SharedPrefController().getValueFor('name');
    return Scaffold(
      bottomNavigationBar: CustomFloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: FadeInLeft(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: Image.asset(
                            AssetsData.qrScanLine,
                          )),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextButton(
                      onPressed: () async {
                        showSearch(context: context, delegate: DataSearch());
                      },
                      child: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: Image.asset(
                            AssetsData.serach,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 46.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, $name!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.sp),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 36,),
                GestureDetector(
                  onLongPress: () {
                    Navigator.pushNamed(context, ReceiveView.id);
                  },
                  child: SizedBox(
                      width: 318.w,
                      height: 342.h,
                      child: Image.asset(AssetsData.scanner)),
                ),
                SizedBox(
                    width: 198.w,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    )),
                SizedBox(
                  height: 24.h,
                ),
                FutureBuilder(
                    future: LinkApiController().getMyLink(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 12.w,
                                    right: 12.w,
                                    top: 20.h,
                                    bottom: 30.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.orangeAccent,
                                  ),
                                  width: 116.w,
                                  height: 50.h,
                                  child: Column(
                                    children: [
                                      Text(snapshot.data![index].title),
                                      Text('@${snapshot.data![index].username}')
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('No Link Yet'),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
