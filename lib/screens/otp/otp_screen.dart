import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/screens/otp/white_container.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../services/hub_connection_helper.dart';
import 'border_box.dart';

class OtpScreen extends StatefulWidget {
  final String phone;

  const OtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";
  String otp = "";
  bool isLoaded = false;



  @override
  void initState() {
    _listenOtp();
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("Unregistered Listener");
    super.dispose();
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
    print("OTP Listen is called");
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
            child: Scaffold(
              backgroundColor: isLoaded ? Colors.white : const Color(0xFF8C4A52),
              body: isLoaded
                  ? const Center(child: CircularProgressIndicator())
                  : CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 50),
                            child: Container(
                              height: 50,
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        WhiteContainer(
                          headerText: "Enter OTP",
                          labelText:
                          "OTP has been successfully sent to your \n ${widget.phone}",
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                PinFieldAutoFill(
                                  currentCode: otpCode,
                                  decoration:  BoxLooseDecoration(
                                      radius: Radius.circular(12),
                                      strokeColorBuilder: FixedColorBuilder(
                                          Color(0xFF8C4A52))),
                                  codeLength: 6,
                                  onCodeChanged: (code) {
                                    print("OnCodeChanged : $code");
                                    otpCode = code.toString();
                                  },
                                  onCodeSubmitted: (val) {
                                    print("OnCodeSubmitted : $val");
                                  },
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                color: Colors.white,
                child: GestureDetector(
                  onTap: () async {
                   print(await HubConnectionHelper.checkConnection());

                  },
                  child: const BorderBox(
                    margin: false,
                    color: Color(0xFF8C4A52),
                    height: 50,
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ));
  }
}