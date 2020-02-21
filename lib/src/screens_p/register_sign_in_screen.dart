import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:register_signin_module/src/screens_p/login_with_email_screen.dart';

import '../utils_p/app_color.dart';
import '../utils_p/app_dimens.dart';
import '../utils_p/app_fonts.dart';
import '../utils_p/app_string.dart';
import '../utils_p/custome_view.dart';
import '../utils_p/shared_preferences_file.dart';
import '../utils_p/validation.dart';
import 'register_with_gmail_screen.dart';

class RegisterSignIn extends StatefulWidget {
  @override
  _RegisterSignIn createState() => _RegisterSignIn();
}

class _RegisterSignIn extends State<RegisterSignIn>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    //getDeviceInfo();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user is about quit our app temporally
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get Screen size
    appDimens.appDimensFind(context: context);

    //Login text label
    Widget loginTextlabel = Container(margin: EdgeInsets.only(bottom: appDimens.verticalMarginPadding(value: 15)),child: Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Register or SignIn",
          style: TextStyle(
              fontFamily: appFonts.defaultFont,
              //fontSize: screenWidth/18,
              fontSize:
              appDimens.fontSize(value: 24),
              fontWeight: FontWeight.w400,
              color: appColors.textHeadingColor),
        ),
      ),
    ),);



    //Submit button view
    Widget signInButton = Container(
        height: appDimens.buttonHeight(value: 55),
        child: Align(
            alignment: Alignment.center,
            child: customView.buttonRoundCornerWithBg(
                "Sign In",appColors.buttonTextColor,
                appColors.buttonBgColor,
                appDimens.fontSizeButton(value: 19),
                2, (value) {
              moveToLoginScreen();
            })));

    Widget registerButton = Container(
        height: appDimens.buttonHeight(value: 55),
        child: Align(
            alignment: Alignment.center,
            child: customView.buttonRoundCornerWithBg(
                "Register",appColors.buttonTextColor,
                appColors.buttonBgColor,
                appDimens.fontSizeButton(value: 19),
                2, (value) {
              moveToRegisterScreen();
            })));

    //Card View
    Widget cardView = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.3,
      margin: EdgeInsets.only(
          left: appDimens.horizontalMarginPadding(value: 25),
          right: appDimens.horizontalMarginPadding(value: 25),
          top: appDimens.verticalMarginPadding(value: 2)),
      child: Container(
        padding: EdgeInsets.only(
            left: appDimens.horizontalMarginPadding(value: 21),
            right: appDimens.horizontalMarginPadding(value: 21),
            top: appDimens.verticalMarginPadding(value: 29),
            bottom:appDimens.verticalMarginPadding(value: 22)),
        //height: screenHeight/1.8,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loginTextlabel,
              signInButton,
              Container(margin: EdgeInsets.only(bottom: appDimens.verticalMarginPadding(value: 10),top: appDimens.verticalMarginPadding(value: 10)),child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Or",
                    style: TextStyle(
                        fontFamily: appFonts.defaultFont,
                        //fontSize: screenWidth/18,
                        fontSize:
                        appDimens.fontSize(value: 20),
                        fontWeight: FontWeight.w400,
                        color: appColors.textHeadingColor),
                  ),
                ),
              ),),
              registerButton,
              Container(margin: EdgeInsets.only(bottom: appDimens.verticalMarginPadding(value: 5),top: appDimens.verticalMarginPadding(value: 25)),child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Browse as Guest",
                    style: TextStyle(
                        fontFamily: appFonts.defaultFont,
                        //fontSize: screenWidth/18,
                        fontSize:
                        appDimens.fontSize(value: 16),
                        fontWeight: FontWeight.w400,
                        color: appColors.textHeadingColor[500]),
                  ),
                ),
              ),),

            ],
          ),
        ),
      ),
    );

    //Main view
    return Scaffold(
        backgroundColor: appColors.appBgColor[100],
        appBar: PreferredSize(
            child: AppBar(
              brightness: (Platform.isIOS) ? Brightness.light : Brightness.dark,
              backgroundColor:
                  appColors.primaryColor,
            ),
            preferredSize: Size.fromHeight(0.0)),
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: appColors.appTopBgColor[100],
                      height: appDimens.heightFullScreen()*0.5,
                    ),
                    Center(
                        child: ListView(shrinkWrap: true,
                          children: <Widget>[
                        //topView,
                        Align(child: Center(child: cardView),alignment: Alignment.center,)
                      ],
                    )),
                  ],
                ),
              ],
            )));
  }

    //Move to next screen
  void moveToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => LoginWithEmailScreen())
    );
  }
  //Move to next screen
  void moveToRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => RegisterWithEmailScreen())
    );
  }
  }


