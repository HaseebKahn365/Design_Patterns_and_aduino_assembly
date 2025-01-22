//visitor pattern for going through different files, reading them and then deleting them

abstract class DocumentElement {
  void accept(DocumentVisitor visitor);
}

class ExeFile implements DocumentElement {
  final String name;
  ExeFile(this.name);

  @override
  void accept(DocumentVisitor visitor) {
    visitor.visitExe(this);
  }
}

class PdfFile implements DocumentElement {
  final String name;
  PdfFile(this.name);

  @override
  void accept(DocumentVisitor visitor) {
    visitor.visitPdf(this);
  }
}

// Visitor
abstract class DocumentVisitor {
  void visitExe(ExeFile exe);
  void visitPdf(PdfFile pdf);
}

// Concrete Visitors
class ReadVisitor implements DocumentVisitor {
  @override
  void visitExe(ExeFile exe) {
    print('Reading exe file: ${exe.name}');
  }

  @override
  void visitPdf(PdfFile pdf) {
    print('Reading pdf file: ${pdf.name}');
  }
}

class DeleteVisitor implements DocumentVisitor {
  @override
  void visitExe(ExeFile exe) {
    print('Deleting exe file: ${exe.name}');
  }

  @override
  void visitPdf(PdfFile pdf) {
    print('Deleting pdf file: ${pdf.name}');
  }
}

void main() {
  var document = [ExeFile('file1.exe'), PdfFile('file2.pdf')];

  var readVisitor = ReadVisitor();
  var deleteVisitor = DeleteVisitor();

  for (var file in document) {
    file.accept(readVisitor);
  }

  for (var file in document) {
    file.accept(deleteVisitor);
  }
}
