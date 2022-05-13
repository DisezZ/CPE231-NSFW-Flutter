// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Manager {
  final int managerId;
  final int userId;
  Manager({
    required this.managerId,
    required this.userId,
  });

  Manager copyWith({
    int? managerId,
    int? userId,
  }) {
    return Manager(
      managerId: managerId ?? this.managerId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'managerId': managerId,
      'userId': userId,
    };
  }

  factory Manager.fromMap(Map<String, dynamic> map) {
    return Manager(
      managerId: map['managerId'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Manager.fromJson(String source) => Manager.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Manager(managerId: $managerId, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Manager &&
      other.managerId == managerId &&
      other.userId == userId;
  }

  @override
  int get hashCode => managerId.hashCode ^ userId.hashCode;
}
