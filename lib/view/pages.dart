import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../model/film.dart';
import '../view_model/fetchDataFilm.dart';
import 'detail_page.dart';

class GridMovie extends StatelessWidget {
  final String searchResult;
  const GridMovie({Key? key, required this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Film>>(
        future: fetchFilmTopRated(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Film not found"));
          } else {
            List<Film> filteredFilms = snapshot.data!
                .where((film) =>
                    film.judul.toLowerCase().contains(searchResult.toLowerCase()))
                .toList();

            return GridMovies(film: filteredFilms);
          }
        },
      ),
    );
  }
}


class GridMovies extends StatelessWidget {
  final List<Film>? film;
  const GridMovies({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: MediaQuery.of(context).size.width * 0.6),
            itemCount: film?.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailFilm(
                        film: film![index],
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Color.fromARGB(255, 190, 116, 103),
                  child: new Container(
                    padding: const EdgeInsets.all(14.0),
                    constraints: const BoxConstraints.expand(),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 7,
                                blurRadius: 7,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Image.network(
                            'http://image.tmdb.org/t/p/w300${film![index].poster}',
                            fit: BoxFit.cover,
                            width: 140,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          '${film![index].judulAsli}',
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListMovie extends StatelessWidget {
  final String searchResult;
  const ListMovie({Key? key, required this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Film>>(
        future: fetchFilmTopRated(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Film not found"));
          } else {
            List<Film> filteredFilms = snapshot.data!
                .where((film) =>
                    film.judul.toLowerCase().contains(searchResult.toLowerCase()))
                .toList();

            return ListMovies(film: filteredFilms);
          }
        },
      ),
    );
  }
}

class ListMovies extends StatelessWidget {
  final List<Film>? film;
  const ListMovies({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Center(
          child: ListView.builder(
            itemCount: film?.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailFilm(
                        film: film![index],
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Color.fromARGB(255, 190, 116, 103),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w300${film![index].poster}',
                            width: 75,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${film![index].judulAsli}',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Text(
                              "Rilis: ${film![index].tanggalRilis.substring(8, 10)}-${film![index].tanggalRilis.substring(5, 7)}-${film![index].tanggalRilis.substring(0, 4)}",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PopularMovie extends StatelessWidget {
  final String searchResult;
  const PopularMovie({Key? key, required this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Film>>(
        future: fetchFilmPopular(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Film not found"));
          } else {
            List<Film> filteredFilms = snapshot.data!
                .where((film) =>
                    film.judul.toLowerCase().contains(searchResult.toLowerCase()))
                .toList();

            return PopularMovies(film: filteredFilms);
          }
        },
      ),
    );
  }
}

class PopularMovies extends StatelessWidget {
  final List<Film>? film;

  const PopularMovies({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: film?.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailFilm(
                    film: film![index],
                  ),
                ),
              );
            },
            child: Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromARGB(255, 190, 116, 103),
                  child: Container(
                    height: 480,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w300${film![index].poster}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: Center(
                            child: Text(
                              film![index].judulAsli,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}