import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  final String username2;
  HomePage({required this.username2});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double hasil = 0;

  void hitungBmi() {
    double tinggi = double.parse(_TinggiController.text);
    double berat = double.parse(_BeratController.text);
    hasil = berat / ((tinggi / 100) * (tinggi / 100));
    // if (tinggi != null || berat != null) {
    //   hasil = berat / ((tinggi / 100) * (tinggi / 100));
    // } else {
    //   (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: const Text('Tolong isi form dengan lengkap!'),
    //   )));
    // }
  }

  validate() {
    if (_TinggiController.text != '' && _BeratController.text != '') {
      hitungBmi();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Tolong isi semua formnya!')));
    }
  }

  final TextEditingController _TinggiController = TextEditingController();
  final TextEditingController _BeratController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : bikin tampilan UI
      appBar: AppBar(title: Text("hitung BMI anda")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Text(
                "selamat Datang $username",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(
              height: 80,
              child: Text(
                hasil.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            TextField(
              controller: _TinggiController,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                hintText: 'Masukkan Tinggi Badan (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _BeratController,
              decoration: InputDecoration(
                labelText: 'Berat Badan (kg)',
                hintText: 'Masukkan Berat Badan (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  validate();
                });
              },
              child: Text('Hitung BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
