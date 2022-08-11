import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      // make dark theme
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeigth = MediaQuery.of(context).size.height;

    final myAppBar = AppBar(
      title: const Text('Flutter Demo'),
    );

    final bodyHeigth = mediaQueryHeigth -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your selected date is: ${selectedDate.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mediaQueryWidth * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Pick up Birth Date'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    initialDatePickerMode: DatePickerMode.year,

                    //! Duration for the limited date piker
                    // selectableDayPredicate: (day) {
                    //   if (day.isAfter(
                    //           DateTime.now().subtract(Duration(days: 5))) &&
                    //       (day.isBefore(
                    //           DateTime.now().add(Duration(days: 5))))) {
                    //     return true;
                    //   } else {
                    //     return false;
                    //   }
                    // },
                    helpText: 'Help text',
                    cancelText: 'Cancel text',
                    confirmText: 'Confirm text',
                    fieldHintText: 'Input field',
                    fieldLabelText: 'Field label text',
                  ).then(
                    (value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = value;
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
