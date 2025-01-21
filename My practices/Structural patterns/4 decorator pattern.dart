//a customizable table cover using the decorator pattern
abstract class TableCover {
  String description = "Table Cover";

  String getDescription() {
    return description;
  }

  double cost();
}

class PlainTableCover extends TableCover {
  String get description => "plain" + super.description;
  @override
  double cost() {
    return 100.0;
  }
}

abstract class TableCoverDecorator extends TableCover {
  TableCover tableCover;
  TableCoverDecorator(this.tableCover);
}

//alluminum and glass table covers

class AlluminumTableCover extends TableCoverDecorator {
  AlluminumTableCover(TableCover tableCover) : super(tableCover);
  @override
  String get description => "Alluminum " + tableCover.description;
  @override
  double cost() {
    return 200.0 + tableCover.cost();
  }
}

class GlassTableCover extends TableCoverDecorator {
  GlassTableCover(TableCover tableCover) : super(tableCover);
  @override
  String get description => "Glass " + tableCover.description;
  @override
  double cost() {
    return 300.0 + tableCover.cost();
  }
}

void main() {
  TableCover tableCover = PlainTableCover();
  print("${tableCover.getDescription()} costs ${tableCover.cost()} PKR");

  tableCover = AlluminumTableCover(tableCover);
  print("${tableCover.getDescription()} costs ${tableCover.cost()} PKR");

  tableCover = GlassTableCover(tableCover);
  print("${tableCover.getDescription()} costs ${tableCover.cost()} PKR");
}
