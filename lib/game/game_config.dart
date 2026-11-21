import 'package:flutter/material.dart';

import 'package:studio_core/app/arcade_stage.dart';
import 'package:studio_core/app/game_api.dart';
import 'package:studio_core/core/game_rules.dart';
import 'shot_engine.dart';
import 'shot_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-088-pool-billiards',
  title: const ['Bilardo', 'Pool Billiards', 'Poolbillard', 'Billar Pool', 'Billard Américain'],
  tagline: const ['Açıyı hesapla, masayı temizle!', 'Find the angle, clear the table!', 'Winkel finden, Tisch leeren!', '¡Encuentra el ángulo!', 'Trouvez l\'angle !'],
  seedColor: const Color(0xFF2E7D32),
  icon: Icons.circle,
  rules: PoolRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => ShotSim((ctx.generated as GeneratedLevel<ShotLevel>).puzzle),
    paint: paintShot,
    sound: shotSound,
    boosterIcon: Icons.add_circle,
    boosterLabel: (l) => l == 'tr' ? '+2 atış' : '+2 shots',
    howTo: const ['Ekrana bas, geri çek ve bırak: çektiğin uzunluk gücü, ters yön atış yönünü belirler. Klavye: ok tuşları + boşluk.', 'Press, pull back and release: the length sets the power, the opposite direction is the shot. Keys: arrows + space.', 'Drücken, zurückziehen, loslassen.', 'Pulsa, tira hacia atrás y suelta.', 'Appuyez, tirez en arrière et relâchez.'],
  ),
  tutorial: const [
    TutorialStep(Icons.open_with, ['Istakayı geri çek ve bırak.', 'Pull the cue back and release.', 'Queue zurückziehen.', 'Tira del taco.', 'Tirez la queue.']),
    TutorialStep(Icons.adjust, ['Topun cebe bakan tarafının arkasına vur.', 'Hit the ball on the side away from the pocket.', 'Gegenüber der Tasche treffen.', 'Golpea el lado opuesto.', 'Frappez le côté opposé.']),
    TutorialStep(Icons.warning, ['Beyaz topu cebe sokma: faul!', 'Do not pot the cue ball: foul!', 'Weiße nicht versenken!', '¡No metas la blanca!', 'Ne rentrez pas la blanche !']),
  ],
);
