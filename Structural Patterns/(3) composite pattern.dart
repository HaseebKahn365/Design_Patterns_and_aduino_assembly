// Component
abstract class FileSystemItem {
  String name;

  FileSystemItem(this.name);

  void display(int depth);
}

// Leaf (File)
class File extends FileSystemItem {
  File(String name) : super(name);

  @override
  void display(int depth) {
    print('${'  ' * depth}File: $name');
  }
}

// Composite (Folder)
class Folder extends FileSystemItem {
  final List<FileSystemItem> items = [];

  Folder(String name) : super(name);

  void addItem(FileSystemItem item) {
    items.add(item);
  }

  @override
  void display(int depth) {
    print('${'  ' * depth}Folder: $name');
    for (var item in items) {
      item.display(depth + 1); //recursive for inner items
    }
  }
}

// Client
void main() {
  final file1 = File('File1.txt');
  final file2 = File('File2.txt');
  final file3 = File('File3.txt');

  final folder1 = Folder('Folder1');
  folder1.addItem(file1);
  folder1.addItem(file2);

  final folder2 = Folder('Folder2');
  folder2.addItem(file3);

  final rootFolder = Folder('Root');
  rootFolder.addItem(folder1);
  rootFolder.addItem(folder2);

  rootFolder.display(0);

  // Output:
  // Folder: Root
  //   Folder: Folder1
  //     File: File1.txt
  //     File: File2.txt
  //   Folder: Folder2
  //     File: File3.txt
}


/*
Explanation:
Component (FileSystemItem): Common interface for files and folders.
Leaf (File): A simple, indivisible item.
Composite (Folder): A complex item that can contain other files or folders.
Client: Can treat both files and folders uniformly using the display method.
This pattern is perfect for representing hierarchical structures like file systems, organizational charts, or menus.

 */

