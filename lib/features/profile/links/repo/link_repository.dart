import 'package:bootcamp_starter/core/util/api_settings.dart';

import '../../../../core/util/api_base_helper.dart';
import '../../../../pref/shared_pref.dart';
import '../models/link_model.dart';

class LinkRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  String userToken = SharedPrefController().getValueFor("token");

  Future<List<Link>> fetchLinkList() async {
    final response = await _helper.get("/links", {
      'Authorization': 'Bearer $userToken',
    });
    return LinkResponse.fromJson(response).results;
  }

  Future<dynamic> addLink(String title,String link,String userName, String isActive) async {
    final response = await _helper.post(ApiSettings.usersLink, {
      "title":title,
      "link":link,
      "userName":userName,
      "isActive":isActive,
    }, {
      'Authorization':userToken
    });
    return LinkResponse.fromJson(response).results;
  }
}