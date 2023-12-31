import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../runtime_models/bill/bill_data.dart';
import '../runtime_models/user/user_data.dart';
import '../services/authentication_service.dart';
import 'bill/bill_card.dart';

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 222222; //Change to huge number from origin of 0.

  final _formKey = GlobalKey<FormState>();
  int currentPage = 0; // Keeps track of the Current Page Index.

  //Experiment----
  // TestDatabase testDatabase = TestDatabase();
  //--------------

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final UserData? userData = context.watch();
    final List<BillData>? bills = context.watch();
    // return switch (_currentPage) {
    //   2 => const FriendsPage(),
    //   0 || 1 => Scaffold(

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.

        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,

        title: userData == null ? const SizedBox.shrink() : Text(userData.publicProfile.name),

        actions: [
          ElevatedButton(
            onPressed: context.read<AuthenticationService>().signOut,
            child: const Text('Log out'),
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // User Inputs:

            // Bill Name:
            ExpansionTile(
              // Expansion List Tile
              title: const Center(child: Text("Inputs")),
              subtitle: const Text("Click to Expand"),
              // backgroundColor: Colors.red,
              // collapsedBackgroundColor: Colors.black,

              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          // Validator receives the user input
                          validator: (billNameValue) {
                            // Return value variable (The information entered).
                            if (billNameValue == null || billNameValue.isEmpty) {
                              return "Please the Bill Name";
                            }
                            // return null;
                            return billNameValue;
                          },
                          decoration: const InputDecoration(
                              labelText: "Bill Name",
                              hintText: "Blockbuster",
                              prefixIcon: Icon(Icons.edit)),
                        ),

                        // Bill Total:
                        TextFormField(
                          // Validator receives the user input
                          validator: (billTotalValue) {
                            // Return value variable (The information entered).
                            if (billTotalValue == null || billTotalValue.isEmpty) {
                              return "Please enter the Bill Total";
                            }
                            // return null;
                            return billTotalValue;
                          },
                          decoration: const InputDecoration(
                              labelText: "Bill Total",
                              hintText: "4.78 Ringgit",
                              prefixIcon: Icon(Icons.attach_money)),
                        ),

                        // Bill Date:
                        TextFormField(
                          // Validator receives the user input
                          validator: (billDateValue) {
                            // Return value variable (The information entered).
                            if (billDateValue == null || billDateValue.isEmpty) {
                              return "Please enter the Bill Date";
                            }
                            // return null;
                            return billDateValue;
                          },
                          decoration: const InputDecoration(
                              labelText: "Bill Date",
                              hintText: "19 BBY",
                              prefixIcon: Icon(Icons.date_range)),
                        ),
                        const SizedBox(height: 15.0),
                        // Submit Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If validate is true, then trigger snackbar.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Center(
                                    child: Text("Submitted"),
                                  ),
                                  backgroundColor: Colors.red,
                                  closeIconColor: Colors.black,
                                  showCloseIcon: true,
                                ),
                              );
                            }
                          },
                          child: const Text("Enter", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Text("Transaction History", style: Theme.of(context).textTheme.headlineMedium),
            const Text("Displaying Most Recent", style: TextStyle(fontSize: 20)),

            bills == null
                ? const SizedBox.shrink()
                : Expanded(
                    // Makes the ListView scrollable.
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      itemCount: bills.length,
                      itemBuilder: (context, index) => BillCard(billData: bills[index]),
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
