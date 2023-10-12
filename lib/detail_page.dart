import 'package:flutter/material.dart';
import 'package:flutter_api/makanan.dart';
import 'package:flutter_api/styles.dart';

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  final api = 'https://bengkelkoding.dinus.ac.id/food/';

  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(api+makanan.gambar, scale: 0.5),
                  const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [backButton(), FavouriteButton()],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(color: headerBackColor),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  makanan.nama,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    attributes(Icons.access_time_filled, makanan.waktubuka),
                    attributes(Icons.local_fire_department, makanan.kalori),
                    attributes(Icons.monetization_on, makanan.harga),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  makanan.detail,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              listGambar(),
              const SizedBox(height: 10),
              const Text(
                'Bahan Racikan',
                textAlign: TextAlign.center,
                style: textHeader2,
              ),
              const SizedBox(height: 10),
              listRacikan(),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listGambar() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: makanan.gambarlain.map((url) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(api+url),
            ),
          );
        }).toList(),
      ),
    );
  }

  SizedBox listRacikan() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.network(api+makanan.bahan[index].values.first, width: 52),
                    Text(makanan.bahan[index].keys.first),
                  ],
                ),
              ),
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: makanan.bahan.length),
    );
  }

  Column attributes(IconData icon, String teks) {
    return Column(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(height: 3),
        Text(
          teks,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(25),
          backgroundBlendMode: BlendMode.screen),
      child: IconButton(
        icon: Icon(
          isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 40,
        ),
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
      ),
    );
  }
}
