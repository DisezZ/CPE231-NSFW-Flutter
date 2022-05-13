// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TopupTransaction {
  final int topupTransactionId;
  final int fromAccountId;
  final String mobileNumber;
  final double amount;
  final int transactionStatusId;
  final int paymentApprovedBy;
  final DateTime created;
  TopupTransaction({
    required this.topupTransactionId,
    required this.fromAccountId,
    required this.mobileNumber,
    required this.amount,
    required this.transactionStatusId,
    required this.paymentApprovedBy,
    required this.created,
  });

  TopupTransaction copyWith({
    int? topupTransactionId,
    int? fromAccountId,
    String? mobileNumber,
    double? amount,
    int? transactionStatusId,
    int? paymentApprovedBy,
    DateTime? created,
  }) {
    return TopupTransaction(
      topupTransactionId: topupTransactionId ?? this.topupTransactionId,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      amount: amount ?? this.amount,
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      paymentApprovedBy: paymentApprovedBy ?? this.paymentApprovedBy,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topupTransactionId': topupTransactionId,
      'fromAccountId': fromAccountId,
      'mobileNumber': mobileNumber,
      'amount': amount,
      'transactionStatusId': transactionStatusId,
      'paymentApprovedBy': paymentApprovedBy,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory TopupTransaction.fromMap(Map<String, dynamic> map) {
    return TopupTransaction(
      topupTransactionId: map['topupTransactionId'] as int,
      fromAccountId: map['fromAccountId'] as int,
      mobileNumber: map['mobileNumber'] as String,
      amount: map['amount'] as double,
      transactionStatusId: map['transactionStatusId'] as int,
      paymentApprovedBy: map['paymentApprovedBy'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TopupTransaction.fromJson(String source) => TopupTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TopupTransaction(topupTransactionId: $topupTransactionId, fromAccountId: $fromAccountId, mobileNumber: $mobileNumber, amount: $amount, transactionStatusId: $transactionStatusId, paymentApprovedBy: $paymentApprovedBy, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TopupTransaction &&
      other.topupTransactionId == topupTransactionId &&
      other.fromAccountId == fromAccountId &&
      other.mobileNumber == mobileNumber &&
      other.amount == amount &&
      other.transactionStatusId == transactionStatusId &&
      other.paymentApprovedBy == paymentApprovedBy &&
      other.created == created;
  }

  @override
  int get hashCode {
    return topupTransactionId.hashCode ^
      fromAccountId.hashCode ^
      mobileNumber.hashCode ^
      amount.hashCode ^
      transactionStatusId.hashCode ^
      paymentApprovedBy.hashCode ^
      created.hashCode;
  }
}
