// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AtmTransaction {
  final int atmTransactionId;
  final int fromAccountId;
  final int atmId;
  final double amount;
  final int transactionStatusId;
  final int paymentApprovedBy;
  final DateTime created;
  AtmTransaction({
    required this.atmTransactionId,
    required this.fromAccountId,
    required this.atmId,
    required this.amount,
    required this.transactionStatusId,
    required this.paymentApprovedBy,
    required this.created,
  });

  AtmTransaction copyWith({
    int? atmTransactionId,
    int? fromAccountId,
    int? atmId,
    double? amount,
    int? transactionStatusId,
    int? paymentApprovedBy,
    DateTime? created,
  }) {
    return AtmTransaction(
      atmTransactionId: atmTransactionId ?? this.atmTransactionId,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      atmId: atmId ?? this.atmId,
      amount: amount ?? this.amount,
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      paymentApprovedBy: paymentApprovedBy ?? this.paymentApprovedBy,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'atmTransactionId': atmTransactionId,
      'fromAccountId': fromAccountId,
      'atmId': atmId,
      'amount': amount,
      'transactionStatusId': transactionStatusId,
      'paymentApprovedBy': paymentApprovedBy,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory AtmTransaction.fromMap(Map<String, dynamic> map) {
    return AtmTransaction(
      atmTransactionId: map['atmTransactionId'] as int,
      fromAccountId: map['fromAccountId'] as int,
      atmId: map['atmId'] as int,
      amount: map['amount'] as double,
      transactionStatusId: map['transactionStatusId'] as int,
      paymentApprovedBy: map['paymentApprovedBy'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory AtmTransaction.fromJson(String source) => AtmTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AtmTransaction(atmTransactionId: $atmTransactionId, fromAccountId: $fromAccountId, atmId: $atmId, amount: $amount, transactionStatusId: $transactionStatusId, paymentApprovedBy: $paymentApprovedBy, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AtmTransaction &&
      other.atmTransactionId == atmTransactionId &&
      other.fromAccountId == fromAccountId &&
      other.atmId == atmId &&
      other.amount == amount &&
      other.transactionStatusId == transactionStatusId &&
      other.paymentApprovedBy == paymentApprovedBy &&
      other.created == created;
  }

  @override
  int get hashCode {
    return atmTransactionId.hashCode ^
      fromAccountId.hashCode ^
      atmId.hashCode ^
      amount.hashCode ^
      transactionStatusId.hashCode ^
      paymentApprovedBy.hashCode ^
      created.hashCode;
  }
}
