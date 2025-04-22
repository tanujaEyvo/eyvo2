import 'dart:convert';

class LoadLoginResponse {
  final String code;
  final List<String> message;
  final dynamic data;
  final int totalrecords;

  LoadLoginResponse({
    required this.code,
    required this.message,
    this.data,
    required this.totalrecords,
  });

  factory LoadLoginResponse.fromJson(Map<String, dynamic> json) {
    return LoadLoginResponse(
      code: json['code'] as String,
      message: List<String>.from(json['message']),
      data:
          json['data'] == null ? null : Data.fromJson(jsonDecode(json['data'])),
      totalrecords: json['totalrecords'] as int,
    );
  }

  @override
  String toString() {
    return 'LoadLoginResponse(code: $code, message: $message, data: $data, totalrecords: $totalrecords)';
  }
}

class Data {
  final bool isLoginWithScan;
  final bool isLoginazureAd;
  final String clientId;
  final String tenantId;
  final String authority;
  final String redirectUri;
  final String clientCode;
  final String accessKey;
  final String connectionString;

  Data({
    required this.isLoginWithScan,
    required this.isLoginazureAd,
    required this.clientId,
    required this.tenantId,
    required this.authority,
    required this.redirectUri,
    required this.clientCode,
    required this.accessKey,
    required this.connectionString,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      isLoginWithScan: json['scanlogin'] as bool,
      isLoginazureAd: json['azuread'] as bool,
      clientId: json['clientid'] as String,
      tenantId: json['tanentid'] as String,
      authority: json['authority'] as String,
      redirectUri: json['redirecturi'] as String,
      clientCode: json['clientcode'] as String,
      accessKey: json['accesskey'] as String,
      connectionString: json['connectionstring'] as String,
    );
  }

  @override
  String toString() {
    return '''Data(
      isLoginWithScan: $isLoginWithScan,
      isLoginazureAd: $isLoginazureAd,
      clientId: $clientId,
      tenantId: $tenantId,
      authority: $authority,
      redirectUri: $redirectUri,
      clientCode: $clientCode,
      accessKey: $accessKey,
      connectionString: $connectionString
    )''';
  }
}

