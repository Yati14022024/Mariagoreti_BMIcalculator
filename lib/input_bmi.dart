import 'package:flutter/material.dart';
import 'bmi_result.dart'; // Pastikan Anda memiliki halaman hasil BMI

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  String tinggiInput = '';
  String beratInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MENGHITUNG BMI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/bmi.jpg', fit: BoxFit.fitWidth),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          tinggiInput = txt; // Simpan input sebagai string
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: 'cm',
                        hintText: 'Tinggi',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (txt) {
                        setState(() {
                          beratInput = txt; // Simpan input sebagai string
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: 'kg',
                        hintText: 'Berat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Validasi input sebelum navigasi
                if (tinggiInput.isNotEmpty && beratInput.isNotEmpty) {
                  int? tinggi = int.tryParse(tinggiInput); // Menggunakan tryParse untuk menghindari error
                  int? berat = int.tryParse(beratInput);

                  if (tinggi != null && berat != null && tinggi > 0 && berat > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIResult(
                          tinggi_badan: tinggi,
                          berat_badan: berat,
                        ),
                      ),
                    );
                  } else {
                    // Tampilkan pesan kesalahan jika input tidak valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tinggi dan Berat harus lebih dari 0')),
                    );
                  }
                } else {
                  // Tampilkan pesan kesalahan jika input kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tinggi dan Berat tidak boleh kosong')),
                  );
                }
              },
              child: Text('HITUNG BMI'),
            ),
          ],
        ),
      ),
    );
  }
}