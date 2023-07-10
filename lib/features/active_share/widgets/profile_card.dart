import 'package:flutter/material.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';



class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6)
      ),
      child:  Card(
        color: kLightPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Padding(
                padding:  EdgeInsets.only(right: 8.0),
                child: Icon(Icons.person,size: 24,),
              ),
              Text('username'.toUpperCase(),style: Styles.textStyle14,),
            ],
          ),
        ),
      ),
    );
  }
}
