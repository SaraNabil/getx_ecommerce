class UserModel {
  String? userId, username, email, image;

  UserModel({
    this.userId = '-1',
    this.username = '',
    this.email = '',
    this.image = '',
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    username = map['username'];
    email = map['email'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'image': image,
    };
  }
}
