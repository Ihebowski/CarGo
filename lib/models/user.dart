import 'car.dart';

class User {
  String userId;
  String userFirstname;
  String userLastname;
  String userBirthday;
  String userGender;
  String userEmail;
  String userPhone;

  User({
    required this.userId,
    required this.userFirstname,
    required this.userLastname,
    required this.userBirthday,
    required this.userGender,
    required this.userEmail,
    required this.userPhone
  });

  factory User.fromMap(Map<String, dynamic> data, String userId) {
    return User(
      userId: userId,
      userFirstname: data['userFirstname'],
      userLastname: data['userLastname'],
      userBirthday: data['userBirthday'],
      userGender: data['userGender'],
      userEmail: data['userEmail'],
      userPhone: data['userPhone'],
    );
  }
}
