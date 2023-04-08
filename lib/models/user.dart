class User {
  String? email;
  String? password;
  String? username;
  String? bio;
  String? id;
  List? followers;
  List? following;
  String? avatarUrl;

  User({
    this.email,
    this.password,
    this.username,
    this.bio,
    this.id,
    this.followers,
    this.following,
    this.avatarUrl,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "avatarUrl": avatarUrl,
        "id": id,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}
