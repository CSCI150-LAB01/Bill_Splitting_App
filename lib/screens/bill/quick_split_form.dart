import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../runtime_models/user/public_profile.dart';
import '../../runtime_models/user/user_data.dart';
import '../../services/bill_data_repository.dart';

class QuickSplitForm {
  final Locator read;
  // final pageController = PageController();
  int currentPageId = 0;

  final nameFieldController = TextEditingController();
  final dateFieldController = TextEditingController();
  final totalSpentFieldController = TextEditingController();

  late Map<PublicProfile, bool> friendInvolvements;

  QuickSplitForm({required this.read}) {
    final UserData? userData = read();

    if (userData == null) {
      friendInvolvements = {};
      return;
    }

    friendInvolvements = {for (var profile in userData.nonRegisteredFriends.values) profile: false};
  }

  Future<void> createBill() async {
    final UserData? userData = read();

    String name = nameFieldController.text.trim();
    DateTime dateTime = DateFormat.yMMMMd().parse(dateFieldController.text.trim());
    double totalSpent = double.parse(totalSpentFieldController.text.trim());

    if (userData == null) return;

    read<BillDataRepository>().createBill(
      dateTime: dateTime,
      name: name,
      totalSpent: totalSpent,
      payer: userData.publicProfile,
      primarySplits: friendInvolvements.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList(),
    );
    // userData.nonRegisteredFriends.add(PublicProfile(
    //   uid: const Uuid().v1(),
    //   createdBy: userData.publicProfile,
    //   name: nameFieldController.text,
    // ));
    //read<UserDataRepository>().pushUserData(userData);
  }

  Future<void> submitBillInfo() async {
    FocusManager.instance.primaryFocus?.unfocus();
    // await pageController.animateToPageWithDefaults(1);
    //if (context.mounted) Navigator.of(context).pop();
    //TODO: validate
  }
}
