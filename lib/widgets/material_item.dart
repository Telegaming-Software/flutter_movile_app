import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MaterialItem extends StatelessWidget {
  String coverUri;
  String title;
  String coach;
  int id;

  MaterialItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.coach,
      required this.coverUri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height / 2.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(coverUri),
              ),
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(15),
                topStart: Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              title,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.person_pin, color: Colors.black),
                const SizedBox(width: 10),
                AutoSizeText(
                  coach,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              child:
                  const Text('Comprar ahora', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(00, 182, 185, 1),
                  minimumSize: const Size(double.infinity, 40)),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
