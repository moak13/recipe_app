class User {
  int? id;
  String? firstname;
  String? lastName;
  String? email;
  String? phoneNumber;

  User({
    this.id,
    this.firstname,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstname;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
