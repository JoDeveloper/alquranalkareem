import 'package:alquranalkareem/audio_screen/controller/surah_audio_controller.dart';
import 'package:alquranalkareem/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theme_provider/theme_provider.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/services/controllers_put.dart';

class LastListen extends StatelessWidget {
  const LastListen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      child: Container(
        width: orientation(context, width * .75, 300.0),
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(.2),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        margin: orientation(
            context,
            const EdgeInsets.only(top: 75.0, right: 16.0),
            const EdgeInsets.only(bottom: 16.0, left: 32.0)),
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.lastListen,
                    style: TextStyle(
                      fontFamily: 'kufi',
                      fontSize: 14,
                      color: Theme.of(context).canvasColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(
                    endIndent: 8,
                    indent: 8,
                    height: 8,
                  ),
                  Icon(
                    Icons.record_voice_over_outlined,
                    color: Theme.of(context).canvasColor,
                    size: 22,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => SvgPicture.asset(
                    'assets/svg/surah_name/00${surahAudioController.sorahNum}.svg',
                    width: 100,
                    colorFilter: ColorFilter.mode(
                        ThemeProvider.themeOf(context).id == 'dark'
                            ? Theme.of(context).canvasColor
                            : Theme.of(context).primaryColorLight,
                        BlendMode.srcIn),
                  ),
                ),
                if (context.mounted)
                  GetX<SurahAudioController>(
                    builder: (surahAudioController) => Text(
                      '${surahAudioController.formatDuration(Duration(seconds: surahAudioController.lastPosition.value))}',
                      style: TextStyle(
                        fontFamily: 'kufi',
                        fontSize: 14,
                        color: ThemeProvider.themeOf(context).id == 'dark'
                            ? Theme.of(context).canvasColor
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        surahAudioController.controller
            .jumpTo((surahAudioController.sorahNum.value - 1) * 65.0);
        generalController.widgetPosition.value = 0.0;
        surahAudioController.lastAudioSource();
      },
    );
  }
}
