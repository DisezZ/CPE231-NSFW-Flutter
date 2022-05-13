// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  final int accountId;
  final int customerId;
  final int branchId;
  final int membershipId;
  final double balance;
  final DateTime created;
  Account({
    required this.accountId,
    required this.customerId,
    required this.branchId,
    required this.membershipId,
    required this.balance,
    required this.created,
  });

  Account copyWith({
    int? accountId,
    int? customerId,
    int? branchId,
    int? membershipId,
    double? balance,
    DateTime? created,
  }) {
    return Account(
      accountId: accountId ?? this.accountId,
      customerId: customerId ?? this.customerId,
      branchId: branchId ?? this.branchId,
      membershipId: membershipId ?? this.membershipId,
      balance: balance ?? this.balance,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountId': accountId,
      'customerId': customerId,
      'branchId': branchId,
      'membershipId': membershipId,
      'balance': balance,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountId: map['accountId'] as int,
      customerId: map['customerId'] as int,
      branchId: map['branchId'] as int,
      membershipId: map['membershipId'] as int,
      balance: map['balance'] as double,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(accountId: $accountId, customerId: $customerId, branchId: $branchId, membershipId: $membershipId, balance: $balance, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Account &&
      other.accountId == accountId &&
      other.customerId == customerId &&
      other.branchId == branchId &&
      other.membershipId == membershipId &&
      other.balance == balance &&
      other.created == created;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
      customerId.hashCode ^
      branchId.hashCode ^
      membershipId.hashCode ^
      balance.hashCode ^
      created.hashCode;
  }
}
