class LoginModel {
  final String? email;
  final String? password;
  final String? DeviceId;
  final String? NotificationDeviceToken;
  LoginModel({
    this.email,
    this.password,
    this.DeviceId,
    this.NotificationDeviceToken,

  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
      DeviceId: json['DeviceId'],
      NotificationDeviceToken: json['NotificationDeviceToken'],
    );
  }

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
        'DeviceId': DeviceId,
        'NotificationDeviceToken': NotificationDeviceToken,
      };
}
