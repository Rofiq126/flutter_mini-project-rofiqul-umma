class UserLogin {
  String userName = '';
  String email = '';
  String password = '';
  String? profilePicture = '';
  UserLogin({
    required this.userName,
    required this.email,
    required this.password,
    this.profilePicture,
  });

  Map<String, dynamic> toMap() {
    var map = <String, Object?>{
      'userName': userName,
      'email': email,
      'password': password,
      'profilePicture': profilePicture
    };
    return map;
  }

  UserLogin.fromMap(Map<String, dynamic> map) {
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
    profilePicture = map['profilePicture'];
  }
}
