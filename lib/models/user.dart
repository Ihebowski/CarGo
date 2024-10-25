class User {
  String userId;
  String userFirstname;
  String userLastname;
  String userGender;
  String userEmail;
  String userPhone;
  String profilePicUrl;
  List favoriteCars = [];

  User({
    required this.userId,
    required this.userFirstname,
    required this.userLastname,
    required this.userGender,
    required this.userEmail,
    required this.userPhone,
    required this.profilePicUrl,
    required this.favoriteCars,
  });

  factory User.fromMap(Map<String, dynamic> data, String userId) {
    return User(
      userId: userId,
      userFirstname: data['userFirstname'],
      userLastname: data['userLastname'],
      userGender: data['userGender'],
      userEmail: data['userEmail'],
      userPhone: data['userPhone'],
      profilePicUrl: data['profilePicUrl'],
      favoriteCars:
          data['favoriteCars'] != null ? List.from(data['favoriteCars']) : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userFirstname': userFirstname,
      'userLastname': userLastname,
      'userGender': userGender,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'profilePicUrl': profilePicUrl,
      'favoriteCars': favoriteCars,
    };
  }
}
