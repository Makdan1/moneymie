import 'package:flutter/material.dart';
import 'package:moneymietest/utils/colors.dart';

class GeneralButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Color splashColor;
  final String buttonText;
  final Color buttonTextColor;
  GeneralButton({Key key, this.child, this.onPressed, this.borderRadius = const BorderRadius.all(Radius.circular(15)), this.splashColor = AppColors.themeGreen, this.buttonText, this.buttonTextColor = const Color(0xffFFFFFF), this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return
      Container(
          //padding: EdgeInsets.all(20),
          height: 60,
          width: deviceWidth,
          child:
          RaisedButton(

            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide(color:borderColor ),



            ),
            color: splashColor,
            onPressed: () {
              if (onPressed != null) {
                      onPressed();
                    }
                  },
            child: Text(buttonText, style: TextStyle(color: buttonTextColor, fontWeight: FontWeight.bold),),

          )
      );

  }
}
