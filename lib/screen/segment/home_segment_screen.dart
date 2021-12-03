import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mceasy/model/pegawai.dart';
import 'package:mceasy/screen/detail_pegawai_screen.dart';
import 'package:mceasy/theme.dart';

class HomeSegmentScreen extends StatefulWidget {
  const HomeSegmentScreen({Key? key}) : super(key: key);

  @override
  _HomeSegmentScreenState createState() => _HomeSegmentScreenState();
}

class _HomeSegmentScreenState extends State<HomeSegmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(0.18),
        titleSpacing: 0,
        leadingWidth: 100,
        leading: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(left: 18),
            child: Image.asset(
              'assets/images/icon.png',
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 18),
              child: const Icon(
                Icons.account_circle,
                color: primaryColors,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Hive.openBox("pegawai"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: TextStyles(value: "${snapshot.error}"),
              );
            } else {
              //body
              var pegawai = Hive.box("pegawai");
              if (pegawai.length == 0) {
                pegawai.add(Pegawai("Jl.Meduran", "Agus", 1, 123121512,
                    "12-01-2021", "12-01-1999"));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: const Center(
                        child: TextStyles(
                          value: "Hi, Welcome",
                          weight: FontWeight.bold,
                          size: 26,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: const Center(
                        child: TextStyles(
                          value: "PT. Otto Menara Globalindo",
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 30, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 2)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextStyles(
                            value: "Pendatang Baru",
                            size: 16,
                            color: primaryColors,
                            weight: FontWeight.bold,
                          ),
                          AspectRatio(
                            aspectRatio: 2.8,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.account_circle,
                                        color: primaryColors,
                                        size: 90,
                                      ),
                                      TextStyles(
                                        value: "Lorem Alex",
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25, left: 15),
                      child: const TextStyles(
                        value: "Para Karyawan",
                        size: 16,
                        color: primaryColors,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pegawai.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          Pegawai result = pegawai.getAt(index);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailPegawaiScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 2)
                                ],
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextStyles(
                                        value: result.nama,
                                        weight: FontWeight.bold,
                                        size: 16,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        child: const TextStyles(
                                          value: "1120148765222",
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 14),
                                        child: const TextStyles(
                                          value:
                                              "Bergabung Sejak | 14 November 2001",
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.account_circle,
                                    color: primaryColors,
                                    size: 60,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
