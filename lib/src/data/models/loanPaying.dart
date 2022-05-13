// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoanPaying {
  final int loanPayingId;
  final int loanId;
  final double amount;
  final int transactionStatusId;
  final int paymentApprovedBy;
  final DateTime created;
  LoanPaying({
    required this.loanPayingId,
    required this.loanId,
    required this.amount,
    required this.transactionStatusId,
    required this.paymentApprovedBy,
    required this.created,
  });

  LoanPaying copyWith({
    int? loanPayingId,
    int? loanId,
    double? amount,
    int? transactionStatusId,
    int? paymentApprovedBy,
    DateTime? created,
  }) {
    return LoanPaying(
      loanPayingId: loanPayingId ?? this.loanPayingId,
      loanId: loanId ?? this.loanId,
      amount: amount ?? this.amount,
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      paymentApprovedBy: paymentApprovedBy ?? this.paymentApprovedBy,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loanPayingId': loanPayingId,
      'loanId': loanId,
      'amount': amount,
      'transactionStatusId': transactionStatusId,
      'paymentApprovedBy': paymentApprovedBy,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory LoanPaying.fromMap(Map<String, dynamic> map) {
    return LoanPaying(
      loanPayingId: map['loanPayingId'] as int,
      loanId: map['loanId'] as int,
      amount: map['amount'] as double,
      transactionStatusId: map['transactionStatusId'] as int,
      paymentApprovedBy: map['paymentApprovedBy'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanPaying.fromJson(String source) => LoanPaying.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoanPaying(loanPayingId: $loanPayingId, loanId: $loanId, amount: $amount, transactionStatusId: $transactionStatusId, paymentApprovedBy: $paymentApprovedBy, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoanPaying &&
      other.loanPayingId == loanPayingId &&
      other.loanId == loanId &&
      other.amount == amount &&
      other.transactionStatusId == transactionStatusId &&
      other.paymentApprovedBy == paymentApprovedBy &&
      other.created == created;
  }

  @override
  int get hashCode {
    return loanPayingId.hashCode ^
      loanId.hashCode ^
      amount.hashCode ^
      transactionStatusId.hashCode ^
      paymentApprovedBy.hashCode ^
      created.hashCode;
  }
}
