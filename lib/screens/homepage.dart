import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_pratical_2/globals/globals.dart';
import 'package:viva_pratical_2/models/controller/theme_controller.dart';

import '../helphers/firebase_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voter App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(
              Icons.light,
              size: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FireStoreHelper.ff.collection('candidate').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              QuerySnapshot<Map<String, dynamic>> data =
                  snapshot.data as QuerySnapshot<Map<String, dynamic>>;
              Global.allDocs = data.docs;
              return StatefulBuilder(builder: (context, setState) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Text(
                        "Live Data",
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  width: 5),
                            ),
                            child: Text(
                              "BJP : ${Global.allDocs[0].data()['bjp']}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  width: 5),
                            ),
                            child: Text(
                              "CONG : ${Global.allDocs[0].data()['cong']}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  width: 5),
                            ),
                            child: Text(
                              "AAP : ${Global.allDocs[0].data()['aap']}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  width: 5),
                            ),
                            child: Text(
                              "OTHERS : ${Global.allDocs[0].data()['other']}",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: StreamBuilder(
        stream: FireStoreHelper.ff.collection('candidate').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>> data =
                snapshot.data as QuerySnapshot<Map<String, dynamic>>;
            List<QueryDocumentSnapshot<Map<String, dynamic>>> allData =
                data.docs;
            return (allData[0].data()['voted'] == true)
                ? FloatingActionButton.large(
                    onPressed: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            shape: const RoundedRectangleBorder(),
                            title: const Text("Vote Any One"),
                            content: StatefulBuilder(
                              builder: (context, setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              Global.bjp = Global.bjp + 1;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "BJP 🌹",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              Global.cong = Global.cong + 1;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "CONG ✋",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              Global.aap = Global.aap + 1;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "AAP 🧹",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              Global.other = Global.other + 1;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "OTHERS 👌",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      });
                    },
                    child: Icon(Icons.how_to_vote),
                  )
                : Container();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
