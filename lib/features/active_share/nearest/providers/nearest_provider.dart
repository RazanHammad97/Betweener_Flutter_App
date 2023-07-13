import 'package:bootcamp_starter/features/active_share/nearest/models/nearest.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/util/api_response.dart';
import '../repo/nearest_repo.dart';

class NearestProvider extends ChangeNotifier{
  late NearestRepository _nearestRepository;

  late ApiResponse<List<NearestUsers>> _nearestUsers;

  ApiResponse<List<NearestUsers>>  get nearestUsers => _nearestUsers;

  NearestProvider() {
    _nearestRepository = NearestRepository();
    fetchNearestRepository();
  }

  fetchNearestRepository() async {
    _nearestUsers = ApiResponse.loading("Fetching nearest users");
    notifyListeners();
    try {
      print("before ");
    List<NearestUsers>  nu = await _nearestRepository.getNearestUsers();
      print("after");
      _nearestUsers = ApiResponse.completed(nu);
      print(_nearestUsers);
      notifyListeners();
    } catch (e) {
      _nearestUsers = ApiResponse.error(e.toString());
      print(_nearestUsers);
      notifyListeners();
    }
  }
}