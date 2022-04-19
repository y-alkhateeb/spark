import 'package:auto_route/auto_route.dart';
import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/base_route.gr.dart';
import '../../../../core/navigation/route/animated_route.dart';
import '../../../../core/ui/my_base_bg_widget.dart';
import '../../../../core/ui/my_button.dart';
import '../../../../core/ui/my_logo_on_bg_widget.dart';
import '../../../../core/ui/my_text_form_field.dart';

class OTPScreen extends StatefulWidget {
  static const routeName = "OTPScreenRoute";

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  List<_OTPTextFieldFields?> otpTextFieldFields = List.filled(4, null);


  @override
  void initState() {
    super.initState();
    otpTextFieldFields = List.generate(4, (index) => _OTPTextFieldFields(TextEditingController(), FocusNode()));
  }


  @override
  Widget build(BuildContext context) {
    return MyBaseBgWidget(
      child: Scaffold(
        body: Stack(
          children: [
            const MyLogoOnbgWidget(),
            Positioned(
              top: 150.h,
              bottom: 0,
              left: 0,
              right: 0,
              child: SlidingUpAnimated(
                initialOffsetY: 1,
                intervalStart: 0.0,
                intervalEnd: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  child: Container(
                    color: context.colors.primaryContainer,
                    child: LayoutBuilder(
                        builder: (context, constraint) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraint.minHeight),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimens.dp32),
                                child: Column(
                                  children: [
                                    Gaps.vGap32,
                                    Center(child: Image.asset(
                                        ApplicationConstants.IMAGE_PHONE)),
                                    Gaps.vGap32,
                                    Text(
                                      S
                                          .of(context)
                                          .phone_verification,
                                      style: context.textTheme.headline2!
                                          .copyWith(
                                        color: context.colors
                                            .onPrimaryContainer,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Gaps.vGap32,
                                    Text(
                                      S
                                          .of(context)
                                          .please_enter_ur4digit,
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.subtitle1!
                                          .copyWith(
                                          color: context.colors
                                              .onPrimaryContainer,
                                          height: 1.8
                                      ),
                                    ),
                                    Gaps.vGap32,
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: _buildPinCodeWidget(),
                                    ),
                                    Gaps.vGap128,
                                    MyTextButton.primary(
                                      text: S
                                          .of(context)
                                          .label_register,
                                      onPressed: () {
                                        print(_getCurrentPin());
                                        context.router.pushAndPopUntil(
                                            BottomBarParent(), predicate: (Route<dynamic> route) => false);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String _getCurrentPin() {
    String currentPin = "";
    otpTextFieldFields.forEach((value) {
      currentPin += value!.textEditingController.text;
    });
    return currentPin;
  }

  List<Widget> _buildPinCodeWidget(){
    List<Widget> widgets = [];
    for(int i = 0; i< otpTextFieldFields.length; i++){
      widgets.add(
          pinCodeWidget(
            context,
            otpTextFieldFields[i]
                !.textEditingController,
            otpTextFieldFields[i]!.focusNode,
            isLastTextFields: i == 3,
            isFirstTextFields: i == 0,
          )
      );
    }
    return widgets;
  }

  Widget pinCodeWidget(
      BuildContext context,
      TextEditingController controller,
      FocusNode focusNode,
      {bool isLastTextFields = false,
       bool isFirstTextFields = false,
      }) {
    return Container(
      width: 60.h,
      height: 60.h,
      decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xffF5F5F5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 1)
            )
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        child: MyTextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: isFirstTextFields,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (str) {
              if(str.isEmpty){
                if(!isFirstTextFields)
                  FocusScope.of(context).previousFocus();
              }
              else if(str.length == 1){
                if(isLastTextFields){
                  focusNode.unfocus();
                }
                else FocusScope.of(context).nextFocus();
              }
              else if(str.length > 1){
                String digit = str.substring(str.length-1, str.length);
                controller.text = digit;
                print(isLastTextFields);
                if(isLastTextFields){
                  focusNode.unfocus();
                }
                else FocusScope.of(context).nextFocus();
              }
          },
          contentPadding: const EdgeInsets.symmetric(
              vertical: 30, horizontal: 15),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }

}


/// all we need for OTP text fields
class _OTPTextFieldFields {
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const _OTPTextFieldFields(this.textEditingController, this.focusNode);
}