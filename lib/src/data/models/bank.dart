// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bank {
  final int bankId;
  final int managerId;
  final int bankName;
  final DateTime created;
  Bank({
    required this.bankId,
    required this.managerId,
    required this.bankName,
    required this.created,
  });

  Bank copyWith({
    int? bankId,
    int? managerId,
    int? bankName,
    DateTime? created,
  }) {
    return Bank(
      bankId: bankId ?? this.bankId,
      managerId: managerId ?? this.managerId,
      bankName: bankName ?? this.bankName,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankId': bankId,
      'managerId': managerId,
      'bankName': bankName,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      bankId: map['bankId'] as int,
      managerId: map['managerId'] as int,
      bankName: map['bankName'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bank(bankId: $bankId, managerId: $managerId, bankName: $bankName, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Bank &&
      other.bankId == bankId &&
      other.managerId == managerId &&
      other.bankName == bankName &&
      other.created == created;
  }

  @override
  int get hashCode {
    return bankId.hashCode ^
      managerId.hashCode ^
      bankName.hashCode ^
      created.hashCode;
  }
}
