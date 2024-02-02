class UserModel {
  final int id;

  final String email;

  final String username;

  final String password;
  final String phone;
  final String fName;

  final String lName;

  UserModel({
    required this.id,
    required this.phone,
    required this.email,
    required this.lName,
    required this.fName,
    required this.password,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      email: json['phone'],
      lName: json['name']['firstname'],
      fName: json['name']['lastname'],
      password: json['password'],
      username: json['username'],
    );
  }
}
