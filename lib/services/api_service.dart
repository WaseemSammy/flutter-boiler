import 'package:flutter/material.dart';
import '../api/api_helper.dart';
import '../constants/api_constants.dart';
import '../models/login_model.dart';
import '../models/response_data_model.dart';
import '../constants/my_globals.dart' as globals;


class ApiService {
  Future<ResponseData> loginUser({required BuildContext context, required LoginModel loginModel, required bool logInWithCommonLoader}) {
    Uri _uri = Uri.parse(globals.baseUrl! + ApiConstants.LOGIN);

    return ApiHelper().postRequest(context, _uri, loginModel.toMap(),
        useAuth: false, showLoader: logInWithCommonLoader, responseName: "Login", showLog: true, showError: true);
  }

  Future<ResponseData> appNewSetting( String url, {required BuildContext context, required bool logInWithCommonLoader,} ) {
    Uri _uri = Uri.parse(url! + ApiConstants.NEW_APP_SERVER_URL);

    return ApiHelper().getRequest(context, _uri,
        useAuth: false, showLoader: logInWithCommonLoader, responseName: ApiConstants.NEW_APP_SERVER_URL, showLog: true, showError: true);
  }


  Future<ResponseData> getOrgSetting({required BuildContext context}) {
    Uri _uri = Uri.parse(globals.baseUrl! + ApiConstants.ORF_SETTINGS);
    return ApiHelper().getRequest(context, _uri, useAuth: true, showLoader: true, responseName: "getOrgSetting", showLog: true, showError: true);
  }

  Future<ResponseData> getDefaultTree({required BuildContext context}) {
    Uri _uri = Uri.parse(globals.baseUrl! + ApiConstants.DEFAULT_TREE_ID);
    return ApiHelper().getRequest(context, _uri, useAuth: true, showLoader: true, responseName: "DEFAULT_TREE_ID", showLog: true, showError: true);
  }

  Future<ResponseData> getNotificationUrl({required BuildContext context}) {
    Uri _uri = Uri.parse(globals.baseUrl! + ApiConstants.NOTIFICATION_TOKEN_URL);
    return ApiHelper().getRequest(context, _uri, useAuth: true, showLoader: true, responseName: "DEFAULT_TREE_ID", showLog: true, showError: true);
  }

  Future<ResponseData> getClients({required BuildContext context,required String url}) {
    Uri _uri = Uri.parse(globals.baseUrl! + ApiConstants.CLIENT_BYLIST+url);
    return ApiHelper().getRequest(context, _uri, useAuth: true, showLoader: true, responseName: "getClients", showLog: true, showError: true);
  }

  Future<ResponseData> getobjectType({required BuildContext context,required String url}) {
    Uri _uri = Uri.parse("${globals.baseUrl!}${ApiConstants.OBJECT_TYPE_URL}3?pageSize=50&pageIndex=1");
    return ApiHelper().getRequest(context, _uri, useAuth: true, showLoader: true, responseName: "getobjectType", showLog: true, showError: true);
  }
  Future<ResponseData> getuserPrefrences({required BuildContext context,required String url}) {
    Uri _uri = Uri.parse("${globals.baseUrl!}${ApiConstants.USER_VIEW_PREFERENCE}$url");
    return ApiHelper().getRequest(context, _uri, useAuth: true, showLoader: true, responseName: "getobjectType", showLog: true, showError: true);
  }


}
