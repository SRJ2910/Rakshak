import 'package:flutter/material.dart';
import 'package:rakshak/custom_widgets/constants.dart';
import 'package:rakshak/model/guardian.dart';
import 'package:rakshak/services/guardian.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xen_popup_card/xen_card.dart';
import '../custom_widgets/cutom_list_tile.dart';

class Guardians extends StatefulWidget {
  const Guardians({Key? key}) : super(key: key);

  @override
  State<Guardians> createState() => _GuardiansState();
}

class _GuardiansState extends State<Guardians> {
  late List<Guardian> guardian;
  bool loading = true;
  String addPhone = "";

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
        guardian = fetchGuardians.reversed.toList();
      });
    } else {
      locator<GlobalServices>().errorSnackBar("Something went wrong");
      setState(() {
        loading = false;
      });
    }
  }

  XenCardAppBar appBar = const XenCardAppBar(
    shadow: BoxShadow(color: Colors.transparent),
    child: Text(
      "Add guardian",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    ), // To remove shadow from appbar
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Guardians',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 160),
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return XenPopupCard(
                            appBar: appBar,
                            body: Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      addPhone = value;
                                    });
                                  },
                                  cursorColor: kMarronColor,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    focusColor: kMarronColor,
                                    hintText: "Enter phone number",
                                    icon: Icon(
                                      Icons.phone,
                                      color: kMarronColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text(
                                        'CANCEL',
                                        style: TextStyle(
                                            color: kMarronColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        GuardianService()
                                            .addGuardian(addPhone)
                                            .then((value) {
                                          if (value.statusCode == 201) {
                                            locator<GlobalServices>()
                                                .successSnackBar(
                                                    "Guardian added successfully");
                                            Navigator.of(context).pop(true);
                                            getGuardianList();
                                          } else {
                                            locator<GlobalServices>()
                                                .errorSnackBar(
                                                    "Something went wrong");
                                          }
                                        }).onError((error, stackTrace) {
                                          locator<GlobalServices>()
                                              .infoSnackBar(
                                                  "Guardian does not exist");
                                          Navigator.of(context).pop(true);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kMarronColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          child: Text(
                                            'ADD',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                child: const Icon(
                  Icons.person_add,
                  color: kMarronColor,
                ),
              )
            ],
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
    ));
  }
}
