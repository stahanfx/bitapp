// ignore_for_file: unnecessary_string_interpolations

class TextCleaner {
  String baseText;
  String repText;
  String newText;
  TextCleaner({
    required this.baseText,
    required this.repText,
    required this.newText,
  });

  base() {
    String cleanText = baseText.replaceAll('$repText', '$newText');
    return cleanText;
  }
}
