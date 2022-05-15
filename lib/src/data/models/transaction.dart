// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionResponse {
  bool error;
  List<TransactionResponseData> data;
  String message;

  TransactionResponse({
    required this.error,
    required this.data,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'data': data.map((x) => x.toMap()).toList(),
      'message': message,
    };
  }

  factory TransactionResponse.fromMap(Map<String, dynamic> map) {
    return TransactionResponse(
      error: map['error'] as bool,
      data: List<TransactionResponseData>.from(
        (map['data'] as List<dynamic>).map<TransactionResponseData>(
          (x) => TransactionResponseData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionResponse.fromJson(String source) =>
      TransactionResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TransactionResponseData {
  TransactionResponseData({
    required this.fieldCount,
    required this.affectedRows,
    required this.insertId,
    required this.serverStatus,
    required this.warningCount,
    required this.message,
    required this.protocol41,
    required this.changedRows,
  });

  final int fieldCount;
  final int affectedRows;
  final int insertId;
  final int serverStatus;
  final int warningCount;
  final String message;
  final bool protocol41;
  final int changedRows;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fieldCount': fieldCount,
      'affectedRows': affectedRows,
      'insertId': insertId,
      'serverStatus': serverStatus,
      'warningCount': warningCount,
      'message': message,
      'protocol41': protocol41,
      'changedRows': changedRows,
    };
  }

  factory TransactionResponseData.fromMap(Map<String, dynamic> map) {
    return TransactionResponseData(
      fieldCount: map['fieldCount'] as int,
      affectedRows: map['affectedRows'] as int,
      insertId: map['insertId'] as int,
      serverStatus: map['serverStatus'] as int,
      warningCount: map['warningCount'] as int,
      message: map['message'] as String,
      protocol41: map['protocol41'] as bool,
      changedRows: map['changedRows'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionResponseData.fromJson(String source) =>
      TransactionResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
