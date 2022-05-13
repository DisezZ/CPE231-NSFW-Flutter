// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Membership {
  final int membershipId;
  final String membershipName;
  final double loanAmount;
  final int loanInterestRate;
  final int depositInterestRate;
  Membership({
    required this.membershipId,
    required this.membershipName,
    required this.loanAmount,
    required this.loanInterestRate,
    required this.depositInterestRate,
  });

  Membership copyWith({
    int? membershipId,
    String? membershipName,
    double? loanAmount,
    int? loanInterestRate,
    int? depositInterestRate,
  }) {
    return Membership(
      membershipId: membershipId ?? this.membershipId,
      membershipName: membershipName ?? this.membershipName,
      loanAmount: loanAmount ?? this.loanAmount,
      loanInterestRate: loanInterestRate ?? this.loanInterestRate,
      depositInterestRate: depositInterestRate ?? this.depositInterestRate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'membershipId': membershipId,
      'membershipName': membershipName,
      'loanAmount': loanAmount,
      'loanInterestRate': loanInterestRate,
      'depositInterestRate': depositInterestRate,
    };
  }

  factory Membership.fromMap(Map<String, dynamic> map) {
    return Membership(
      membershipId: map['membershipId'] as int,
      membershipName: map['membershipName'] as String,
      loanAmount: map['loanAmount'] as double,
      loanInterestRate: map['loanInterestRate'] as int,
      depositInterestRate: map['depositInterestRate'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Membership.fromJson(String source) => Membership.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Membership(membershipId: $membershipId, membershipName: $membershipName, loanAmount: $loanAmount, loanInterestRate: $loanInterestRate, depositInterestRate: $depositInterestRate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Membership &&
      other.membershipId == membershipId &&
      other.membershipName == membershipName &&
      other.loanAmount == loanAmount &&
      other.loanInterestRate == loanInterestRate &&
      other.depositInterestRate == depositInterestRate;
  }

  @override
  int get hashCode {
    return membershipId.hashCode ^
      membershipName.hashCode ^
      loanAmount.hashCode ^
      loanInterestRate.hashCode ^
      depositInterestRate.hashCode;
  }
}
