import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoMaterialPage extends StatelessWidget {
  final TrainingMaterial trainingMaterial;
  const InfoMaterialPage({Key? key, required this.trainingMaterial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        trainingMaterial.trainingCoverUri!,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    color: const Color.fromRGBO(20, 31, 106, 1),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: responsive.dp(3),
                              ),
                              SizedBox(
                                width: responsive.wp(2),
                              ),
                              AutoSizeText(
                                'Regresar',
                                minFontSize: 11,
                                style: TextStyle(
                                    fontSize: responsive.dp(3),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: responsive.dp(2.5),
                        )
                      ],
                    )),
              ),
            ],
          ),
          Positioned(
            top: responsive.dp(23),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: responsive.dp(3.5), vertical: responsive.dp(5)),
              width: responsive.wp(100),
              height: responsive.hp(62),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: responsive.dp(14),
                          height: responsive.dp(14),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                trainingMaterial.game!.coverUri!,
                              ),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        SizedBox(width: responsive.dp(3)),
                        Expanded(
                          child: AutoSizeText(
                            trainingMaterial.title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.nunito(
                              fontSize: responsive.dp(3.5),
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: responsive.dp(3.5)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: responsive.dp(3.6),
                          ),
                          const SizedBox(width: 10),
                          AutoSizeText(trainingMaterial.nameCoach!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: responsive.dp(2))),
                        ],
                      ),
                    ),
                    Text(
                      trainingMaterial.trainingDescription!,
                      style: TextStyle(
                          fontSize: responsive.dp(2),
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: responsive.dp(3),
                    ),
                    Row(
                      children: [
                        Icon(Icons.download,
                            size: responsive.dp(3.6), color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AutoSizeText(
                            'Descargar material de entrenamiento',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: responsive.dp(1.5),
                                color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
