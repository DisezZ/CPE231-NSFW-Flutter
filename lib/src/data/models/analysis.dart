// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// -------------------------------------------
/// Analysis one model
///
/// -------------------------------------------
class AnalysisOneResponse {
  bool error;
  List<AnalysisOneResponseData> data;
  String message;

  AnalysisOneResponse({
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

  factory AnalysisOneResponse.fromMap(Map<String, dynamic> map) {
    return AnalysisOneResponse(
      error: map['error'] as bool,
      data: List<AnalysisOneResponseData>.from(
        (map['data'] as List<dynamic>).map<AnalysisOneResponseData>(
          (x) => AnalysisOneResponseData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisOneResponse.fromJson(String source) =>
      AnalysisOneResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AnalysisOneResponseData {
  final String membershipName;
  final int totalCustomers;
  final int customerId;
  final String firstName;
  final String lastName;
  final num balance;

  AnalysisOneResponseData({
    required this.membershipName,
    required this.totalCustomers,
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'membershipName': membershipName,
      'totalCustomers': totalCustomers,
      'customerId': customerId,
      'firstName': firstName,
      'lastName': lastName,
      'balance': balance,
    };
  }

  factory AnalysisOneResponseData.fromMap(Map<String, dynamic> map) {
    return AnalysisOneResponseData(
      membershipName: map['membershipName'] as String,
      totalCustomers: map['totalCustomers'] as int,
      customerId: map['customerId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      balance: map['balance'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisOneResponseData.fromJson(String source) =>
      AnalysisOneResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

/// -------------------------------------------
/// Analysis two model
///
/// -------------------------------------------
class AnalysisTwoResponse {
  bool error;
  List<AnalysisTwoResponseData> data;
  String message;

  AnalysisTwoResponse({
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

  factory AnalysisTwoResponse.fromMap(Map<String, dynamic> map) {
    return AnalysisTwoResponse(
      error: map['error'] as bool,
      data: List<AnalysisTwoResponseData>.from(
        (map['data'] as List<dynamic>).map<AnalysisTwoResponseData>(
          (x) => AnalysisTwoResponseData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisTwoResponse.fromJson(String source) =>
      AnalysisTwoResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AnalysisTwoResponseData {
  final int customerId;
  final String firstName;
  final String lastName;
  final num loanMoney;

  AnalysisTwoResponseData({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.loanMoney,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'firstName': firstName,
      'lastName': lastName,
      'loanMoney': loanMoney,
    };
  }

  factory AnalysisTwoResponseData.fromMap(Map<String, dynamic> map) {
    return AnalysisTwoResponseData(
      customerId: map['customerId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      loanMoney: map['loanMoney'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisTwoResponseData.fromJson(String source) =>
      AnalysisTwoResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

/// -------------------------------------------
/// Analysis three model
///
/// -------------------------------------------
class AnalysisThreeResponse {
  bool error;
  List<AnalysisThreeResponseData> data;
  String message;

  AnalysisThreeResponse({
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

  factory AnalysisThreeResponse.fromMap(Map<String, dynamic> map) {
    return AnalysisThreeResponse(
      error: map['error'] as bool,
      data: List<AnalysisThreeResponseData>.from(
        (map['data'] as List<dynamic>).map<AnalysisThreeResponseData>(
          (x) => AnalysisThreeResponseData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisThreeResponse.fromJson(String source) =>
      AnalysisThreeResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class AnalysisThreeResponseData {
  final int transferTransactionId;
  final String firstName;
  final String lastName;
  final String bankName;

  AnalysisThreeResponseData({
    required this.transferTransactionId,
    required this.firstName,
    required this.lastName,
    required this.bankName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transferTransactionId': transferTransactionId,
      'firstName': firstName,
      'lastName': lastName,
      'bankName': bankName,
    };
  }

  factory AnalysisThreeResponseData.fromMap(Map<String, dynamic> map) {
    return AnalysisThreeResponseData(
      transferTransactionId: map['transferTransactionId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      bankName: map['bankName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisThreeResponseData.fromJson(String source) =>
      AnalysisThreeResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

/// -------------------------------------------
/// Analysis four model
///
/// -------------------------------------------
class AnalysisFourResponse {
  bool error;
  List<AnalysisFourResponseData> data;
  String message;

  AnalysisFourResponse({
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

  factory AnalysisFourResponse.fromMap(Map<String, dynamic> map) {
    return AnalysisFourResponse(
      error: map['error'] as bool,
      data: List<AnalysisFourResponseData>.from(
        (map['data'] as List<dynamic>).map<AnalysisFourResponseData>(
          (x) => AnalysisFourResponseData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisFourResponse.fromJson(String source) =>
      AnalysisFourResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AnalysisFourResponseData {
  final String transactionType;
  final int frequency;
  final num maxAmount;

  AnalysisFourResponseData({
    required this.transactionType,
    required this.frequency,
    required this.maxAmount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionType': transactionType,
      'frequency': frequency,
      'maxAmount': maxAmount,
    };
  }

  factory AnalysisFourResponseData.fromMap(Map<String, dynamic> map) {
    return AnalysisFourResponseData(
      transactionType: map['transactionType'] as String,
      frequency: map['frequency'] as int,
      maxAmount: map['maxAmount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisFourResponseData.fromJson(String source) =>
      AnalysisFourResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

/// -------------------------------------------
/// Analysis one model
///
/// -------------------------------------------
class AnalysisFiveResponse {
  bool error;
  List<AnalysisFiveResponseData> data;
  String message;

  AnalysisFiveResponse({
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

  factory AnalysisFiveResponse.fromMap(Map<String, dynamic> map) {
    return AnalysisFiveResponse(
      error: map['error'] as bool,
      data: List<AnalysisFiveResponseData>.from(
        (map['data'] as List<dynamic>).map<AnalysisFiveResponseData>(
          (x) => AnalysisFiveResponseData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisFiveResponse.fromJson(String source) =>
      AnalysisFiveResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AnalysisFiveResponseData {
  final String branchName;
  final String membershipName;
  final int frequency;
  final num totalMoney;

  AnalysisFiveResponseData({
    required this.branchName,
    required this.membershipName,
    required this.frequency,
    required this.totalMoney,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchName': branchName,
      'membershipName': membershipName,
      'frequency': frequency,
      'totalMoney': totalMoney,
    };
  }

  factory AnalysisFiveResponseData.fromMap(Map<String, dynamic> map) {
    return AnalysisFiveResponseData(
      branchName: map['branchName'] as String,
      membershipName: map['membershipName'] as String,
      frequency: map['frequency'] as int,
      totalMoney: map['totalMoney'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisFiveResponseData.fromJson(String source) =>
      AnalysisFiveResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
