import 'package:bmi_calculator/pages/bmi%20calculation%20function.dart';
import 'package:bmi_calculator/pages/second%20page.dart';
import 'package:bmi_calculator/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const.dart';

enum Gender{
  male,
female,
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

        Gender? selectedGender;

        int height = 170;
        int weight = 40;
        int age = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR",style: appbartextstyle,),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CustomContainer(
                    onPress: (){

                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                color: selectedGender == Gender.male ? customContainerActiveColor : customContainerInactiveColor,
                customChild: CustomContainerChild(
                    customChildIcon: FontAwesomeIcons.person,
                    customChildText: "Male"),
              )),
              Expanded(
                  child: CustomContainer(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                      color: selectedGender == Gender.female ? customContainerActiveColor : customContainerInactiveColor,
                      customChild: CustomContainerChild(
                        customChildIcon: FontAwesomeIcons.personDress,
                        customChildText: "Female",
                      ))),
            ],
          )),
          Expanded(
              child: CustomContainer(
                customChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",style: customContainerTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: customContainerWeightTextStyle,),
                        Text("cm",style: customContainerTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        thumbColor: Color(0xFFEA1555),
                        overlayColor: Color(0x29EA1555),
                        activeTrackColor: Color(0xFFFEFEFF),
                        inactiveTrackColor: Color(0xFF888997),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        min: 120,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                    )
                  ],
                ),
            color: customContainerActiveColor,
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CustomContainer(
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight",style: customContainerTextStyle,),
                        Text(weight.toString(),style: customContainerWeightTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(icon: FontAwesomeIcons.minus, onPress: (){

                              setState(() {
                                if(weight <= 40){
                                  weight = 40;
                                }else{
                                  weight--;
                                }
                              });

                            }),
                            SizedBox(width: 15,),
                            RoundedButton(icon: FontAwesomeIcons.plus, onPress: (){
                              setState(() {
                                if(weight >= 150){
                                  weight = 150;
                                }else{
                                  weight++;
                                }
                              });
                            }),
                          ],
                        ),

                      ],
                    ),
                color: customContainerActiveColor,
              ),),
              Expanded(
                  child: CustomContainer(
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age",style: customContainerTextStyle,),
                        Text(age.toString(),style: customContainerWeightTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(icon: FontAwesomeIcons.minus, onPress: (){

                              setState(() {
                                if(age <= 10){
                                  age = 10;
                                }else{
                                  age--;
                                }
                              });

                            }),
                            SizedBox(width: 15,),
                            RoundedButton(icon: FontAwesomeIcons.plus, onPress: (){
                              setState(() {
                                if(age >= 80){
                                  age = 80;
                                }else{
                                  age++;
                                }
                              });
                            }),
                          ],
                        ),

                      ],
                    ),
                color: customContainerActiveColor,
              )),
            ],
          )),
          BottomButton(onPress: (){
            CalculatorBrain cal = CalculatorBrain(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              resultText: cal.getResult(),
              interpretation: cal.getInterpretation(),
              bmiResult: cal.calculateBMI(),
            )));
          },
            text: "Calculate",
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;

  BottomButton({required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: buttomContainerColor,
        height: buttomContainerheight,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

