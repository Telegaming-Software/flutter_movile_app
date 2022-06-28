import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/models/material_training_model.dart';
import 'package:tg_softwareapp/pages/info_materia_page.dart';
import 'package:tg_softwareapp/utils/responsive.dart';

class OwnMaterial extends StatelessWidget {
  final TrainingMaterial trainingMaterial;
  const OwnMaterial({Key? key, required this.trainingMaterial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(5), vertical: responsive.hp(2)),
      height: responsive.dp(37),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: responsive.hp(18.5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(trainingMaterial.trainingCoverUri!),
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: responsive.dp(2)),
              child: AutoSizeText(
                trainingMaterial.title!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: responsive.dp(2), fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: responsive.dp(2)),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: responsive.dp(2.6),
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(trainingMaterial.nameCoach!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: responsive.dp(1.7))),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoMaterialPage(
                      trainingMaterial: trainingMaterial,
                    ),
                  ),
                );
              },
              child: AutoSizeText('Ver material',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: responsive.dp(1.7))),
              style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  minimumSize: Size(responsive.wp(70), responsive.hp(5))),
            ),
          ],
        ),
      ),
    );
  }
}
