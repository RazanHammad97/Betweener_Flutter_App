import 'package:bootcamp_starter/features/onbording/user_location/models/user_location.dart';
import 'package:bootcamp_starter/features/onbording/user_location/repos/user_location_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/util/api_response.dart';

class UserLocationProvider extends ChangeNotifier {
  late UserLocationRepository _userLocationRepository;

  late ApiResponse<User> _userLocation;

  ApiResponse<User> get userLocation => _userLocation;

  UserLocationProvider() {
    _userLocationRepository = UserLocationRepository();
    updateUserLocation();
  }

  updateUserLocation() async {
    _userLocation = ApiResponse.loading("Fetching User Location");
    notifyListeners();
    try {
      print("before ");
      User ul = await _userLocationRepository.updateLocation();
      print("after");
      _userLocation = ApiResponse.completed(ul);
      print(_userLocation);
      notifyListeners();
    } catch (e) {
      _userLocation = ApiResponse.error(e.toString());
      print(_userLocation);
      notifyListeners();
    }
  }
}
