import 'package:bootcamp_starter/features/active_share/widgets/profile_listview.dart';
import 'package:flutter/material.dart';

import '../../core/util/assets.dart';
import '../../core/util/styles.dart';


class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 32.0,left: 32.0,bottom: 32.0,top: 32.0),
          child: Column(
            children: [
              Text('Active Sharing',style: Styles.textStyle14.copyWith(fontSize: 24),),
              const SizedBox(height: 40,),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Hero(
                      tag: 'activeSharingImage',
                      child: Image.asset('assets/imgs/active_sharing.png'))),
              const SizedBox(height: 34,),
              const ProfilesListView()
            ],
          ),
        ),
      ),
    );
  }
}


