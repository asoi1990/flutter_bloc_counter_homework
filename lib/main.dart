import 'package:flutter/material.dart';
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
    final inputValueController = TextEditingController();
    return BlocProvider(
        create: (context) => ChangingNumberBloc(),
        child: MaterialApp(
          home: BlocBuilder<ChangingNumberBloc, ChangingNumberState>(
            builder: (context, state) {
              return Scaffold(
                  body: Center(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.changingNumber.toString(),
                      style: Theme.of(context).textTheme.headline4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.all(16),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            context.read<ChangingNumberBloc>().add(
                                IncreaseNumberEvent(inputValueController.text));
                          },
                          child: const Text('+'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.all(16),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            context.read<ChangingNumberBloc>().add(
                                DecreaseNumberEvent(inputValueController.text));
                          },
                          child: const Text('-'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            context.read<ChangingNumberBloc>().add(
                                AutoStartNumberEvent(
                                    inputValueController.text));
                          },
                          child: const Text('Start'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            context.read<ChangingNumberBloc>().add(
                                StopNumberEvent(inputValueController.text));
                          },
                          child: const Text('Stop'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 110,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Input Value',
                      ),
                      controller: inputValueController,
                    ),
                  ),
                ],
              )));
            },
          ),
        ));
  }
}
