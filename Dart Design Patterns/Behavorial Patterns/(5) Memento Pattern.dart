// Memento: Stores the state of the editor
class EditorMemento {
  final String text;

  EditorMemento(this.text);
}

// Originator: The editor that creates and restores mementos
class TextEditor {
  String _text = "";

  // Adds text to the editor
  void type(String newText) {
    _text += newText;
  }

  // Saves the current state to a memento
  EditorMemento save() {
    return EditorMemento(_text);
  }

  // Restores the state from a memento
  void restore(EditorMemento memento) {
    _text = memento.text;
  }

  // Displays the current content
  void show() {
    print("Editor Content: $_text");
  }
}

// Caretaker: Manages the mementos
class History {
  final List<EditorMemento> _mementos = [];

  void save(EditorMemento memento) {
    _mementos.add(memento);
  }

  EditorMemento? undo() {
    if (_mementos.isNotEmpty) {
      return _mementos.removeLast();
    }
    return null;
  }
}

void main() {
  final editor = TextEditor();
  final history = History();

  // Type some text and save the state
  editor.type("Hello, ");
  history.save(editor.save());

  editor.type("world!");
  history.save(editor.save());

  editor.type(" This is a Memento Pattern example.");
  editor.show(); // Output: Editor Content: Hello, world! This is a Memento Pattern example.

  // Undo twice
  final firstUndo = history.undo();
  if (firstUndo != null) editor.restore(firstUndo);
  editor.show(); // Output: Editor Content: Hello, world!

  final secondUndo = history.undo();
  if (secondUndo != null) editor.restore(secondUndo);
  editor.show(); // Output: Editor Content: Hello,
}

/*
Explanation:
Memento (EditorMemento): Stores the state of the editor.
Originator (TextEditor): Creates and restores its state using mementos.
Caretaker (History): Manages the saving and restoring of mementos.
This example mimics a text editor's undo feature with saved states and rollbacks.
*/
