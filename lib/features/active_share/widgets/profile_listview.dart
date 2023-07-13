import 'package:bootcamp_starter/features/active_share/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/api_response.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';
import '../../onbording/user_location/providers/user_location_provider.dart';
import '../nearest/providers/nearest_provider.dart';


class ProfilesListView extends StatelessWidget {
  const ProfilesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<NearestProvider>(
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

          return Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: nearestProvider.nearestUsers!.data?.length,
                itemBuilder: (BuildContext context, int index){
                  return  ProfileCard(nearestUSer: nearestProvider.nearestUsers.data!.toList()[index].user.name);
                }),
          );
        },
      ),
    );

  }
}
