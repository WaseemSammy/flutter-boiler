class LoginModel {
  final String? UserName;
  final String? Password;
  final String? DeviceId;
  final String? NotificationDeviceToken;
  LoginModel({
    this.UserName,
    this.Password,
    this.DeviceId,
    this.NotificationDeviceToken,

  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      UserName: json['UserName'],
      Password: json['Password'],
      DeviceId: json['DeviceId'],
      NotificationDeviceToken: json['NotificationDeviceToken'],
    );
  }

  Map<String, dynamic> toMap() => {
        'UserName': UserName,
        'Password': Password,
        'DeviceId': DeviceId,
        'NotificationDeviceToken': NotificationDeviceToken,
      };
}
