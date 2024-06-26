import 'package:payment_app/services/biometric_service.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import 'package:payment_app/screens/local_auth/method_one/widgets/global_button.dart';
import 'package:payment_app/screens/local_auth/method_one/widgets/pin_item.dart';
import 'package:payment_app/utils/size/login_screen_size.dart';
import 'package:pinput/pinput.dart';
import '../../../data/local/storage_repo.dart';
import '../../routes.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key, required this.pin});

  final String pin;

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;
  bool biometric=false;
  @override
  void initState() {
    BiometricAuthService.canAuthenticated().then((value){
      if(value){
        biometric=true;
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50.h,),
          Text(
            "Pin Kodni qaytadan kiriting",
            style:TextStyle(
              fontSize: 18.wl,
              color: Colors.black
            ),
          ),
          SizedBox(height: 30.h,),
          SizedBox(
            width: width / 2,
            child: PinPutTextView(
              pinPutFocusNode: focusNode,
              pinPutController: pinController,
              isError: isError,
            ),
          ),
          SizedBox(height: 10.h,),
          Text((!isError) ? "" : "Pin oldingisi bilan mos emas",
            style:TextStyle(
                fontSize: 18.wl,
                color: Colors.red
            ),),
          SizedBox(height: 20.h,),
          CustomKeyboardView(
            number: (number) {
              if (pinController.length < 4) {
                isError=false;
                pinController.text += number;
              }
              if (pinController.length == 4) {
                if (widget.pin == pinController.text) {
                  _setPin(pinController.text);
                }
                else {
                  isError = true;
                  pinController.clear();
                }
              }
              setState(() {});
            },
            isBiometric: false,
            onClearButton: () {
              if (pinController.length > 0) {
                pinController.text = pinController.text.substring(
                    0, pinController.text.length - 1);
              }
            },
            onFingerButton: () {

            },
          )
        ],
      ),
    );
  }

  Future<void> _setPin(String pin) async {
    await StorageRepository.setString(key: 'pin', value: pin);
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context, (biometric)?RouteNames.touchIdRoute:RouteNames.tabRoute,(route)=>false);

  }

}
