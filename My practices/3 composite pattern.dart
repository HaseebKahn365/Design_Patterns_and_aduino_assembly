//My schedular using composite pattern. categories contain tasks and may contain categories

abstract class Activity {
  String name;
  Activity(this.name);

  void display(int depth);
}

class Task extends Activity {
  Task(String name) : super(name);

  void display(int depth) {
    print('${'  ' * depth}Task: $name');
  }
}

class Category extends Activity {
  List<Activity> activities = [];
  Category(String name) : super(name);

  void addActivity(Activity activity) {
    activities.add(activity);
  }

  void display(int depth) {
    print('${'  ' * depth}Category: $name');
    for (var activity in activities) {
      activity.display(depth + 1);
    }
  }
}

void main() {
  final task1 = Task('Task1');
  final task2 = Task('Task2');
  final task3 = Task('Task3');

  final category1 = Category('Category1');
  category1.addActivity(task1);
  category1.addActivity(task2);

  final category2 = Category('Category2');
  category2.addActivity(task3);

  final rootCategory = Category('Root');
  rootCategory.addActivity(category1);
  rootCategory.addActivity(category2);

  rootCategory.display(0);
}
