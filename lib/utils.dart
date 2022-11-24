import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';


//used for male/female icon and text
class CustomContainerChild extends StatelessWidget {
  IconData customChildIcon;
  String customChildText;

  CustomContainerChild(
      {required this.customChildIcon, required this.customChildText});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          customChildIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          customChildText,
          style: customContainerTextStyle,
        )
      ],
    );
  }
}



// this one create in initally in staring and blank
class CustomContainer extends StatelessWidget {

   CustomContainer({ required this.color, this.customChild, this.onPress});
  final Color color;
 final Widget? customChild;
 final VoidCallback? onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: customChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

//custom rounded button using Rawmaterial


class RoundedButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPress;

  RoundedButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(height: 56,width: 56),
      elevation: 0,
      onPressed: onPress,
      child: Icon(icon),

    );
  }
}


