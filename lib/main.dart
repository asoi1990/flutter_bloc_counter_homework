import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/autoIncreament/bloc/auto_increament_number_bloc.dart';
import 'package:flutter_application_1/bloc/increase_number_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/increase_number_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autoNumber = AutoIncreamentNumberBloc();
// final _bloc = AutoIncreamentNumberBloc();
    return BlocProvider(
        create: (context) => ChangingNumberBloc(),
        child: MaterialApp(
          home: BlocBuilder<ChangingNumberBloc, ChangingNumberState>(
            builder: (context, state) {
              return Scaffold(
                  body: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.changingNumber.toString(),
                      style: Theme.of(context).textTheme.headline4),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    padding: const EdgeInsets.all(16),
                                    primary: Colors.black,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ChangingNumberBloc>()
                                        .add(IncreaseNumberEvent());
                                  },
                                  child: const Text('+'),
                                ),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    padding: const EdgeInsets.all(16),
                                    primary: Colors.black,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ChangingNumberBloc>()
                                        .add(DecreaseNumberEvent());
                                  },
                                  child: const Text('-'),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.black,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                autoNumber.startStream();
                              },
                              child: const Text('Start'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.black,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                autoNumber.stopStream();
                              },
                              child: const Text('Stop'),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: StreamBuilder<int>(
                        stream: autoNumber.updatedNumber,
                        builder: (context, AsyncSnapshot<int> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.active ||
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text('Error');
                            } else if (snapshot.hasData) {
                              return Text(snapshot.data.toString(),
                                  style: Theme.of(context).textTheme.headline4);
                            } else {
                              return const Text('Empty data');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        }),
                  )
                ],
              )));
            },
          ),
        ));
  }
}


// https://medium.com/flutter-community/flutter-bloc-with-streams-6ed8d0a63bb8

// https://flutterbyexample.com/lesson/calendar-app-introduction