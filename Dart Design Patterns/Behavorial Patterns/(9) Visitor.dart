// Elements
abstract class DocumentElement {
  void accept(DocumentVisitor visitor);
}

class TextElement implements DocumentElement {
  final String text;
  TextElement(this.text);

  @override
  void accept(DocumentVisitor visitor) {
    visitor.visitText(this);
  }
}

class ImageElement implements DocumentElement {
  final String url;
  ImageElement(this.url);

  @override
  void accept(DocumentVisitor visitor) {
    visitor.visitImage(this);
  }
}

// Visitor
abstract class DocumentVisitor {
  void visitText(TextElement text);
  void visitImage(ImageElement image);
}

// Concrete Visitors
class PrintVisitor implements DocumentVisitor {
  @override
  void visitText(TextElement text) {
    print('Printing text: ${text.text}');
  }

  @override
  void visitImage(ImageElement image) {
    print('Printing image from: ${image.url}');
  }
}

class ExportVisitor implements DocumentVisitor {
  @override
  void visitText(TextElement text) {
    print('Exporting text as PDF: ${text.text}');
  }

  @override
  void visitImage(ImageElement image) {
    print('Exporting image as PNG: ${image.url}');
  }
}

void main() {
  var document = [TextElement('Hello World'), ImageElement('photo.jpg')];

  var printer = PrintVisitor();
  var exporter = ExportVisitor();

  // Print all elements
  print('Printing document:');
  for (var element in document) {
    element.accept(printer);
  }

  // Export all elements
  print('\nExporting document:');
  for (var element in document) {
    element.accept(exporter);
  }
}
