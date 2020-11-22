import 'package:flutter_bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'dart:math';


enum GenderName{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 180;
  double weight = 50.0;
  double bmi;
  int age = 15;
  GenderName selectedGender;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  //
  //
  // void updateColor(GenderName gname){
  //   if(gname == GenderName.male){
  //     maleCardColour = activeCardColour;
  //     femaleCardColour = inactiveCardColour;
  //   }
  //   else{
  //     femaleCardColour = activeCardColour;
  //     maleCardColour = inactiveCardColour;
  //   }
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(      //MALE CARD
                      child: GestureDetector(    //here the gesture detector is specified explicitly
                        onTap: (){
                          setState(() {
                            selectedGender = GenderName.male;
                          });
                        },
                        child: ReusableCard(
                          color: selectedGender == GenderName.male ? kActiveCardColour : kInactiveCardColour,
                          cardChild: IconContent(FontAwesomeIcons.mars,'MALE'),
                        ),
                      ),
                    ),
                    Expanded(      //FEMALE CARD
                      child: ReusableCard(      // here the gesture detector is passed on as an argument in the reusable card from reusable_card.dart file
                        onPress: (){
                          setState(() {
                            selectedGender = GenderName.female;
                          });
                        },
                        color: selectedGender == GenderName.female ? kActiveCardColour : kInactiveCardColour,
                        cardChild: IconContent(FontAwesomeIcons.venus,'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(     //HEIGHT
                child:  ReusableCard(
                    color: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x50EB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                          ),
                          child: Slider(
                            value: height,
                            min: 120.0,
                            max: 240.0,

                            onChanged: (double newValue){
                              setState(() {
                                height = double.parse((newValue).toStringAsFixed(2));
                              });
                            },

                          ),
                        )
                      ],
                    )

                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child:  ReusableCard(
                        color: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString() ,
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedIconButton(
                                  icon:FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      weight ++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundedIconButton(
                                  icon:FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      weight --;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child:  ReusableCard(
                        color:kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedIconButton(
                                  icon:FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age ++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundedIconButton(
                                  icon:FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age --;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  bmi = weight / pow((height/100),2);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage(bmiResult: bmi)));
                },
                child: Container(
                  color: kBottomContainerColour,
                  height: 80.0,
                  margin: EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text(
                        'CALCULATE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon,this.onPressed});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


