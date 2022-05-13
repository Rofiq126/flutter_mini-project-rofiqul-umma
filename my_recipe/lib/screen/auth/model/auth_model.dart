class UserData {
  String? userName;
  String? email;
  String? password;
  String? profilePicture;
  String? bannerPicture;
  UserData({
    this.userName,
    this.email,
    this.password,
    this.profilePicture,
    this.bannerPicture
  });

  Map<String, dynamic> toMap() {
    var map = <String, Object?>{
      'userName': userName,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'bannerPicture': bannerPicture,
    };
    return map;
  }

  UserData.fromMap(Map<String, dynamic> map) {
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
    profilePicture = map['profilePicture'];
    bannerPicture = map['bannerPicture'];
  }
}
