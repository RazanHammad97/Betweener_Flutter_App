import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/util/api_response.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';
import '../nearest/models/nearest.dart';
import '../nearest/providers/nearest_provider.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    super.key,
    required this.nearestUSer,
  });
  final String nearestUSer;


  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {

    NearestProvider nearestProvider  = NearestProvider();

    return Container(
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
      child: Card(
        color: kLightPrimaryColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Icon(
                  Icons.person,
                  size: 24,
                ),
              ),
              Consumer<NearestProvider>(
                builder: (_, nearestProvider, __) {
                  if (nearestProvider.nearestUsers.status ==
                      Status.LOADING) {
                    return const Center(
                      child: Text("loading"),
                    );
                  }
                  if (nearestProvider.nearestUsers.status ==
                      Status.ERROR) {
                    return Center(
                      child: Text('error'),
                    );
                  }

                  print(1);
                  print(nearestProvider.nearestUsers.data);

                  return Center(
                      child: Text(
                          " ${nearestProvider.nearestUsers.data}"));

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
