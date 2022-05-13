// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Branch {
  final int branchId;
  final int bankId;
  final String branchName;
  final String address;
  final DateTime created;
  Branch({
    required this.branchId,
    required this.bankId,
    required this.branchName,
    required this.address,
    required this.created,
  });

  Branch copyWith({
    int? branchId,
    int? bankId,
    String? branchName,
    String? address,
    DateTime? created,
  }) {
    return Branch(
      branchId: branchId ?? this.branchId,
      bankId: bankId ?? this.bankId,
      branchName: branchName ?? this.branchName,
      address: address ?? this.address,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchId': branchId,
      'bankId': bankId,
      'branchName': branchName,
      'address': address,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      branchId: map['branchId'] as int,
      bankId: map['bankId'] as int,
      branchName: map['branchName'] as String,
      address: map['address'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Branch(branchId: $branchId, bankId: $bankId, branchName: $branchName, address: $address, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Branch &&
      other.branchId == branchId &&
      other.bankId == bankId &&
      other.branchName == branchName &&
      other.address == address &&
      other.created == created;
  }

  @override
  int get hashCode {
    return branchId.hashCode ^
      bankId.hashCode ^
      branchName.hashCode ^
      address.hashCode ^
      created.hashCode;
  }
}
