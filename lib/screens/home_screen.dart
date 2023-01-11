import 'package:caluclater_app/funcations/caluclator.dart';
import 'package:caluclater_app/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final calu = caluclator().buttons;
  final operator = caluclator().isOperator;
  String userInput = 'Made By FlutterBoy';
  String answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                          userInput,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    //
                    //
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                          answer,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //
          //

          Expanded(
            flex: 2,
            child: SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: caluclator().buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  //*Clear Button
                  if (index == 0) {
                    return CaluButton(
                        textColor: Colors.white,
                        onTap: () {
                          setState(() {
                            userInput = '';
                            answer = '';
                          });
                        },
                        text: calu[index],
                        bColor: Colors.green);

                    //! Delete Button
                  } else if (index == 1) {
                    return CaluButton(
                        textColor: Colors.white,
                        onTap: () {
                          if (userInput.isNotEmpty) {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          } else {}
                        },
                        text: calu[index],
                        bColor: Colors.red);
                    //*Equal Button
                  } else if (index == calu.length - 1) {
                    return CaluButton(
                      text: calu[index],
                      textColor: Colors.white,
                      bColor: const Color(0xff5c31ab),
                      onTap: () {
                        setState(() {
                          answer = caluclator().equalPressed(userInput, answer);
                        });
                      },
                    );
                    //* Numbers
                  } else if (index == calu.length - 2) {
                    return CaluButton(
                      onTap: () {
                        setState(() {
                          userInput = answer;
                          answer = '';
                        });
                      },
                      text: calu[index],
                      textColor: const Color(0xff5c31ab),
                      bColor: Colors.white,
                    );
                  } else {
                    return CaluButton(
                      onTap: () {
                        setState(() {
                          userInput = userInput + calu[index];
                        });
                      },
                      text: calu[index],
                      textColor: operator(calu[index])
                          ? Colors.white
                          : const Color(0xff5c31ab),
                      bColor: operator(calu[index])
                          ? const Color(0xff5c31ab)
                          : Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
