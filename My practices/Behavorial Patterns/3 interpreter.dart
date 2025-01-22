abstract class Parsed {
  String interpretStringFrom(List<String> roughString);
}

class SpanishToEnglish implements Parsed {
  List<String> spanishWords = ['Hola', 'Como', 'Estas', 'Bien', 'Gracias', 'Adios'];

  @override
  String interpretStringFrom(List<String> roughString) {
    String result = '';
    for (String word in roughString) {
      if (spanishWords.contains(word)) {
        result += word + ' ';
      }
    }
    return result;
  }
}

class UrduToEnglish implements Parsed {
  List<String> urduWords = ['سلام', 'کیسے', 'ہو', 'ٹھیک', 'شکریہ', 'خدا حافظ'];

  @override
  String interpretStringFrom(List<String> roughString) {
    String result = '';
    for (String word in roughString) {
      if (urduWords.contains(word)) {
        result += word + ' ';
      }
    }
    return result;
  }
}

void main() {
  List<String> roughString = ['Hola', 'Como', 'Estas', 'Bien', 'Gracias', 'Adios'];
  Parsed spanishToEnglish = SpanishToEnglish();
  print(spanishToEnglish.interpretStringFrom(roughString));

  List<String> roughString2 = ['سلام', 'کیسے', 'ہو', 'ٹھیک', 'شکریہ', 'خدا حافظ'];
  Parsed urduToEnglish = UrduToEnglish();
  print(urduToEnglish.interpretStringFrom(roughString2));
}
