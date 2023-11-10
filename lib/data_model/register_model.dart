class RegisterModel {
  String? firstName, lastName;
  String? email, phoneNumber, password;

  Map<String, dynamic> toJSON() {
    return {
      "id": 0,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone_number": phoneNumber
    };
  }
}
