import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';

class MaterialInfoPage extends StatefulWidget {
  const MaterialInfoPage({Key? key}) : super(key: key);

  @override
  State<MaterialInfoPage> createState() => _MaterialInfoPageState();
}

class _MaterialInfoPageState extends State<MaterialInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerUser(),
      backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: const Text(
                  'Material',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width - 30,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            width: MediaQuery.of(context).size.width / 2.9,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://c.tenor.com/S_Bm_Ect9uMAAAAC/chika-delicious.gif'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 5.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Coach:',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: AutoSizeText(
                                          'Symphony of the Seas',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Material:',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: AutoSizeText(
                                          'Guia de farmeo y TeamFight',
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Fecha:',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: AutoSizeText(
                                          '09/11/2020',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
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
                      const SizedBox(
                        width: double.infinity,
                        child: AutoSizeText(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras efficitur urna et urna convallis, vel pellentesque dolor ornare. Nunc eu feugiat odio. Praesent tincidunt lobortis quam. Nunc ac malesuada odio. Aenean viverra leo vitae purus sollicitudin elementum. Proin convallis venenatis lectus, et porttitor felis faucibus non. Nunc id condimentum turpis, eu scelerisque tortor. Cras in fermentum arcu, quis condimentum felis. Sed bibendum, neque non mollis placerat, nisi diam mollis libero, sit amet fringilla justo est ac purus. Pellentesque pharetra maximus turpis, et fermentum sem consectetur eget. Nullam non elementum sapien, vel condimentum lacus. Nulla consequat euismod felis.Suspendisse blandit, nulla tempor gravida dignissim, turpis quam laoreet ante, nec tristique odio arcu ut enim. Sed eu dignissim libero. Fusce sit amet convallis nibh. Praesent dictum eget erat vitae pellentesque. Donec convallis bibendum leo, at eleifend augue maximus vel. Suspendisse fermentum turpis sodales tortor laoreet, id venenatis libero rutrum. Nunc non semper est, maximus varius elit. Suspendisse efficitur ex quam, eget volutpat ex condimentum ac. Donec blandit orci volutpat sapien molestie, vel mattis diam rutrum.Proin id arcu tristique, aliquet lorem at, consequat neque. Vestibulum maximus, leo quis lobortis dictum, ex orci dignissim lorem, ut rutrum orci metus cursus lectus. Aenean ut.',
                          style: TextStyle(fontSize: 17),
                          maxLines: 30,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Archivos:',
                          style: TextStyle(fontSize: 16),
                        ),
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
                            minimumSize: Size(
                                MediaQuery.of(context).size.width / 1.5, 35)),
                        onPressed: () => Navigator.pop(context),
                        child: Text('Regresar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
