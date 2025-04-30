import 'dart:convert';

class Location {
  int? locationId;
  String? locationCode;

  Location({
    this.locationId,
    this.locationCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      locationId: json['locationid'] ?? 0,
      locationCode: json['locationcode'] ?? "",
    );
  }
}

class LocationResponse {
  String code;
  List<String> message;
  List<Location>? data;
  int totalRecords;

  LocationResponse({
    required this.code,
    required this.message,
    this.data,
    required this.totalRecords,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] == null || json['data'] == [])
        ? []
        : jsonDecode(json['data']) as List;
    List<Location> locations =
        dataList.map((i) => Location.fromJson(i)).toList();

    return LocationResponse(
      code: json['code'],
      message: List<String>.from(json['message']),
      data: locations,
      totalRecords: json['totalrecords'] ?? 0,
    );
  }
}
