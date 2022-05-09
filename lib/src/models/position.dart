import 'dart:convert';

Position positionFromJson(String str) => Position.fromJson(json.decode(str));

String positionToJson(Position data) => json.encode(data.toJson());

class Position {
  final int positionId;
  final String positionName;

  Position({
    required this.positionId,
    required this.positionName,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        positionId: json["positionId"],
        positionName: json["positionName"],
      );

  Map<String, dynamic> toJson() => {
        "positionId": positionId,
        "positionName": positionName,
      };
}
