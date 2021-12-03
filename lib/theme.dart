import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mceasy/screen/home_screen.dart';
import 'package:mceasy/screen/segment/cuti_segment_screen.dart';
import 'package:mceasy/screen/segment/home_segment_screen.dart';

const Color primaryColors = Color(0xFF524E7F);
Color accentColor = Colors.grey.withOpacity(0.8);

const dancingSpinkit = SpinKitWave(
  color: Color(0xFF524E7F),
  size: 30.0,
);

snackBar(context, {String? message, Color? color, int duration = 2}) {
  final snackBar = SnackBar(
    content: Text(message!),
    backgroundColor: color != null ? color : null,
    duration: Duration(seconds: duration),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class TextStyles extends StatelessWidget {
  const TextStyles({
    Key? key,
    this.color = Colors.black,
    this.size = 14,
    this.value,
    this.weight,
    this.align = TextAlign.left,
    this.line = 2,
  }) : super(key: key);

  final String? value;
  final Color color;
  final double size;
  final FontWeight? weight;
  final TextAlign align;
  final int line;

  @override
  Widget build(BuildContext context) {
    return Text(
      value!,
      textAlign: align,
      maxLines: line,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}

List<Widget> homeSegment = <Widget>[
  const HomeSegmentScreen(),
  const CutiSegmentScreen(),
];

final detailPegawaiTitle = <String>["Ambil Cuti", "Maximal Cuti", "Sisa Cuti"];

final textNavbar = <String>["Home", "Daftar Cuti"];
const navbarIcon = <IconData>[
  Icons.home,
  Icons.history_edu,
];
