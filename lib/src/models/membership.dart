import 'dart:convert';

Membership membershipFromJson(String str) => Membership.fromJson(json.decode(str));

String membershipToJson(Membership data) => json.encode(data.toJson());

class Membership {
  final int membershipId;
  final String membershipName;
  final double loanAmount;
  final int loanInterestRate;
  final int depositInterestRate;

  Membership({
    required this.membershipId,
    required this.membershipName,
    required this.loanAmount,
    required this.loanInterestRate,
    required this.depositInterestRate,
  });

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        membershipId: json["membershipId"],
        membershipName: json["membershipName"],
        loanAmount: json["loanAmount"],
        loanInterestRate: json["loanInterestRate"],
        depositInterestRate: json["depositInterestRate"],
      );

  Map<String, dynamic> toJson() => {
        "membershipId": membershipId,
        "membershipName": membershipName,
        "loanAmount": loanAmount,
        "loanInterestRate": loanInterestRate,
        "depositInterestRate": depositInterestRate,
      };
}
