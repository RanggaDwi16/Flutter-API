
import 'package:flutter/material.dart';
import 'package:flutter_api/detail_page.dart';
import 'package:flutter_api/makanan.dart';
import 'package:flutter_api/styles.dart';

class ListItem extends StatelessWidget {
  final url = 'https://bengkelkoding.dinus.ac.id/food/';
  final Makanan makanan;

  const ListItem({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(makanan: makanan),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: decorBoxContainer(),
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  url+makanan.gambar,
                  height: 75,
                  width: 85,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            itemText(),
            Icon(Icons.food_bank_rounded, color: iconColor, size: 30)
          ],
        ),
      ),
    );
  }

  BoxDecoration decorBoxContainer() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 178, 178, 178),
          offset: Offset(1.0, 2.0),
          blurRadius: 6.0,
        ),
      ],
    );
  }

  Expanded itemText() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(makanan.nama, style: textHeader2),
          Text(
            makanan.deskripsi,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black38),
          ),
          Text(
            makanan.harga,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
