import 'package:bmi_cal/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_cal/components/icon_content.dart';
import 'package:bmi_cal/components/reusable_container.dart';
import 'package:bmi_cal/constants.dart';
import 'package:bmi_cal/components/bottom_button.dart';
import 'package:bmi_cal/components/round_icon_button.dart';
import 'package:bmi_cal/functionality.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            //the first row of the column with two cards male and female
            children: [
              Expanded(
                child: ReusableContainer(
                  colour: selectedGender == Gender.male
                      ? kActiveContainerBackground
                      : kInactiveContainerBackground,
                  cardChild: const IconReusableContent(
                    text: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  colour: selectedGender == Gender.female
                      ? kActiveContainerBackground
                      : kInactiveContainerBackground,
                  cardChild: const IconReusableContent(
                    text: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          )),
          //ending of the first row
          Expanded(
            child: ReusableContainer(
              colour: kActiveContainerBackground,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableContainer(
                  colour: kActiveContainerBackground,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
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
                child: ReusableContainer(
                  colour: kActiveContainerBackground,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
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
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain cal = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  ),
                ),
              );
            },
            buttonText: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
