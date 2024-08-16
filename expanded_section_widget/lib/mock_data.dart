class MockData {
  static List<DemoSection> getData(
      [int sectionSize = 10, int itemSize = 5]) {
    var sections = List<DemoSection>.empty(growable: true);
    for (int i = 0; i < sectionSize; i++) {
      var section = DemoSection()
        ..sectionName = "Section-$i"
        ..items = List.generate(itemSize, (index) => "Row-$index");
      sections.add(section);
    }
    return sections;
  }
}

class DemoSection {
  //return item model list.
  late List<String> items;

  //example header
  late String sectionName;

  List<String> getItems() {
    return items;
  }
}
