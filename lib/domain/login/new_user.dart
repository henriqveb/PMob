class NewUser {
  late String username;
  late String password;
  late String email;
  late String fullName;

  NewUser({required this.username, required this.password, required this.email, required this.fullName,});

  NewUser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    return data;
  }
}