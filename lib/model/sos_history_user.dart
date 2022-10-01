class SosHistoryUser {
  SosHistoryUser({this.message, this.location, this.time});

  String? message;
  String? location;
  String? time;

  factory SosHistoryUser.fromMap(Map<String, dynamic> json) => SosHistoryUser(
        message: json["text"],
        location: json["location"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "textext": message,
        "location": location,
        "time": time,
      };
}
