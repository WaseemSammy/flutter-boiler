import 'package:flutter/material.dart';
import '../api/api_helper.dart';
import '../constants/api_constants.dart';
import '../models/login_model.dart';
import '../models/response_data_model.dart';
import '../constants/my_globals.dart' as globals;


class ApiService {
  Future<ResponseData> loginUser({required BuildContext context, required LoginModel loginModel, required bool logInWithCommonLoader}) {
    Uri uri = Uri.parse(globals.baseUrl + ApiConstants.LOGIN);

    return ApiHelper().postRequest(context, uri, loginModel.toMap(),
        useAuth: false, showLoader: logInWithCommonLoader, responseName: "Login", showLog: true, showError: true);
  }

  Future<ResponseData> appNewSetting( String url, {required BuildContext context, required bool logInWithCommonLoader,} ) {
    Uri uri = Uri.parse(url + ApiConstants.NEW_APP_SERVER_URL);

    return ApiHelper().getRequest(context, uri,
        useAuth: false, showLoader: logInWithCommonLoader, responseName: ApiConstants.NEW_APP_SERVER_URL, showLog: true, showError: true);
  }


  Future<ResponseData> getDashboardData({required BuildContext context, required int resId}) {
    Uri uri = Uri.parse(globals.baseUrl + ApiConstants.HOME_DATA+resId.toString());

    return ApiHelper().getRequest(context, uri,
        useAuth: true, showLoader: true, responseName: ApiConstants.HOME_DATA, showLog: true, showError: true);

  }
  Future<ResponseData> getAllTable({required BuildContext context, required int resId}) {
    Uri uri = Uri.parse(globals.baseUrl + ApiConstants.ALLTABLE_DATA+resId.toString());

    return ApiHelper().getRequest(context, uri,
        useAuth: true, showLoader: true, responseName: ApiConstants.ALLTABLE_DATA, showLog: true, showError: true);

  }

  Future<ResponseData> getProcessNewOrder({required BuildContext context, required int resId}) {
    Uri uri = Uri.parse(globals.baseUrl + ApiConstants.ALLTABLE_DATA+resId.toString());

    return ApiHelper().getRequest(context, uri,
        useAuth: true, showLoader: true, responseName: ApiConstants.ALLTABLE_DATA, showLog: true, showError: true);

  }




}
