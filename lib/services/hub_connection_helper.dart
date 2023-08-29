

import 'package:flutter/gestures.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/itransport.dart';
import 'package:signalr_netcore/msgpack_hub_protocol.dart';

import 'package:logging/logging.dart';

class HubConnectionHelper {
  static HubConnection? _instance;


  static Future<HubConnection> getInstance(String url) async {

    if (_instance != null) {
      if(_instance?.state ==HubConnectionState.Disconnected) {
        _instance?.start();
      }
      return _instance!;
    }
    _instance ??= await initPlatformState(url);
    return _instance!;
  }

  static initPlatformState(String url) async {
    _instance =  await HubConnectionBuilder()
        .withUrl(url)
    /* Configure the Hub with msgpack protocol */
        .configureLogging(Logger("SignalR - transport"))
        .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000])
        .build() ;
        await _instance?.start();
        print(_instance?.state);
  }

  static  checkConnection() async{
   return  await _instance?.state;

  }
  connect() async {
    var connectionState = await _instance?.state;
    if(connectionState!=true) {
     await _instance?.start();
    }
  }

  disconnect() async {
    var connectionState = await _instance?.state;
    if(connectionState==true) {
     await _instance?.stop();
    }
  }

}