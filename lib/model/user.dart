class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? roles;
  String? imageProfile;
  String? token;

  User({
    this.id,
    this.email,
    this.name,
    this.roles,
    this.username,
    this.imageProfile,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    roles = json['roles'];
    imageProfile = json['profile_photo_url'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['roles'] = this.roles;
    data['profile_photo_url'] = this.imageProfile;
    return data;
  }
}
