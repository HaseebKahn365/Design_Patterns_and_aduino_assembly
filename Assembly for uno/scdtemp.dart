// // 1. Alternative Classes with Different Interfaces
// class EmailSender {
//   void sendEmail(String to, String content) { /* ... */ }
// }

// class MessageDispatcher {
//   void dispatchMessage(String recipient, String body) { /* ... */ }
// }

// // 2. Comments (Bad)
// // This method calculates total price by adding tax
// // and then applies discount if customer is premium
// double calculatePrice(double price, bool isPremium) {
//   // Add 20% tax
//   double withTax = price * 1.2;
//   // Apply 10% discount for premium
//   if (isPremium) withTax *= 0.9;
//   return withTax;
// }

// // 3. Data Class
// class Customer {
//   String name;
//   String email;
//   String address;
  
//   Customer(this.name, this.email, this.address);
  
//   String getName() => name;
//   void setName(String name) => this.name = name;
//   String getEmail() => email;
//   void setEmail(String email) => this.email = email;
// }

// // 4. Data Clumps
// class Order {
//   String customerName;
//   String customerEmail;
//   String customerPhone;
//   String shippingStreet;
//   String shippingCity;
//   String shippingZip;
// }

// // 5. Divergent Change
// class UserManager {
//   void saveUser() { /* database logic */ }
//   void validateUser() { /* validation logic */ }
//   void sendUserEmail() { /* email logic */ }
//   void generateUserReport() { /* report logic */ }
// }

// // 6. Duplicated Code
// class Employee {
//   double calculateRegularPay() {
//     double result = hours * rate;
//     if (isOvertime) result *= 1.5;
//     return result;
//   }
  
//   double calculateBonusPay() {
//     double result = hours * rate;
//     if (isOvertime) result *= 1.5;
//     return result * 1.1;
//   }
// }

// // 7. Feature Envy
// class Phone {
//   String areaCode;
//   String number;
  
//   Phone(this.areaCode, this.number);
// }

// class Customer2 {
//   Phone phone;
  
//   String getFormattedPhone() {
//     return '(${phone.areaCode}) ${phone.number}';  // Envies Phone class
//   }
// }

// // 8. Inappropriate Intimacy
// class Person {
//   private List<Course> _courses;
  
//   void addCourse(Course course) => _courses.add(course);
// }

// class Student {
//   Person person;
//   void enrollInCourse(Course course) {
//     person._courses.add(course);  // Accessing private field
//   }
// }

// // 9. Incomplete Library Class
// class ExternalLibraryString {
//   String value;
//   // Missing method we need
// }

// class StringExtension {
//   static String toTitleCase(String str) {
//     // Adding missing functionality
//     return str.split(' ')
//         .map((word) => word[0].toUpperCase() + word.substring(1))
//         .join(' ');
//   }
// }

// // 10. Large Class
// class SuperWidget {
//   void renderUI() { /* ... */ }
//   void handleInput() { /* ... */ }
//   void processData() { /* ... */ }
//   void validateFields() { /* ... */ }
//   void saveToDatabase() { /* ... */ }
//   void generateReports() { /* ... */ }
//   // ... many more methods
// }

// // 11. Lazy Class
// class TooSimple {
//   String name;
//   String getName() => name;  // Doesn't justify its existence
// }

// // 12. Long Method
// void processOrder(Order order) {
//   validateOrder();
//   updateInventory();
//   calculateTotalPrice();
//   applyDiscounts();
//   calculateTaxes();
//   processPayment();
//   generateInvoice();
//   sendConfirmationEmail();
//   updateOrderHistory();
//   notifyWarehouse();
//   // ... many more steps
// }

// // 13. Long Parameter List
// void createUser(
//     String firstName, 
//     String lastName, 
//     String email, 
//     String phone, 
//     String address, 
//     String city, 
//     String country, 
//     String postalCode) {
//   // ...
// }

// // 14. Message Chains
// class Company {
//   Department getDepartment() => Department();
// }

// class Department {
//   Manager getManager() => Manager();
// }

// class Manager {
//   Employee getEmployee() => Employee();
// }

// // Usage:
// var employee = company.getDepartment().getManager().getEmployee();

// // 15. Middle Man
// class Person2 {
//   Department2 department;
  
//   String getDepartmentName() {
//     return department.getName();  // Just delegating
//   }
  
//   String getDepartmentCode() {
//     return department.getCode();  // Just delegating
//   }
// }

// // 16. Parallel Inheritance Hierarchies
// class Bird {
//   void fly() { /* ... */ }
// }

// class Eagle extends Bird {
//   void huntFromAir() { /* ... */ }
// }

// class BirdSound {
//   void makeSound() { /* ... */ }
// }

// class EagleSound extends BirdSound {
//   void makeEagleSound() { /* ... */ }
// }

// // 17. Primitive Obsession
// class User {
//   String phoneNumber;  // Should be PhoneNumber class
//   String emailAddress;  // Should be EmailAddress class
//   int status;  // Should be UserStatus enum/class
// }

// // 18. Refused Bequest
// class Bird2 {
//   void fly() { /* ... */ }
//   void layEggs() { /* ... */ }
// }

// class Penguin extends Bird2 {
//   @override
//   void fly() {
//     throw Exception('Penguins cannot fly!');  // Refuses inherited behavior
//   }
// }

// // 19. Shotgun Surgery
// class Order2 {
//   void calculateTotal() {
//     // Price calculation spread across multiple classes
//     var basePrice = getBasePrice();
//     var tax = getTax();
//     var shipping = getShipping();
//     // Changes to pricing logic require updates in many places
//   }
// }

// // 20. Speculative Generality
// abstract class AbstractGeneralProcessor {
//   void process();
//   void validate();
//   void normalize();
//   // ... many abstract methods for "future use"
// }

// // 21. Switch Statements
// double calculatePay(String employeeType) {
//   switch (employeeType) {
//     case 'engineer':
//       return calculateEngineerPay();
//     case 'manager':
//       return calculateManagerPay();
//     case 'sales':
//       return calculateSalesPay();
//     default:
//       throw Exception('Unknown employee type');
//   }
// }

// // 22. Temporary Field
// class Report {
//   String title;
//   int? tempCounter;  // Only used during report generation
//   List<String>? tempData;  // Only used during data processing
  
//   void generateReport() {
//     tempCounter = 0;
//     tempData = [];
//     // Use temporary fields
//     tempCounter = null;
//     tempData = null;
//   }
// }