import 'package:drawing_machine/utils/constants.dart';
import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/services.dart';

final List<AssetProvider> assetProviders = [
  AssetFlare(bundle: rootBundle, name: 'assets/border.flr'),
  AssetFlare(bundle: rootBundle, name: 'assets/nav_icons/lessons.flr'),
  AssetFlare(bundle: rootBundle, name: 'assets/nav_icons/chart.flr'),
  AssetFlare(bundle: rootBundle, name: 'assets/nav_icons/progress.flr'),
];

Future<void> warmupAnimations() async {
  for (final assetProvider in assetProviders) await cachedActor(assetProvider);
  List<AssetProvider> charAssetProviders = [];
  for (List charset in Constants().katakanaCharsets) {
    for (Map char in charset) {
      charAssetProviders.add(AssetFlare(
          bundle: rootBundle,
          name: 'assets/Flare/katakana/' + char['romaji'] + '.flr'));
    }
  }

  for (List charset in Constants().hiraganaCharsets) {
    for (Map char in charset) {
      charAssetProviders.add(AssetFlare(
          bundle: rootBundle,
          name: 'assets/Flare/hiragana/' + char['romaji'] + '.flr'));
    }
  }
}
