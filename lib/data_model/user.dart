class User {
  int? id;
  String? firstname;
  String? lastName;
  String? email;
  String? phoneNumber;
  int? isLoggedIn;

  User({
    this.id,
    this.firstname,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.isLoggedIn,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isLoggedIn = json['isLoggedIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstname;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['isLoggedIn'] = isLoggedIn;
    return data;
  }
}
