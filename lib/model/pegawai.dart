import 'package:hive/hive.dart';
part 'pegawai.g.dart';

@HiveType(typeId: 0)
class Pegawai {
  @HiveField(0)
  int? no;
  @HiveField(1)
  int? nomorInduk;
  @HiveField(2)
  String? nama;
  @HiveField(3)
  String? alamat;
  @HiveField(4)
  String? tanggalLahir;
  @HiveField(5)
  String? tanggalBergabung;

  Pegawai(
    this.alamat,
    this.nama,
    this.no,
    this.nomorInduk,
    this.tanggalBergabung,
    this.tanggalLahir,
  );
}
