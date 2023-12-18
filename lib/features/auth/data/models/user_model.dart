class UserModel {
  final int? id;
  final String email;
  final String userName;
  final String fName;
  final String lName;
  final String password;
  final String phone;

  UserModel({
    required this.phone,
    required this.email,
    required this.password,
    required this.fName,
    required this.lName,
    required this.userName,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      fName: json['name']['firstname'],
      lName: json['name']['lastname'],
      userName: json['username'],
      id: json['id'],
    );
  }

  toMap(){
    return {
      'email':email,
      'username':userName,
      'password':password,
      'name':{
        'firstname':fName,
        'lastname':lName
      },
      'phone':phone
    };
  }
}
