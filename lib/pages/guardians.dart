import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/model/guardian.dart';
import 'package:rakshak/services/guardian.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_widgets/cutom_list_tile.dart';

class Guardians extends StatefulWidget {
  const Guardians({Key? key}) : super(key: key);

  @override
  State<Guardians> createState() => _GuardiansState();
}

class _GuardiansState extends State<Guardians> {
  late List<Guardian> guardian;
  bool loading = true;
  @override
  void initState() {
    guardian = [];
    getGuardianList();
    super.initState();
  }

  getGuardianList() async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await GuardianService().getGuardian(prefs.getString("User_id")!);
    if (response.statusCode == 201) {
      final fetchGuardians = List.generate(
        response.data.length,
        (int index) => Guardian.fromMap(
          response.data[index],
        ),
      );
      setState(() {
        loading = false;
        guardian = fetchGuardians;
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
              'My Guardians',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kMarronColor,
                  ),
                )
              : guardian.isEmpty
                  ? const Center(
                      child: Text("No Guardians Added"),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: guardian.length,
                          itemBuilder: (context, index) {
                            return CustomListTile(
                                title: guardian[index].guardianName ?? "",
                                subtitle:
                                    guardian[index].guardianPhone.toString(),
                                icon: Icons.people);
                          }),
                    )
        ],
      ),
    ));
  }
}
