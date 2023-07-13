class NearestUsersResponse {
  NearestUsersResponse({
    required this.count,
    required this.nearestUsers,
  });
  late final int count;
  late final List<NearestUsers> nearestUsers;

  NearestUsersResponse.fromJson(Map<String, dynamic> json){
    count = json['count'];
    nearestUsers = List.from(json['nearest-users']).map((e)=>NearestUsers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['nearest-users'] = nearestUsers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class NearestUsers {
  NearestUsers({
  required this.id,
  required this.userId,
  required this.type,
  required this.createdAt,
  required this.updatedAt,
  required this.distance,
  required this.user,
});
late final int id;
late final int userId;
late final String type;
late final String createdAt;
late final String updatedAt;
late final int distance;
late final User user;

  NearestUsers.fromJson(Map<String, dynamic> json){
id = json['id'];
userId = json['user_id'];
type = json['type'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
distance = json['distance'];
user = User.fromJson(json['user']);
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['id'] = id;
  _data['user_id'] = userId;
  _data['type'] = type;
  _data['created_at'] = createdAt;
  _data['updated_at'] = updatedAt;
  _data['distance'] = distance;
  _data['user'] = user.toJson();
  return _data;
}
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    this.country,
    this.ip,
    required this.long,
    required this.lat,
    this.fcm,
  });
  late final int id;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;
  late final int isActive;
  late final Null country;
  late final Null ip;
  late final double long;
  late final double lat;
  late final String? fcm;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = null;
    ip = null;
    long = json['long'];
    lat = json['lat'];
    fcm = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['isActive'] = isActive;
    _data['country'] = country;
    _data['ip'] = ip;
    _data['long'] = long;
    _data['lat'] = lat;
    _data['fcm'] = fcm;
    return _data;
  }
}