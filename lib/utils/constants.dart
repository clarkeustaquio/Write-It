//constants used in the app

import 'dart:ui';

class Constants {
  static double canvasSize = 350;
  static double drawingBorderStart = 6;
  static double drawingBorderEndx = 315;
  static double drawingBorderEndy = 335;
  static double borderSize = 2;

  static double imageSize = 300;

  static double strokeWidth = 10.0;

  //colors
  static final Color whitesmoke = const Color(0xffeff0f5);

  final List swiperImages = [
    'assets/swiper/hiragana.jpg',
    'assets/swiper/katakana.jpg',
  ];

  // Duration - star checker
  final Duration star_3 = Duration(minutes: 1);
  final Duration star_2 = Duration(minutes: 1, seconds: 30);

  final List<String> hiraganas = [
    'Hiragana 1',
    'Hiragana 2',
    'Hiragana 3',
    'Hiragana 4',
    'Hiragana 5',
    'Hiragana 6',
    'Hiragana 7',
    'Hiragana 8',
    'Hiragana 9',
    'Hiragana 10',
    'Hiragana 11',
    'Hiragana 12',
    'Hiragana 13',
    'Hiragana 14',
    'Hiragana 15',
  ];

  final List<String> katakanas = [
    'Katakana 1',
    'Katakana 2',
    'Katakana 3',
    'Katakana 4',
    'Katakana 5',
    'Katakana 6',
    'Katakana 7',
    'Katakana 8',
    'Katakana 9',
    'Katakana 10',
    'Katakana 11',
    'Katakana 12',
    'Katakana 13',
    'Katakana 14',
  ];

  final List hiraganaCharsets = const [
    [
      //Row 1
      {'label': 'あ', 'romaji': 'a', 'strokes': 3},
      {'label': 'い', 'romaji': 'i', 'strokes': 2},
      {'label': 'う', 'romaji': 'u', 'strokes': 2},
    ],
    [
      {'label': 'え', 'romaji': 'e', 'strokes': 2},
      {'label': 'お', 'romaji': 'o', 'strokes': 3},
      {'label': 'か', 'romaji': 'ka', 'strokes': 3},
    ],
    [
      //Row 2
      {'label': 'が', 'romaji': 'ga', 'strokes': 5},
      {'label': 'き', 'romaji': 'ki', 'strokes': 4},
      {'label': 'ぎ', 'romaji': 'gi', 'strokes': 6},
      {'label': 'く', 'romaji': 'ku', 'strokes': 1},
    ],
    [
      {'label': 'ぐ', 'romaji': 'gu', 'strokes': 3},
      {'label': 'け', 'romaji': 'ke', 'strokes': 3},
      {'label': 'げ', 'romaji': 'ge', 'strokes': 5},
      {'label': 'こ', 'romaji': 'ko', 'strokes': 2},
      {'label': 'ご', 'romaji': 'go', 'strokes': 4},
    ],
    [
      //Row 3
      {'label': 'さ', 'romaji': 'sa', 'strokes': 3},
      {'label': 'ざ', 'romaji': 'za', 'strokes': 5},
      {'label': 'し', 'romaji': 'shi', 'strokes': 1},
      {'label': 'じ', 'romaji': 'ji', 'strokes': 3},
      {'label': 'す', 'romaji': 'su', 'strokes': 2},
    ],
    [
      {'label': 'ず', 'romaji': 'zu', 'strokes': 4},
      {'label': 'せ', 'romaji': 'se', 'strokes': 3},
      {'label': 'ぜ', 'romaji': 'ze', 'strokes': 5},
      {'label': 'そ', 'romaji': 'so', 'strokes': 1},
      {'label': 'ぞ', 'romaji': 'zo', 'strokes': 3},
    ],
    [
      //Row 4
      {'label': 'た', 'romaji': 'ta', 'strokes': 4},
      {'label': 'だ', 'romaji': 'da', 'strokes': 6},
      {'label': 'ち', 'romaji': 'chi', 'strokes': 2},
      {'label': 'つ', 'romaji': 'tsu', 'strokes': 1},
      {'label': 'て', 'romaji': 'te', 'strokes': 1},
    ],
    [
      //Row 5
      {'label': 'で', 'romaji': 'de', 'strokes': 3},
      {'label': 'と', 'romaji': 'to', 'strokes': 2},
      {'label': 'ど', 'romaji': 'do', 'strokes': 4},
      {'label': 'な', 'romaji': 'na', 'strokes': 4},
      {'label': 'に', 'romaji': 'ni', 'strokes': 3},
    ],
    [
      {'label': 'ぬ', 'romaji': 'nu', 'strokes': 2},
      {'label': 'ね', 'romaji': 'ne', 'strokes': 2},
      {'label': 'の', 'romaji': 'no', 'strokes': 1},
      {'label': 'は', 'romaji': 'ha', 'strokes': 3},
    ],
    [
      //Row 6
      {'label': 'ば', 'romaji': 'ba', 'strokes': 5},
      {'label': 'ひ', 'romaji': 'hi', 'strokes': 1},
      {'label': 'び', 'romaji': 'bi', 'strokes': 3},
      {'label': 'ぴ', 'romaji': 'pi', 'strokes': 2},
    ],
    [
      {'label': 'ふ', 'romaji': 'fu', 'strokes': 4},
      {'label': 'ぶ', 'romaji': 'bu', 'strokes': 6},
      {'label': 'ぷ', 'romaji': 'pu', 'strokes': 5},
      {'label': 'へ', 'romaji': 'he', 'strokes': 1},
      {'label': 'ベ', 'romaji': 'be', 'strokes': 3},
    ],
    [
      //Row 7
      {'label': 'ペ', 'romaji': 'pe', 'strokes': 2},
      {'label': 'ほ', 'romaji': 'ho', 'strokes': 4},
      {'label': 'ぼ', 'romaji': 'bo', 'strokes': 6},
      {'label': 'ぽ', 'romaji': 'po', 'strokes': 5},
      {'label': 'ま', 'romaji': 'ma', 'strokes': 3},
    ],
    [
      {'label': 'み', 'romaji': 'mi', 'strokes': 2},
      {'label': 'む', 'romaji': 'mu', 'strokes': 3},
      {'label': 'め', 'romaji': 'me', 'strokes': 2},
      {'label': 'も', 'romaji': 'mo', 'strokes': 3},
      {'label': 'や', 'romaji': 'ya', 'strokes': 3},
    ],
    [
      //Row 8
      {'label': 'ゆ', 'romaji': 'yu', 'strokes': 2},
      {'label': 'よ', 'romaji': 'yo', 'strokes': 2},
      {'label': 'ら', 'romaji': 'ra', 'strokes': 2},
      {'label': 'り', 'romaji': 'ri', 'strokes': 1},
      {'label': 'る', 'romaji': 'ru', 'strokes': 1},
    ],
    [
      //Row 8
      {'label': 'れ', 'romaji': 're', 'strokes': 2},
      {'label': 'ろ', 'romaji': 'ro', 'strokes': 1},
      {'label': 'わ', 'romaji': 'wa', 'strokes': 2},
      {'label': 'を', 'romaji': 'wo', 'strokes': 3},
      {'label': 'ん', 'romaji': 'n', 'strokes': 1},
    ],
  ];

  final List katakanaCharsets = const [
    [
      //Row 1
      {'label': 'ア', 'romaji': 'a', 'strokes': 2},
      {'label': 'イ', 'romaji': 'i', 'strokes': 2},
      {'label': 'ウ', 'romaji': 'u', 'strokes': 3},
      {'label': 'エ', 'romaji': 'e', 'strokes': 3},
      {'label': 'オ', 'romaji': 'o', 'strokes': 3},
    ],
    [
      //Row 2
      {'label': 'カ', 'romaji': 'ka', 'strokes': 2},
      {'label': 'が', 'romaji': 'ga', 'strokes': 4},
      {'label': 'キ', 'romaji': 'ki', 'strokes': 3},
      {'label': 'ギ', 'romaji': 'gi', 'strokes': 5},
      {'label': 'ク', 'romaji': 'ku', 'strokes': 2},
    ],
    [
      {'label': 'グ', 'romaji': 'gu', 'strokes': 4},
      {'label': 'ケ', 'romaji': 'ke', 'strokes': 3},
      {'label': 'ゲ', 'romaji': 'ge', 'strokes': 5},
      {'label': 'コ', 'romaji': 'ko', 'strokes': 2},
      {'label': 'ゴ', 'romaji': 'go', 'strokes': 4},
    ],
    [
      //Row 3
      {'label': 'サ', 'romaji': 'sa', 'strokes': 3},
      {'label': 'ザ', 'romaji': 'za', 'strokes': 5},
      {'label': 'シ', 'romaji': 'shi', 'strokes': 3},
      {'label': 'ジ', 'romaji': 'ji', 'strokes': 5},
      {'label': 'ス', 'romaji': 'su', 'strokes': 2},
    ],
    [
      {'label': 'ズ', 'romaji': 'zu', 'strokes': 4},
      {'label': 'セ', 'romaji': 'se', 'strokes': 2},
      {'label': 'ゼ', 'romaji': 'ze', 'strokes': 4},
      {'label': 'ソ', 'romaji': 'so', 'strokes': 2},
      {'label': 'ゾ', 'romaji': 'zo', 'strokes': 4},
    ],
    [
      //Row 4
      {'label': 'タ', 'romaji': 'ta', 'strokes': 3},
      {'label': 'ダ', 'romaji': 'da', 'strokes': 5},
      {'label': 'チ', 'romaji': 'chi', 'strokes': 3},
      {'label': 'ヂ', 'romaji': 'ji ', 'strokes': 5},
      {'label': 'ツ', 'romaji': 'tsu', 'strokes': 3},
    ],
    [
      //Row 5
      {'label': 'ヅ', 'romaji': 'zu ', 'strokes': 5},
      {'label': 'テ', 'romaji': 'te', 'strokes': 3},
      {'label': 'デ', 'romaji': 'de', 'strokes': 5},
      {'label': 'ト', 'romaji': 'to', 'strokes': 2},
      {'label': 'ド', 'romaji': 'do', 'strokes': 4},
    ],
    [
      {'label': 'ナ', 'romaji': 'na', 'strokes': 2},
      {'label': 'ニ', 'romaji': 'ni', 'strokes': 2},
      {'label': 'ヌ', 'romaji': 'nu', 'strokes': 2},
      {'label': 'ネ', 'romaji': 'ne', 'strokes': 4},
      {'label': 'ノ', 'romaji': 'no', 'strokes': 1},
    ],
    [
      //Row 6
      {'label': 'ハ', 'romaji': 'ha', 'strokes': 2},
      {'label': 'バ', 'romaji': 'ba', 'strokes': 4},
      {'label': 'パ', 'romaji': 'pa', 'strokes': 3},
      {'label': 'ヒ', 'romaji': 'hi', 'strokes': 2},
      {'label': 'ビ', 'romaji': 'bi', 'strokes': 4},
    ],
    [
      {'label': 'ピ', 'romaji': 'pi', 'strokes': 3},
      {'label': 'フ', 'romaji': 'fu', 'strokes': 1},
      {'label': 'ブ', 'romaji': 'bu', 'strokes': 3},
      {'label': 'プ', 'romaji': 'pu', 'strokes': 2},
      {'label': 'ヘ', 'romaji': 'he', 'strokes': 1},
    ],
    [
      {'label': 'ベ', 'romaji': 'be', 'strokes': 3},
      {'label': 'ペ', 'romaji': 'pe', 'strokes': 2},
      {'label': 'ホ', 'romaji': 'ho', 'strokes': 4},
      {'label': 'ボ', 'romaji': 'bo', 'strokes': 6},
      {'label': 'ポ', 'romaji': 'po', 'strokes': 5},
    ],
    [
      //Row 7
      {'label': 'マ', 'romaji': 'ma', 'strokes': 2},
      {'label': 'ミ', 'romaji': 'mi', 'strokes': 3},
      {'label': 'ム', 'romaji': 'mu', 'strokes': 2},
      {'label': 'メ', 'romaji': 'me', 'strokes': 2},
      {'label': 'モ', 'romaji': 'mo', 'strokes': 3},
    ],
    [
      //Row 8
      {'label': 'ヤ', 'romaji': 'ya', 'strokes': 2},
      {'label': 'ユ', 'romaji': 'yu', 'strokes': 2},
      {'label': 'ヨ', 'romaji': 'yo', 'strokes': 3},
      {'label': 'ラ', 'romaji': 'ra', 'strokes': 2},
      {'label': 'リ', 'romaji': 'ri', 'strokes': 2},
    ],
    [
      {'label': 'ル', 'romaji': 'ru', 'strokes': 2},
      {'label': 'レ', 'romaji': 're', 'strokes': 1},
      {'label': 'ロ', 'romaji': 'ro', 'strokes': 3},
      {'label': 'ワ', 'romaji': 'wa', 'strokes': 2},
      {'label': 'ン', 'romaji': 'n', 'strokes': 2},
    ],
  ];

  final List hiraganaChart = const [
    [
      //Row 1
      {
        'symbol': 'あ',
        'character': 'a',
      },
      {
        'symbol': 'い',
        'character': 'i',
      },
      {
        'symbol': 'う',
        'character': 'u',
      },
      {
        'symbol': 'え',
        'character': 'e',
      },
      {
        'symbol': 'お',
        'character': 'o',
      },
    ],
    [
      //Row 2
      {
        'symbol': 'か',
        'character': 'ka',
      },
      {
        'symbol': 'き',
        'character': 'ki',
      },
      {
        'symbol': 'く',
        'character': 'ku',
      },
      {
        'symbol': 'け',
        'character': 'ke',
      },
      {
        'symbol': 'こ',
        'character': 'ko',
      },
    ],
    [
      //Row 3
      {
        'symbol': 'さ',
        'character': 'sa',
      },
      {
        'symbol': 'し',
        'character': 'shi',
      },
      {
        'symbol': 'す',
        'character': 'su',
      },
      {
        'symbol': 'せ',
        'character': 'se',
      },
      {
        'symbol': 'そ',
        'character': 'so',
      },
    ],
    [
      //Row 4
      {
        'symbol': 'た',
        'character': 'ta',
      },
      {
        'symbol': 'ち',
        'character': 'chi',
      },
      {
        'symbol': 'つ',
        'character': 'tsu',
      },
      {
        'symbol': 'て',
        'character': 'te',
      },
      {
        'symbol': 'と',
        'character': 'to',
      },
    ],
    [
      //Row 5
      {
        'symbol': 'な',
        'character': 'na',
      },
      {
        'symbol': 'に',
        'character': 'ni',
      },
      {
        'symbol': 'ぬ',
        'character': 'nu',
      },
      {
        'symbol': 'ね',
        'character': 'ne',
      },
      {
        'symbol': 'の',
        'character': 'no',
      },
    ],
    [
      //Row 6
      {
        'symbol': 'は',
        'character': 'ha',
      },
      {
        'symbol': 'ひ',
        'character': 'hi',
      },
      {
        'symbol': 'ふ',
        'character': 'fu',
      },
      {
        'symbol': 'へ',
        'character': 'he',
      },
      {
        'symbol': 'ほ',
        'character': 'ho',
      },
    ],
    [
      //Row 7
      {
        'symbol': 'ま',
        'character': 'ma',
      },
      {
        'symbol': 'み',
        'character': 'mi',
      },
      {
        'symbol': 'む',
        'character': 'mu',
      },
      {
        'symbol': 'め',
        'character': 'me',
      },
      {
        'symbol': 'も',
        'character': 'mo',
      },
    ],
    [
      //Row 8
      {
        'symbol': 'ら',
        'character': 'ra',
      },
      {
        'symbol': 'り',
        'character': 'ri',
      },
      {
        'symbol': 'る',
        'character': 'ru',
      },
      {
        'symbol': 'れ',
        'character': 're',
      },
      {
        'symbol': 'ろ',
        'character': 'ro',
      },
    ],
    [
      //Row 8
      {
        'symbol': 'や',
        'character': 'ya',
      },
      {
        'symbol': 'ゆ',
        'character': 'yu',
      },
      {
        'symbol': 'よ',
        'character': 'yo',
      },
      {
        'symbol': 'わ',
        'character': 'wa',
      },
      {
        'symbol': 'ん',
        'character': 'n',
      },
    ],
  ];

  final List katakanaChart = const [
    [
      //Row 1
      {
        'symbol': 'ア',
        'character': 'a',
      },
      {
        'symbol': 'イ',
        'character': 'i',
      },
      {
        'symbol': 'ウ',
        'character': 'u',
      },
      {
        'symbol': 'エ',
        'character': 'e',
      },
      {
        'symbol': 'オ',
        'character': 'o',
      },
    ],
    [
      //Row 2
      {
        'symbol': 'カ',
        'character': 'ka',
      },
      {
        'symbol': 'キ',
        'character': 'ki',
      },
      {
        'symbol': 'ク',
        'character': 'ku',
      },
      {
        'symbol': 'ケ',
        'character': 'ke',
      },
      {
        'symbol': 'コ',
        'character': 'ko',
      },
    ],
    [
      //Row 3
      {
        'symbol': 'サ',
        'character': 'sa',
      },
      {
        'symbol': 'シ',
        'character': 'shi',
      },
      {
        'symbol': 'ス',
        'character': 'su',
      },
      {
        'symbol': 'セ',
        'character': 'se',
      },
      {
        'symbol': 'ソ',
        'character': 'so',
      },
    ],
    [
      //Row 4
      {
        'symbol': 'タ',
        'character': 'ta',
      },
      {
        'symbol': 'チ',
        'character': 'chi',
      },
      {
        'symbol': 'ツ',
        'character': 'tsu',
      },
      {
        'symbol': 'テ',
        'character': 'te',
      },
      {
        'symbol': 'ト',
        'character': 'to',
      },
    ],
    [
      //Row 5
      {
        'symbol': 'ナ',
        'character': 'na',
      },
      {
        'symbol': 'ニ',
        'character': 'ni',
      },
      {
        'symbol': 'ヌ',
        'character': 'nu',
      },
      {
        'symbol': 'ネ',
        'character': 'ne',
      },
      {
        'symbol': 'ノ',
        'character': 'no',
      },
    ],
    [
      //Row 6
      {
        'symbol': 'ハ',
        'character': 'ha',
      },
      {
        'symbol': 'ヒ',
        'character': 'hi',
      },
      {
        'symbol': 'フ',
        'character': 'fu',
      },
      {
        'symbol': 'ヘ',
        'character': 'he',
      },
      {
        'symbol': 'ホ',
        'character': 'ho',
      },
    ],
    [
      //Row 7
      {
        'symbol': 'マ',
        'character': 'ma',
      },
      {
        'symbol': 'ミ',
        'character': 'mi',
      },
      {
        'symbol': 'ム',
        'character': 'mu',
      },
      {
        'symbol': 'メ',
        'character': 'me',
      },
      {
        'symbol': 'モ',
        'character': 'mo',
      },
    ],
    [
      //Row 8
      {
        'symbol': 'ラ',
        'character': 'ra',
      },
      {
        'symbol': 'リ',
        'character': 'ri',
      },
      {
        'symbol': 'ル',
        'character': 'ru',
      },
      {
        'symbol': 'レ',
        'character': 're',
      },
      {
        'symbol': 'ロ',
        'character': 'ro',
      },
    ],
    [
      //Row 8
      {
        'symbol': 'ヤ',
        'character': 'ya',
      },
      {
        'symbol': 'ユ',
        'character': 'yu',
      },
      {
        'symbol': 'ヨ',
        'character': 'yo',
      },
      {
        'symbol': 'ワ',
        'character': 'wa',
      },
      {
        'symbol': 'ン',
        'character': 'n',
      },
    ],
  ];
}
