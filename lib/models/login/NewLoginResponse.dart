/// success : true
/// message : "User Authenticated"
/// statusCode : 200
/// remarks : null
/// traceId : "4c6e61a9-1e11-4c14-9121-d572eab2fc38"
/// errors : null
/// data : {"id":7,"firstName":"Sayeed","lastName":"Ahamad","email":"xyz","roles":["Admin"],"isVerified":true,"jwToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTYXllZWQiLCJqdGkiOiIzOTdkZmE5Yi00ZGNjLTRlYTUtODQ3ZC01NzVmYjIyM2RiMDYiLCJlbWFpbCI6Inh5eiIsInVpZCI6IjciLCJ0aWQiOiIxIiwicm9sZXMiOiJBZG1pbiIsImV4cCI6MTcxNTE1ODI5MywiaXNzIjoiVGVzdC5jb20iLCJhdWQiOiJUZXN0LmNvbSJ9.2gRBwGtgh_3vPSfemwQ27KbR_mjlT93PZ0v1L2KoCr0","refreshToken":"MyPQKBR3h5frSKtO6OVePNBM9ollWUrk2yCG99bYkwKyQ5qr0gsSJMSxxGhf+1N8hVT+7DJLYQ2vnW1NIFYLsA==","restaurantId":1}

class NewLoginResponse {
  NewLoginResponse({
      bool? success,
      String? message,
      num? statusCode,
      dynamic remarks, 
      String? traceId,
      dynamic errors, 
      Data? data,}){
    _success = success;
    _message = message;
    _statusCode = statusCode;
    _remarks = remarks;
    _traceId = traceId;
    _errors = errors;
    _data = data;
}

  NewLoginResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _statusCode = json['statusCode'];
    _remarks = json['remarks'];
    _traceId = json['traceId'];
    _errors = json['errors'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  num? _statusCode;
  dynamic? _remarks;
  String? _traceId;
  dynamic? _errors;
  Data? _data;
NewLoginResponse copyWith({  bool? success,
  String? message,
  num? statusCode,
  dynamic? remarks,
  String? traceId,
  dynamic? errors,
  Data? data,
}) => NewLoginResponse(  success: success ?? _success,
  message: message ?? _message,
  statusCode: statusCode ?? _statusCode,
  remarks: remarks ?? _remarks,
  traceId: traceId ?? _traceId,
  errors: errors ?? _errors,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  num? get statusCode => _statusCode;
  dynamic? get remarks => _remarks;
  String? get traceId => _traceId;
  dynamic? get errors => _errors;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    map['remarks'] = _remarks;
    map['traceId'] = _traceId;
    map['errors'] = _errors;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 7
/// firstName : "Sayeed"
/// lastName : "Ahamad"
/// email : "xyz"
/// roles : ["Admin"]
/// isVerified : true
/// jwToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTYXllZWQiLCJqdGkiOiIzOTdkZmE5Yi00ZGNjLTRlYTUtODQ3ZC01NzVmYjIyM2RiMDYiLCJlbWFpbCI6Inh5eiIsInVpZCI6IjciLCJ0aWQiOiIxIiwicm9sZXMiOiJBZG1pbiIsImV4cCI6MTcxNTE1ODI5MywiaXNzIjoiVGVzdC5jb20iLCJhdWQiOiJUZXN0LmNvbSJ9.2gRBwGtgh_3vPSfemwQ27KbR_mjlT93PZ0v1L2KoCr0"
/// refreshToken : "MyPQKBR3h5frSKtO6OVePNBM9ollWUrk2yCG99bYkwKyQ5qr0gsSJMSxxGhf+1N8hVT+7DJLYQ2vnW1NIFYLsA=="
/// restaurantId : 1

class Data {
  Data({
      num? id,
      String? firstName,
      String? lastName,
      String? email,
      List<String>? roles,
      bool? isVerified,
      String? jwToken,
      String? refreshToken,
      num? restaurantId,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _roles = roles;
    _isVerified = isVerified;
    _jwToken = jwToken;
    _refreshToken = refreshToken;
    _restaurantId = restaurantId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _isVerified = json['isVerified'];
    _jwToken = json['jwToken'];
    _refreshToken = json['refreshToken'];
    _restaurantId = json['restaurantId'];
  }
  num? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  List<String>? _roles;
  bool? _isVerified;
  String? _jwToken;
  String? _refreshToken;
  num? _restaurantId;
Data copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? email,
  List<String>? roles,
  bool? isVerified,
  String? jwToken,
  String? refreshToken,
  num? restaurantId,
}) => Data(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  roles: roles ?? _roles,
  isVerified: isVerified ?? _isVerified,
  jwToken: jwToken ?? _jwToken,
  refreshToken: refreshToken ?? _refreshToken,
  restaurantId: restaurantId ?? _restaurantId,
);
  num? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  List<String>? get roles => _roles;
  bool? get isVerified => _isVerified;
  String? get jwToken => _jwToken;
  String? get refreshToken => _refreshToken;
  num? get restaurantId => _restaurantId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['roles'] = _roles;
    map['isVerified'] = _isVerified;
    map['jwToken'] = _jwToken;
    map['refreshToken'] = _refreshToken;
    map['restaurantId'] = _restaurantId;
    return map;
  }

}