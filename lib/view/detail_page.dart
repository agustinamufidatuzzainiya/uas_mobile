import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/film.dart';

class detailFilm extends StatelessWidget {
  final Film film;

  const detailFilm({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(film.judulAsli,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  "Rilis: ${film.tanggalRilis.substring(8, 10)}-${film.tanggalRilis.substring(5, 7)}-${film.tanggalRilis.substring(0, 4)}",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    Widget bagianDeskripsi = Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        film.sinopsis,
        style: GoogleFonts.lato(
          color: Colors.black,
          fontSize: 16,
        ),
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 69, 69),
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(
              maxWidth: 24,
              maxHeight: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        title: Text(
          film.judulAsli,
          style: GoogleFonts.lato(),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 247, 236, 236), // Ganti warna latar belakang sesuai kebutuhan Anda
        child: ListView(
          padding: const EdgeInsets.all(18.0),
          children: <Widget>[
            bagianJudul,
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${film.gambar}",
                width: 600,
                fit: BoxFit.cover,
              ),
            ),
            bagianDeskripsi,
          ],
        ),
      ),
    );
  }
}
