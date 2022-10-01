class SosMessage {
  SosMessage({this.message});

  String? message;

  factory SosMessage.fromMap(Map<String, dynamic> json) => SosMessage(
        message: json["customText"],
      );

  Map<String, dynamic> toMap() => {
        "customText": message,
      };
}
