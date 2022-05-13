// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Atm {
  final int atmId;
  final int branchId;
  Atm({
    required this.atmId,
    required this.branchId,
  });

  Atm copyWith({
    int? atmId,
    int? branchId,
  }) {
    return Atm(
      atmId: atmId ?? this.atmId,
      branchId: branchId ?? this.branchId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'atmId': atmId,
      'branchId': branchId,
    };
  }

  factory Atm.fromMap(Map<String, dynamic> map) {
    return Atm(
      atmId: map['atmId'] as int,
      branchId: map['branchId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Atm.fromJson(String source) => Atm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Atm(atmId: $atmId, branchId: $branchId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Atm &&
      other.atmId == atmId &&
      other.branchId == branchId;
  }

  @override
  int get hashCode => atmId.hashCode ^ branchId.hashCode;
}
