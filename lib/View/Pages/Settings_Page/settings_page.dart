import 'package:flutter/material.dart';
import 'package:orange/View/Components/core/AppBar/AppBar.dart';
import 'package:orange/View/Pages/signIn_Page/SignIn_Page.dart';
import 'package:orange/View_Model/Database/Local/CacheHelper.dart';

import '../../../Models/SettingsModel/SettingsModel.dart';
import '../../Components/Settings/Divider.dart';
import '../../Components/Settings/textTile.dart';
import '../Faq_Page/Faq_Page.dart';
import '../Partners_Page/partners._Page.dart';
import '../Support_Page/Support.dart';
import '../Terms_Page/Terms_Page.dart';

class settings_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "Settings", context: context),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              customListTile(text: "FAQ", onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => faq_screen(),));}),
              customDivider(),
              customListTile(text: "Terms & Conditions", onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => terms_Screen(),));}),
              customDivider(),
              customListTile(text: "Our partenrs", onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => partner_screen(),));}),
              customDivider(),
              customListTile(text: "Support", onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => support_Screen(),));}),
              customDivider(),
              customListTile(text: "Log out", onTap: () {showDialog(context: context, builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: const Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        ),
                        content: const Text("Are You Sure ?"),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.deepOrange),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 120,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: const Text(
                                  "cancel",
                                  style: TextStyle(
                                      color: Colors.deepOrange, fontSize: 18),
                                ),
                              )),
                          Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  CacheHelper.removerData(key: "token").then((value) {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn_Screen(),), (route) => false);
                                  });
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepOrange),
                                  elevation: MaterialStateProperty.all(2),
                                ),
                                child: const Text(
                                  "sure",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )),
                        ],
                      ), barrierDismissible: false,);}),
            ],
          ),
        ));
  }
}
