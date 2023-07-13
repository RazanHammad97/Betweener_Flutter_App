import 'package:bootcamp_starter/features/onbording/user_location/models/user_location.dart';
import '../../../../core/util/api_base_helper.dart';
import '../../../../core/util/api_settings.dart';
import '../../../../pref/shared_pref.dart';

class UserLocationRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  int id = SharedPrefController().getValueFor("id");
  String userToken = SharedPrefController().getValueFor("token");

  Future<dynamic> updateLocation() async {
    print(ApiSettings.updateUserLocation + "$id");
    print(userToken);
    final response = await _helper.put(ApiSettings.updateUserLocation + "$id",
        {"lat": "31.5123", "long": "34.472"}, {'Authorization': '$userToken'});
    print(
        "razan response ${UserLocationModel.fromJson(response).user.toJson()}");
    return UserLocationModel.fromJson(response).user;
  }
}
