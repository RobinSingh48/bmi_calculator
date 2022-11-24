import 'package:bmi_calculator/const.dart';
import 'package:bmi_calculator/pages/first%20screen.dart';
import 'package:bmi_calculator/utils.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatelessWidget {

 const ResultPage({super.key, required this.bmiResult, required this.interpretation, required this.resultText});

  final String bmiResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: appbartextstyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(15),
                child: const Text(
            "Your Result",
            style: customContainerWeightTextStyle,
          ),
              )),
          Expanded(
              flex: 5,
              child: CustomContainer(
                  color: customContainerInactiveColor,
                customChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Text(resultText,style: resultTypeTextStyle,) ,
                    Text(bmiResult,style: bmiResultTextStyle,),
                    Text(interpretation,style: bmiResultSuggestionTextStyle,textAlign: TextAlign.center,),


                  ],
                ),              )),
          BottomButton(onPress: (){Navigator.pop(context);}, text: "RE-Calculate")
        ],
      ),
    );
  }
}
