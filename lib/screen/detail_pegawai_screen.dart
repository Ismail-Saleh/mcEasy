import 'package:flutter/material.dart';
import 'package:mceasy/theme.dart';

class DetailPegawaiScreen extends StatefulWidget {
  const DetailPegawaiScreen({Key? key}) : super(key: key);

  @override
  _DetailPegawaiScreenState createState() => _DetailPegawaiScreenState();
}

class _DetailPegawaiScreenState extends State<DetailPegawaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColors,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(0.18),
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.only(left: 18),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
        title: const TextStyles(
          value: "Detail Pegawai",
          color: Colors.white,
          size: 19,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                padding: const EdgeInsets.only(bottom: 60),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: primaryColors,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: detailPegawaiTitle.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            TextStyles(
                              value: detailPegawaiTitle[index],
                              color: Colors.grey.shade400,
                              weight: FontWeight.bold,
                              size: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextStyles(
                                value: "12",
                                color: Colors.grey.shade300,
                                size: 40,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 130,
                      ),
                      TextStyles(
                        value: "Alex Lorem",
                        color: Colors.white,
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                      TextStyles(
                        value: "Supervisor",
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: Image.asset(
                'assets/images/notfound.png',
                width: 250,
              ),
            ),
          )
        ],
      ),
    );
  }
}
