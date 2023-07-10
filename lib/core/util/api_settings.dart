class ApiSettings {
  // var id = '';
  static const _baseUrl = "http://osamapro.online/api";
  static const register = '$_baseUrl/register';
  static const login = '$_baseUrl/login';
  static const updateUserLocation = '$_baseUrl/update/8';
  static const usersLink = '$_baseUrl/links'; //addLink with usersLink req
  static const newUpdateFCM  = '$_baseUrl/fcm/{{id}}';
  static const activeShare = '$_baseUrl/activeShare/{{id}}'; //delete with active share req
  static const nearestSender = '$_baseUrl/activeShare/nearest/{{id}}';
  static const linkReq = '$_baseUrl/links/5'; // delete and update link req
  static const followers = '$_baseUrl/follow'; // followers and addFollow link req
  static const search = '$_baseUrl/search';

}
