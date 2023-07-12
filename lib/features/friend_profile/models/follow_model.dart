class FollowResponse{
  int? totalResults;
  List<Follow> results = [];

  FollowResponse.fromJson(Map<String, dynamic> json) {
    if (json['followee_id'] != null) {
      json['followee_id'].forEach((v) {
        results.add(Follow.fromJson(v));
      });
    }
  }
}


class Follow{
  int? id;
  int? followeeId;
  int? userId;


  Follow(
      {this.id,
        this.followeeId,
        this.userId,});

  Follow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    followeeId = json['followee_id'];
    userId = json['user_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['followee_id'] = followeeId;
    data['user_id'] = userId;

    return data;
  }
}
