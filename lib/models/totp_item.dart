class TotpItem {
  final String id;
  final String name;
  final String secret;
  final String issuer;
  final int digits;
  final int period;

  TotpItem({
    required this.id,
    this.name = '',
    required this.secret,
    this.issuer = '',
    this.digits = 6,
    this.period = 30,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'secret': secret,
      'issuer': issuer,
      'digits': digits,
      'period': period,
    };
  }

  factory TotpItem.fromJson(Map<String, dynamic> json) {
    return TotpItem(
      id: json['id'],
      name: json['name'] ?? '',
      secret: json['secret'],
      issuer: json['issuer'] ?? '',
      digits: json['digits'] ?? 6,
      period: json['period'] ?? 30,
    );
  }

  String get displayName {
    if (name.isNotEmpty) {
      return name;
    } else if (issuer.isNotEmpty) {
      return issuer;
    } else {
      return ''; // 返回空字符串，让调用方处理默认值
    }
  }

  String get displaySubtitle {
    if (name.isNotEmpty && issuer.isNotEmpty) {
      return issuer;
    }
    return '';
  }
}