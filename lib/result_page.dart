import 'package:flutter_bmi_calculator/constants.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,this.bmiText,this.bmiDesc});
  String bmiDesc;
  String bmiText;
  final double bmiResult;
  TextStyle colorStyle;


  @override
  Widget build(BuildContext context) {
    if(bmiResult < 18.5){
      bmiDesc = "You need to take up more food to get healthy";
      bmiText = "UNDERWEIGHT";
      colorStyle = kUnderandOverResultTextStyle;
    }
    else if(bmiResult >= 18.5 && bmiResult < 25){
      bmiDesc = "You ARE DOING GREAT...KEEP IT UP";
      bmiText = "NORMAL";
      colorStyle = kNormalResultTextStyle;

    }
    else{
      bmiDesc = "Dude...control your food mhaan";
      bmiText = "OVERWEIGHT";
      colorStyle = kUnderandOverResultTextStyle;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Your Result",
                    style : TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiText,
                      style: colorStyle,
                    ),
                    Text(
                      bmiResult.toStringAsFixed(2),
                      style: kBmiTextStyle,
                    ),
                    Text(
                      bmiDesc,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: kBottomContainerColour,
                height: 80.0,
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(
                      'RE - CALCULATE',
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
        )
    );
  }
}
