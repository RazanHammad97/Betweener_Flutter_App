import 'package:flutter/cupertino.dart';
import '../../../../core/util/api_response.dart';
import '../models/link_model.dart';
import '../repo/link_repository.dart';

class LinkProvider extends ChangeNotifier {
  late LinkRepository _linkRepository;

  late ApiResponse<List<Link>> _linkList;
  late ApiResponse<Link> _link;

  ApiResponse<List<Link>> get linkList => _linkList;
  ApiResponse<Link> get link => _link;

  LinkProvider() {
    _linkRepository = LinkRepository();
    fetchLinkList();
    // addLink();
  }

  fetchLinkList() async {
    _linkList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<Link> links = await _linkRepository.fetchLinkList();
      _linkList = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
  addLink(String title,String linkk,String userName, String active) async {
    _link = ApiResponse.loading('Processing');
    notifyListeners();
    try {
      Link link = await _linkRepository.addLink(title,linkk,userName,active);
      _link = ApiResponse.completed(link);
      notifyListeners();
    } catch (e) {
      _link = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

}