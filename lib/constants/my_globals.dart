library globals;

import 'package:my_flutter/constants/api_constants.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/login/NewLoginResponse.dart';
import 'package:my_flutter/models/login/login_response_model.dart';

String baseUrl = ApiConstants.SERVER_BASE_URL;
NewLoginResponse? loginData;
String? bgColor;