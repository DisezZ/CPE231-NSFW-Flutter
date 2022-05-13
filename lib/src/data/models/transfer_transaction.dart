// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransferTransaction {
  final int transferTransaction;
  final int fromAccountId;
  final int toAccountId;
  final double amount;
  final int transactionStatusId;
  final int paymentApprovedBy;
  final DateTime created;
  TransferTransaction({
    required this.transferTransaction,
    required this.fromAccountId,
    required this.toAccountId,
    required this.amount,
    required this.transactionStatusId,
    required this.paymentApprovedBy,
    required this.created,
  });

  TransferTransaction copyWith({
    int? transferTransaction,
    int? fromAccountId,
    int? toAccountId,
    double? amount,
    int? transactionStatusId,
    int? paymentApprovedBy,
    DateTime? created,
  }) {
    return TransferTransaction(
      transferTransaction: transferTransaction ?? this.transferTransaction,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      amount: amount ?? this.amount,
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      paymentApprovedBy: paymentApprovedBy ?? this.paymentApprovedBy,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transferTransaction': transferTransaction,
      'fromAccountId': fromAccountId,
      'toAccountId': toAccountId,
      'amount': amount,
      'transactionStatusId': transactionStatusId,
      'paymentApprovedBy': paymentApprovedBy,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory TransferTransaction.fromMap(Map<String, dynamic> map) {
    return TransferTransaction(
      transferTransaction: map['transferTransaction'] as int,
      fromAccountId: map['fromAccountId'] as int,
      toAccountId: map['toAccountId'] as int,
      amount: map['amount'] as double,
      transactionStatusId: map['transactionStatusId'] as int,
      paymentApprovedBy: map['paymentApprovedBy'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransferTransaction.fromJson(String source) => TransferTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransferTransaction(transferTransaction: $transferTransaction, fromAccountId: $fromAccountId, toAccountId: $toAccountId, amount: $amount, transactionStatusId: $transactionStatusId, paymentApprovedBy: $paymentApprovedBy, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TransferTransaction &&
      other.transferTransaction == transferTransaction &&
      other.fromAccountId == fromAccountId &&
      other.toAccountId == toAccountId &&
      other.amount == amount &&
      other.transactionStatusId == transactionStatusId &&
      other.paymentApprovedBy == paymentApprovedBy &&
      other.created == created;
  }

  @override
  int get hashCode {
    return transferTransaction.hashCode ^
      fromAccountId.hashCode ^
      toAccountId.hashCode ^
      amount.hashCode ^
      transactionStatusId.hashCode ^
      paymentApprovedBy.hashCode ^
      created.hashCode;
  }
}
