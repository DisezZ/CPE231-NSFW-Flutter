// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionStatus {
  final int transactionStatusId;
  final String transactionStatusName;
  TransactionStatus({
    required this.transactionStatusId,
    required this.transactionStatusName,
  });

  TransactionStatus copyWith({
    int? transactionStatusId,
    String? transactionStatusName,
  }) {
    return TransactionStatus(
      transactionStatusId: transactionStatusId ?? this.transactionStatusId,
      transactionStatusName: transactionStatusName ?? this.transactionStatusName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionStatusId': transactionStatusId,
      'transactionStatusName': transactionStatusName,
    };
  }

  factory TransactionStatus.fromMap(Map<String, dynamic> map) {
    return TransactionStatus(
      transactionStatusId: map['transactionStatusId'] as int,
      transactionStatusName: map['transactionStatusName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionStatus.fromJson(String source) => TransactionStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TransactionStatus(transactionStatusId: $transactionStatusId, transactionStatusName: $transactionStatusName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TransactionStatus &&
      other.transactionStatusId == transactionStatusId &&
      other.transactionStatusName == transactionStatusName;
  }

  @override
  int get hashCode => transactionStatusId.hashCode ^ transactionStatusName.hashCode;
}
