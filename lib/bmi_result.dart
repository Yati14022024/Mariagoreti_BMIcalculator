import 'package:flutter/material.dart';
import 'dart:math';

class BMIResult extends StatelessWidget {
  final int tinggi_badan;
  final int berat_badan;

  // Gunakan required di konstruktor
  BMIResult({required this.tinggi_badan, required this.berat_badan});

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    String cBMI;

    if (bmi >= 28) {
      cBMI = "Obese";
    } else if (bmi >= 23) {
      cBMI = "Overweight";
    } else if (bmi >= 17.5) {
      cBMI = "Normal";
    } else {
      cBMI = "Underweight";
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              cBMI,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2), // Menampilkan BMI dengan dua angka desimal
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white60,
              ),
            ),
            Text(
              '17.5 - 22.9', // Mengganti koma dengan titik
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: ElevatedButton( // Mengganti RaisedButton dengan ElevatedButton
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black54, // Mengatur warna latar belakang
          ),
          onPressed: () {
            Navigator.pop(context); // Tambahkan aksi untuk tombol BACK
          },
          child: Text(
            'BACK',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}