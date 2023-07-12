import 'package:flutter/cupertino.dart';

import '../../../core/util/api_response.dart';
import '../models/follow_model.dart';
import '../repo/follow_repository.dart';

class FollowProvider extends ChangeNotifier {
  late FollowRepository _followRepository;

  late ApiResponse<List<Follow>> _followList;

  ApiResponse<List<Follow>> get followList => _followList;

  FollowProvider() {
    _followRepository = FollowRepository();
    fetchFollowList();
  }

  fetchFollowList() async {
    _followList = ApiResponse.loading('Fetching followers');
    notifyListeners();
    try {
      List<Follow> followers = await _followRepository.fetchFollowList();
      _followList = ApiResponse.completed(followers);
      notifyListeners();
    } catch (e) {
      _followList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}