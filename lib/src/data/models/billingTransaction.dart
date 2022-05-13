// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BillingTransaction {
  final int billingTransactionId;
  final int fromAccountId;
  final double amount;
  final int transactionStatusId;
  final int paymentApprovedBy;
  final DateTime created;
  BillingTransaction({
    required this.billingTransactionId,
    required this.fromAccountId,
    required this.amount,
    required this.transactionStatusId,
    required this.paymentApprovedBy,
    required this.created,
  });

  BillingTransaction copyWith({
    int? billingTransactionId,
    int? fromAccountId,
    double? amount,
    int? transactionStatusId,
    int? paymentApprovedBy,
    DateTime? created,
  }) {
    return BillingTransaction(
      billingTransactionId: billingTransactionId ?? this.billingTransactionId,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      amount: amount ?? this.amount,
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      paymentApprovedBy: paymentApprovedBy ?? this.paymentApprovedBy,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'billingTransactionId': billingTransactionId,
      'fromAccountId': fromAccountId,
      'amount': amount,
      'transactionStatusId': transactionStatusId,
      'paymentApprovedBy': paymentApprovedBy,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory BillingTransaction.fromMap(Map<String, dynamic> map) {
    return BillingTransaction(
      billingTransactionId: map['billingTransactionId'] as int,
      fromAccountId: map['fromAccountId'] as int,
      amount: map['amount'] as double,
      transactionStatusId: map['transactionStatusId'] as int,
      paymentApprovedBy: map['paymentApprovedBy'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BillingTransaction.fromJson(String source) => BillingTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BillingTransaction(billingTransactionId: $billingTransactionId, fromAccountId: $fromAccountId, amount: $amount, transactionStatusId: $transactionStatusId, paymentApprovedBy: $paymentApprovedBy, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BillingTransaction &&
      other.billingTransactionId == billingTransactionId &&
      other.fromAccountId == fromAccountId &&
      other.amount == amount &&
      other.transactionStatusId == transactionStatusId &&
      other.paymentApprovedBy == paymentApprovedBy &&
      other.created == created;
  }

  @override
  int get hashCode {
    return billingTransactionId.hashCode ^
      fromAccountId.hashCode ^
      amount.hashCode ^
      transactionStatusId.hashCode ^
      paymentApprovedBy.hashCode ^
      created.hashCode;
  }
}
