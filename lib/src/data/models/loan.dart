// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Loan {
  final int loanId;
  final int accountId;
  final double initialAmount;
  final double leftAmount;
  final int interestRate;
  final int transactionStatusId;
  final int loanApprovedBy;
  final int paymentApprovedBy;
  final DateTime created;
  Loan({
    required this.loanId,
    required this.accountId,
    required this.initialAmount,
    required this.leftAmount,
    required this.interestRate,
    required this.transactionStatusId,
    required this.loanApprovedBy,
    required this.paymentApprovedBy,
    required this.created,
  });

  Loan copyWith({
    int? loanId,
    int? accountId,
    double? initialAmount,
    double? leftAmount,
    int? interestRate,
    int? transactionStatusId,
    int? loanApprovedBy,
    int? paymentApprovedBy,
    DateTime? created,
  }) {
    return Loan(
      loanId: loanId ?? this.loanId,
      accountId: accountId ?? this.accountId,
      initialAmount: initialAmount ?? this.initialAmount,
      leftAmount: leftAmount ?? this.leftAmount,
      interestRate: interestRate ?? this.interestRate,
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      loanApprovedBy: loanApprovedBy ?? this.loanApprovedBy,
      paymentApprovedBy: paymentApprovedBy ?? this.paymentApprovedBy,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loanId': loanId,
      'accountId': accountId,
      'initialAmount': initialAmount,
      'leftAmount': leftAmount,
      'interestRate': interestRate,
      'transactionStatusId': transactionStatusId,
      'loanApprovedBy': loanApprovedBy,
      'paymentApprovedBy': paymentApprovedBy,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      loanId: map['loanId'] as int,
      accountId: map['accountId'] as int,
      initialAmount: map['initialAmount'] as double,
      leftAmount: map['leftAmount'] as double,
      interestRate: map['interestRate'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      loanApprovedBy: map['loanApprovedBy'] as int,
      paymentApprovedBy: map['paymentApprovedBy'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan.fromJson(String source) => Loan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Loan(loanId: $loanId, accountId: $accountId, initialAmount: $initialAmount, leftAmount: $leftAmount, interestRate: $interestRate, transactionStatusId: $transactionStatusId, loanApprovedBy: $loanApprovedBy, paymentApprovedBy: $paymentApprovedBy, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Loan &&
      other.loanId == loanId &&
      other.accountId == accountId &&
      other.initialAmount == initialAmount &&
      other.leftAmount == leftAmount &&
      other.interestRate == interestRate &&
      other.transactionStatusId == transactionStatusId &&
      other.loanApprovedBy == loanApprovedBy &&
      other.paymentApprovedBy == paymentApprovedBy &&
      other.created == created;
  }

  @override
  int get hashCode {
    return loanId.hashCode ^
      accountId.hashCode ^
      initialAmount.hashCode ^
      leftAmount.hashCode ^
      interestRate.hashCode ^
      transactionStatusId.hashCode ^
      loanApprovedBy.hashCode ^
      paymentApprovedBy.hashCode ^
      created.hashCode;
  }
}
