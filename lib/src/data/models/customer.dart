// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Customer {
  final int customerId;
  final int userId;
  Customer({
    required this.customerId,
    required this.userId,
  });
  

  Customer copyWith({
    int? customerId,
    int? userId,
  }) {
    return Customer(
      customerId: customerId ?? this.customerId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'userId': userId,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      customerId: map['customerId'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Customer(customerId: $customerId, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Customer &&
      other.customerId == customerId &&
      other.userId == userId;
  }

  @override
  int get hashCode => customerId.hashCode ^ userId.hashCode;
}
