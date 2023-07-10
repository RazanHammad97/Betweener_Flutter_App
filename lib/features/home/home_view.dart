import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/main_app/widgets/custom_floating_nav_bar.dart';

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
    return Scaffold(
      bottomNavigationBar: CustomFloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          AssetsData.qrScanLine,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          AssetsData.serach,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Razan!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 36,),
              SizedBox(
                  width: 318,
                  height: 342,
                  child: Image.asset(AssetsData.scanner)),
              SizedBox(
                  width: 198,
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  )),
              SizedBox(height: 24,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orangeAccent,
                    ),
                    width: 116,
                    height: 79,
                    child: Column(
                      children: [Text("Facebook"), Text("@Razan")],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orangeAccent,
                    ),
                    width: 116,
                    height: 79,
                    child: Column(
                      children: [Text("Twitter"), Text("@Razan")],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orangeAccent,
                    ),
                    width: 116,
                    height: 79,
                    child: Column(
                      children: [Text("Instagram"), Text("@Razan")],
                    ),
                  ),
                ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
