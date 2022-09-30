class Guardian {
  Guardian({this.guardianName, this.guardianPhone});

  String? guardianName;
  int? guardianPhone;

  factory Guardian.fromMap(Map<String, dynamic> json) => Guardian(
        guardianName: json["name"],
        guardianPhone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "name": guardianName,
        "phone": guardianPhone,
      };
}
