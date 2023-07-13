class UserLocationModel {
  UserLocationModel({
    required this.user,
  });
  late final User user;

  UserLocationModel.fromJson(Map<String, dynamic> json){
    if(json["user"]!=null){
       user = User.fromJson(json['user']);
    }

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.lat,
    required this.long,
  });
  late final String lat;
  late final String long;

  User.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['long'] = long;
    return _data;
  }
}