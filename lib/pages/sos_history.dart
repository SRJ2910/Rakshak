import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/model/sos_history_user.dart';
import 'package:rakshak/services/sos_message_user.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_widgets/cutom_list_tile.dart';

class SOShistory extends StatefulWidget {
  const SOShistory({Key? key}) : super(key: key);

  @override
  State<SOShistory> createState() => _SOShistoryState();
}

class _SOShistoryState extends State<SOShistory> {
  late List<SosHistoryUser> history;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    history = [];
    getHistoryList();
  }

  getHistoryList() async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await SosMessageService().getHistory(prefs.getString("User_id")!);
    if (response.statusCode == 201) {
      final fetchGuardians = List.generate(
        response.data.length,
        (int index) => SosHistoryUser.fromMap(
          response.data[index],
        ),
      );
      setState(() {
        loading = false;
        history = fetchGuardians.reversed.toList();
      });
    } else {
      locator<GlobalServices>().errorSnackBar("Something went wrong");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24, top: 8, bottom: 8),
            child: Text(
              'SOS History',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kMarronColor,
                  ),
                )
              : history.isEmpty
                  ? const Center(
                      child: Text("No Guardians Added"),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            return CustomListTile(
                              title: history[index].message ?? "No message",
                              subtitle: history[index].time ?? 'No time',
                              trail: history[index].location ?? 'No location',
                              icon: Icons.history,
                            );
                          }),
                    )
        ],
      ),
    ));
  }
}
