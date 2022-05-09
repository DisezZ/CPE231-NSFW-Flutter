import 'dart:convert';

TransactionStatus transactionStatusFromJson(String str) => TransactionStatus.fromJson(json.decode(str));

String transactionStatusToJson(TransactionStatus data) => json.encode(data.toJson());

class TransactionStatus {
  final int transactionStatusId;
  final String transactionStatusName;

  TransactionStatus({
    required this.transactionStatusId,
    required this.transactionStatusName,
  });

  factory TransactionStatus.fromJson(Map<String, dynamic> json) => TransactionStatus(
        transactionStatusId: json["transactionStatusId"],
        transactionStatusName: json["transactionStatusName"],
      );

  Map<String, dynamic> toJson() => {
        "transactionStatusId": transactionStatusId,
        "transactionStatusName": transactionStatusName,
      };
}
