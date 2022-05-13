// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Employee {
  final int employeeId;
  final int userId;
  Employee({
    required this.employeeId,
    required this.userId,
  });

  Employee copyWith({
    int? employeeId,
    int? userId,
  }) {
    return Employee(
      employeeId: employeeId ?? this.employeeId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeId': employeeId,
      'userId': userId,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      employeeId: map['employeeId'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Employee(employeeId: $employeeId, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employee &&
        other.employeeId == employeeId &&
        other.userId == userId;
  }

  @override
  int get hashCode => employeeId.hashCode ^ userId.hashCode;
}
