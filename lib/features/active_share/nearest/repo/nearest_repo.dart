import 'package:bootcamp_starter/features/active_share/nearest/models/nearest.dart';

import '../../../../core/util/api_base_helper.dart';
import '../../../../core/util/api_settings.dart';
import '../../../../pref/shared_pref.dart';

class NearestRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();



  int id =SharedPrefController().getValueFor("id");
  String userToken = SharedPrefController().getValueFor("token");

  Future<dynamic> getNearestUsers() async {
    print(ApiSettings.nearestSender+"$id");
    print(userToken);
    final response = await _helper.get(ApiSettings.nearestSender+"$id", {
      'Authorization':'$userToken'
    });
    print( "razan response ${NearestUsersResponse.fromJson(response).nearestUsers}");
    return NearestUsersResponse.fromJson(response).nearestUsers;
  }


}