import 'package:flutter/material.dart';
import 'bmi_result.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;

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
                          // Menggunakan try-catch untuk menangani input yang bukan angka
                          try {
                            tinggi = int.parse(txt);
                          } catch (e) {
                            // Tampilkan pesan error atau lakukan tindakan lain jika terjadi kesalahan
                            if (txt.isNotEmpty) {
                              print('Masukkan tinggi badan dengan angka yang valid');
                            }
                          }
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
                          try {
                            berat = int.parse(txt);
                          } catch (e) {
                            if (txt.isNotEmpty) {
                              print('Masukkan berat badan dengan angka yang valid');
                            }
                          }
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
                if (tinggi > 0 && berat > 0) {
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
              },
              child: Text('HITUNG BMI'),
            ),
          ],
        ),
      ),
    );
  }
}