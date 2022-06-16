import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

class AddMaterialPage extends StatefulWidget {
  const AddMaterialPage({Key? key}) : super(key: key);

  @override
  State<AddMaterialPage> createState() => _AddMaterialPageState();
}

class _AddMaterialPageState extends State<AddMaterialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerUser(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: const Text(
              'Añade tus Materiales',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width - 30,
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            width: MediaQuery.of(context).size.width / 2.9,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://c.tenor.com/S_Bm_Ect9uMAAAAC/chika-delicious.gif'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 4,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.blue,
                                  child: const IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Coach',
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'TÍtulo',
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Fecha',
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Descripción:',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      child: Container(
                        width: 350,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.white)),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Descripción del material',
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 17),
                          maxLines: 30,
                        ),
                      )),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Archivos:',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: const AutoSizeText(
                          'Guia de farmeo y TeamFightss.mp4',
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.file_download),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: const AutoSizeText(
                          'Guia de farmeo y TeamFightss.mp4',
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.file_download),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(20, 31, 106, 1),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 1.5, 35)),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Regresar'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildEditIcon(Color color) => Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      );
}
