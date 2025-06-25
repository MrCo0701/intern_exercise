class UserModel {
  final String email;
  final String userName;
  final String password;
  final String lastName;
  final String firstName;

  UserModel({
    required this.email,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };
  }
}
