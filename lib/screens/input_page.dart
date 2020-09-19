import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/gender_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightAllInches = 61; //height in inches
  double heightFeet = 5;
  int heightInches = 1;
  int weight = 105;
  int age = 21;

  void calculateFeet() {
    heightFeet = (heightAllInches - heightAllInches % 12) / 12;
  }

  void calculateInches() {
    heightInches = heightAllInches % 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kMahColor
                        : kInactiveColor,
                    cardChild: GenderCard(
                        gender: 'MALE', genderIcon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kMahColor
                        : kInactiveColor,
                    cardChild: GenderCard(
                        gender: 'FEMALE', genderIcon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kMahColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heightFeet.toInt().toString(),
                        style: kThiccLetters,
                      ),
                      Text(
                        'ft',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        heightInches.toString(),
                        style: kThiccLetters,
                      ),
                      Text(
                        'in',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.0,
                      ),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                      thumbColor: kBottomContainerColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGrayAccent,
                    ),
                    child: Slider(
                      value: heightAllInches.toDouble(),
                      min: 24.0,
                      max: 84.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightAllInches = newValue.toInt();
                          calculateFeet();
                          calculateInches();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kMahColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kThiccLetters,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kMahColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kThiccLetters,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            tapped: () {
              CalculatorBrain calc = CalculatorBrain(heightAllInches, weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      adviceText: calc.getAdvice());
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

//custom widget basically from scratch
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function pressed;

  const RoundIconButton({@required this.pressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: kCircleButton,
      child: Icon(
        icon,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
