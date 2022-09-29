class SignUpInput {
  SignUpInput(
      {this.email,
      this.password,
      this.phoneNumber,
      this.confirmPassword,
      this.address,
      this.gender,
      this.age,
      this.name,
      this.id});

  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? name;
  String? address;
  String? gender;
  String? age;
  String? id;

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "confirmpassword": password,
        "phone": phoneNumber,
        "name": name,
        "address": address,
        "age": age,
        "gender": gender,
      };

  factory SignUpInput.fromMap(Map<String, dynamic> json) => SignUpInput(
      email: json["email"],
      password: json["password"],
      // phone: json["phoneNumber"],
      name: json["name"],
      id: json["_id"]);
}
