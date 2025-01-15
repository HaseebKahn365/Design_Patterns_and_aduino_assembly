void main() {
  int a = 3324123;
  int b = 13;
  a ^= b;
  b ^= a;
  a ^= b;
  print(a);
  print(b);
}
