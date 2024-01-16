import 'package:flutter/material.dart';

class WriteProvder with ChangeNotifier {
  String _selectedEmotion = "감동한";
  final List<String> _emotionList = [
    '감동한',
    '감사한',
    '기쁜',
    '든든한',
    '만족스러운',
    '반가운',
    '사랑스러운',
    '설레는',
    '신나는',
    '자랑스러운',
    '자신있는',
    '재미있는',
    '편안한',
    '행복한',
    '홀가분한',
    '활기찬',
    '걱정되는',
    '긴장된',
    '놀란',
    '당황한',
    '두려운',
    '무서운',
    '불안한',
    '혼란스러운',
    '답답한',
    '미운',
    '분한',
    '억울한',
    '원망스러운',
    '지긋지긋한',
    '짜증난',
    '곤란한',
    '귀찮은',
    '부끄러운',
    '부담스러운',
    '부러운',
    '불편한',
    '어색한',
    '지루한',
    '피곤한',
    '황당한',
    '괴로운',
    '그리운',
    '막막한',
    '미안한',
    '서러운',
    '서운한',
    '속상한',
    '슬픈',
    '실망한',
    '안타까운',
    '외로운',
    '우울한',
    '허전한',
    '후회되는'
  ];

  List<String> get emotionList => _emotionList;
  String get selectedEmotion => _selectedEmotion;

  void updateSelectedEmotion(String emotion) {
    _selectedEmotion = emotion;
    notifyListeners();
  }
}
