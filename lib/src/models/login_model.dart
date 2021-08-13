class LoginModel {
  String? password;

  LoginModel({required this.password});

  Map<String, dynamic> toJsonLogin() => {'password': password};
}
