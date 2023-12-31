import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../runtime_models/bill/bill_data.dart';
import '../../runtime_models/user/user_data.dart';
import '../../services/authentication_service.dart';
import '../../services/user_data_repository.dart';
import '../../utilities/bill_utilities/bill_cards_compact.dart';
import '../../utilities/decorations.dart';
import '../bill/bill_info/bill_info.dart';
import '../bill/bill_list_screen.dart';
import '../bill/quick_split_dialog.dart';
import '../friends_screen/create_friend_dialog.dart';
import '../friends_screen/friends_page.dart';
import '../profile/profile_page.dart';
import 'home_page.dart';

const IconData darkIcon = MaterialSymbols.dark_mode;

const IconData lightIcon = MaterialSymbols.light_mode;
bool themeSwitch = false;

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  //TODO: modify someval, switch tile needs to parse in values
  get someval => null;

  @override
  Widget build(BuildContext context) {
    final UserData? userData = context.watch();
    final List<BillData>? bills = context.watch();

    return Scaffold(
      appBar: AppBar(
        shape: appBarShape,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        title: const Text("Home", style: TextStyle(fontWeight: FontWeight.w400, height: 28)),
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Symbols.menu),
        //   padding: const EdgeInsets.only(left: 16, right: 24),
        //   iconSize: 24,
        // ),
        actions: const [
          // Padding(
          //   padding: const EdgeInsets.only(left: 24, right: 16),
          //   child: TextButton(
          //     onPressed: AuthenticationService().signOut,
          //     child: const Text('Log out'),
          //   ),
          // )
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        shape: const RoundedRectangleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://d1.awsstatic.com/MaxTsai.c5d516fa5ed7f7171553e9e2df1585e77ab88f87.png',
                ),
              ),
              accountName: userData == null ? null : Text(userData.publicProfile.name),
              accountEmail: null,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Symbols.settings),
              title: const Text("Settings"),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text('Theme'),
            ),
            // SwitchListTile(
            //   value: true,
            //   onChanged: (bool? value) {
            //     setState(() {
            //       value = value;
            //     });
            //   },
            //   title: const Text('System Default'),
            // ),

            SwitchListTile(
              thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Icon(darkIcon);
                  }
                  return const Icon(lightIcon);
                },
              ),
              value: userData == null
                  ? false
                  : switch (userData.privateProfile.themeMode) {
                      ThemeMode.light => false,
                      ThemeMode.dark => true,
                      _ => false
                    },
              onChanged: (bool? value) {
                if (userData == null) return;

                userData.privateProfile.themeMode = value! ? ThemeMode.dark : ThemeMode.light;
                context.read<UserDataRepository>().pushUserData(userData);
              },
              title: const Text('Theme', maxLines: 1, overflow: TextOverflow.fade),
              secondary: const Icon(Icons.contrast),
            ),

            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text('Account'),
            ),
            ListTile(
              //TODO: add snackbar to notify logged out
              onTap: AuthenticationService().signOut,
              leading: const Icon(Symbols.logout),
              title: const Text("Sign Out"),
            ),
          ],
        ),
      ),
      body: userData == null
          // ? const Placeholder()
          ? Center(
              child: Transform.scale(
                scale: 5.0,
                //* or use LinearProgressIndicator())
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 24.0),
                child: Column(
                  children: [
                    // Profile Icon and Welcoming Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Welcome Back, ', style: TextStyle(fontSize: 25.0)),
                            Text('${userData.publicProfile.name} !',
                                style:
                                    const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        //const SizedBox(24),
                        // ? Make Profile Icon clickable to direct to Profile Page (Notes for Myself)
                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const ProfilePage())),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://d1.awsstatic.com/MaxTsai.c5d516fa5ed7f7171553e9e2df1585e77ab88f87.png"),
                          ),
                        ),
                      ],
                    ),
                    // Container Box for Something
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Theme.of(context).colorScheme.primaryContainer,
                          //Theme.of(context).colorScheme.surfaceVariant
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Innovation champion in digital disruption"),
                                //Text("Yeah"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 2),
                    const SizedBox(height: 24.0),

                    // Quick Start Buttons:
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick Start",
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add Friend Home Button:
                        Expanded(
                          child: Column(
                            children: [
                              Material(
                                  child: Ink(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: InkWell(
                                  onTap: () {
                                    createFriendDialog(context);
                                  },
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: const Icon(Symbols.person_add, size: 45.0),
                                ),
                              )),
                              const SizedBox(height: 5.0),
                              Text(
                                "Add Friend",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Group Add Home Button:
                        Expanded(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Material(
                                  child: Ink(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondaryContainer,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: InkWell(
                                  onTap: () {
                                    quickSplitDialog(context);
                                  },
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: const Icon(Symbols.payments, size: 45.0),
                                ),
                              )),
                              const SizedBox(height: 5.0),
                              Text(
                                "Split Bill",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bill Split Home Button:
                        Expanded(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Material(
                                  child: Ink(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.tertiaryContainer,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FriendsPage(),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: const Icon(Symbols.group_add, size: 45.0),
                                ),
                              )),
                              const SizedBox(height: 5.0),
                              Text(
                                "Add Group",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), // End of Home Button Row

                    const SizedBox(height: 30.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent Transactions",
                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              //context.read<RootForm>().currentPageId = 1;
                            });
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const BillListScreen()),
                            );
                            print(context.read<RootForm>().currentPageId);
                          },
                          child: const Text("See All"),
                        ),
                      ],
                    ),

                    bills == null
                        ? const Placeholder()
                        : bills.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 120),
                                child: Text('Seems empty here', style: TextStyle(fontSize: 22.0)),
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: min(bills.length, 5),
                                itemBuilder: (context, index) => BillCardsCompact(
                                  billData: bills[index],
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BillInfo(billData: bills[index]),
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index) => const SizedBox(height: 10),
                              )
                  ],
                ),
              ),
            ),
    );
  }
}
