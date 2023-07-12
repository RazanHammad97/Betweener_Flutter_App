
import 'package:bootcamp_starter/features/friend_profile/models/follow_model.dart';

import '../../../core/util/api_base_helper.dart';
import '../../../core/util/api_settings.dart';

class FollowRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  String userToken = '200|KdHhbLjL3X8XEYEkDJNpGTJItQ1eXRNV6Z4whGuH';

  Future<List<Follow>> fetchFollowList() async {
    final response = await _helper.get("/follow", {
      'Authorization': 'Bearer $userToken',
    });
    return FollowResponse.fromJson(response).results;
  }

  Future<dynamic> addFollow() async {
    final response = await _helper.post("", {}, {});
    return FollowResponse.fromJson(response).results;
  }

}