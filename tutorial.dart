// import 'dart:fast_immutable_collections'
  
// Chapter 1 : Getting Started 
void chapter01(){

  // Variables
  const age = 27; 
  const twiceTheAge = age * 2;
  
  var name = 'Alex';
  name = 'Anthony';

  final name2 = 'Alex';
  final name3;
  name3 = 'Alex'; /* Still not changable after assigned */

  // Functions 
  String printMyFullName(String firstName, String lastName){
    return firstName + '' + lastName;
  }
  
  // Functions 
  String getFullName(String firstName, String lastName, int age) =>
  '$firstName  $lastName';
  
  // Call Function
  print(getFullName('Foo', 'Bar' ,13));
}

// Chapter 2 : Conditional Statements
void chapter02(){
  
  // Conditional
  final nameFoo = 'Foo';
  
  if(nameFoo == 'Foo'){
    print('Yes thisis Foo');
  }
  else if(nameFoo != 'Foe'){
    print('No This is not " sdfdsf " Foe');
  }
  else{
    print(' ???? I don\'t know');
  }

  (nameFoo == 'Foo') ? print('Yes thisis Foo') : print('No This is not Foo');

}

// Chapter 3 : Operators 
void chapter03(){

  var age = 32;
  final halfAge = age/2;
  final doubleAge = age*2;
  final ageMinusOne = --age;
  final agePlusOne = age++; 
  print('$halfAge $doubleAge $ageMinusOne $agePlusOne');

  final name = 'Foo Bar ';
  final nameTimes20 = name * 20;
  print(nameTimes20);
}

// Chapter 4 : Lists & Sets & Maps
void chapter04(){

  // Lists
  final name_list = ['Foo', 'Bar', 'Baz'];
  print(name_list[2]);
  print(name_list);

  name_list.add('Foo');
  print(name_list);
  
  final length = name_list.length;
  print(length);

  // Sets
  final name_set = {'Foo', 'Bar', 'Baz',};
  name_set.add('Foo');
  name_set.add('Bar');
  name_set.add('Baz2');
  print(name_set);
  print(name_set.length);

  const things = {'Foo', 1};
  print(things);
  //things.add('sdfsdf');

  // Maps
  var person = {
    'age' : 20,
    'name' : 'Foo'
  };

  person['name'] = 'XXXXXXXXXXXXX';
  person['_name'] = 'YYYYYYYYYY';
  print(person['name']);
  print(person);
     
}

// Chapter 5 : Null Safety
void chapter05(){
  
  // Introduction to Null-Safety
  String? name = null;
  print(name);
  name = 'Foo';
  print(name);

  int? age = 20;
  print(age);
  age = null;
  print(age);

  // Nullable String & Nullable List
  List<String?>? names = ['Foo', 'Bar', null];
  print(names);
  names = null;
  print(names);

  // Cherry picking non-null values
  const String? firstName = null;
  const String? middleName = 'Bar';   

  const firstNonNullValue = firstName ?? middleName;
  print(firstNonNullValue);

  const String? firstName1 = null;
  const String? middleName1 = null;   
  const String? lastName1 = 'Test'; 

  const firstNonNullValue1 = firstName1 ?? middleName1 ?? lastName1 ;
  print(firstNonNullValue1);

  // Null check & assign function
  void testNonNull(String? firstName1, String? middleName1, String? lastName1){
    final firstNonNullValue1 = firstName1 ?? middleName1 ?? lastName1 ;
    print(firstNonNullValue1);
  }

  testNonNull(null, null, 'XXXXXXXXxx');
  
  // Null aware assignment operator
  void testNonNull2(String? firstName, String? middleName, String? lastName){
    String? name = firstName;
    name ??= middleName;
    name ??= lastName;  
    print(name);
  }
  
  testNonNull2('Foo', 'Bar', 'Baz');
  testNonNull2(null, 'Bar', 'Baz');
  testNonNull2(null, null, 'Baz');
  
  // Conditional invocation
  void testNonNull3(List<String>? names){
    names?.add('Baz');
    print(names);
  }
  
  testNonNull3(['XXXX', 'YYYYY']);
  testNonNull3(null); 


  List<String>? name_list = ['Foo'];
  final numberOfNames = name_list.length;
  
  List<String>? name_list2 = null; 
  final length = names?.length ?? 0;
  print(length);

}

// Chapter 6 : Enumerations
enum PersonPropererties{
  firstname, lastName, age
}
enum AnimalType{
  cat, dog, bunny
}

void chapter06(){
  
  // Enumerations
  const name1 = 'foo';
  const otherName1 = 'foo';

  print(PersonPropererties.firstname);
  print(PersonPropererties.firstname.name);
  
  // Switch statements
  void testAnimal(AnimalType animalType){

    if(animalType != AnimalType.dog){
      print("I don't love dogs");
    }

    print(animalType.name);

    switch(animalType){
      case AnimalType.bunny:
        print("bunny");
        break;
      case AnimalType.dog:
        print("dog");
        break; 
      case AnimalType.cat:
        print("cat");
        break;             
      default:
        print("unknown");
        break;    
    }
  }
  
  testAnimal(AnimalType.cat);
}

// Chapter 7 : Classes
class Person {

  // Attributes
  final String name;
  final int  age;
  
  // Constructor
  Person(this.name, this.age);

  // Methods
  void printName(){
    print(name);
  }

  void run() => print("running");   
}

class LivingThing {
  void breathe() => print("breathe");
  void move() => print("move");
}

class Cat extends LivingThing{
}

abstract class LivingThing2 {
  void breathe() => print("breathe");
  void move() => print("move"); 
}

class Dog extends Object{ // every class extends from Object (implicit, do not have to write)
  
  final String name;

  // Class Constructor
  Dog(this.name);

  // Factory Constructor
  factory Dog.flufBall() => Dog('Fluf Ball 2');

  // Custom operators
  @override
  bool operator ==(covariant Dog other ) => other.name == name;
  
  @override
  int get hashCode => name.hashCode;
  
}

void chapter07(){
  
  // Introduction
  final foo = Person("Foo", 42);

  print(foo.name);
  print(foo.age); 
  foo.run();
  foo.printName();   

  // Inheritance (extends)
  final fluffers = Cat();
  fluffers.move();
  
  // Abstract Classes just used in another class cannot be instantiated.
  // final thing = LivingThing2(); 

  // Class Constructor
  final fluffBall = Dog('Fluf Ball');
  print(fluffBall.name);
  
  // Factory Constructor
  final fluffBall2 = Dog.flufBall();
  print(fluffBall2.name);  

  // Custom Operators
  final dog1 = Dog("Foo");
  final dog2 = Dog("Foo");

  (dog1 == dog2) ? 
    print("They are equal") : 
    print("They are not equal");
  
}


// Chapter 8 : Advance Dart 

// 1. Extensions
class ExtPerson {
  final String firstName;
  final String lastName;  
  ExtPerson(this.firstName, this.lastName);
}

extension Run on ExtPerson {
  void run() => print('$firstName is running');  
}

extension FullName on ExtPerson {
  // Getter
  String get fullName => '$firstName $lastName';
}

// 2. Future (async & event)
Future<int> heavyFutureThatMultipliesByTwo(int a){
  return Future.delayed(const Duration(seconds: 3), () { return a*2; });
}

Future<int> heavyFutureThatMultipliesByThree(int a){
  return Future.delayed(const Duration(seconds: 3), () => a*3 );
}

void futureTestAsync() async {
  final result = await heavyFutureThatMultipliesByThree(10);
  print(result);
}

// 3. Streams
Stream<String> getName(){
    return Stream.value('Stream Foo');
}

Stream<String> getNamePeriodic(){
    return Stream.periodic(const Duration(seconds: 1), (value) => 'Foo');
}

void streamTestAsync() async {
  await for (final value in getName()){
    print(value);
  }
  print('Stream finished working');
}

void streamTestPeriodic() async {
  await for (final value in getNamePeriodic()){
    print(value);
  }
  print('Stream finished working');
}

// 4. Geneators
Iterable<int> getSyncOneTwoThree() sync* { yield 1;  yield 2; yield 3;}

void iterateOnSync() {
  
  // Print 
  for(final value in getSyncOneTwoThree())
  {
    print(value);
  }
  
  // Print
  print(getSyncOneTwoThree());
}

Stream<Iterable<int>> getAsyncOneTwoThree() async* { yield [1];  yield [2]; yield [3];}

void iterateOnAsync() async{

  // Print 
  await for(final value in getAsyncOneTwoThree())
  {
    print(value);
  }
  
  // Print
  print(getAsyncOneTwoThree());
}


// 5. Generics

class PairOfString {
  final String value1;
  final String value2; 
  PairOfString(this.value1, this.value2);
}

class PairOfIntegers {
  final int value1;
  final int value2; 
  PairOfIntegers(this.value1, this.value2);
}

class Pair <A,B> {
  final A value1;
  final B value2; 
  Pair(this.value1, this.value2);
}

void testGenerics(){
  final pairOfString = Pair('foo', 'bar');
  final pairOfInt = Pair('foo', 'bar');  
  final pairOfMix = Pair(3, 2);  
  
  print(pairOfString);
  print(pairOfInt);
  print(pairOfMix);
}


void chapter08(){

  // 1. Extensions
  final foo = ExtPerson('Foo', 'Bar');
  foo.run();
  print(foo.fullName);

  // 2. Future
  futureTestAsync();

  // 3. Streams  
  streamTestAsync();
  streamTestPeriodic();
  
  // 4. Generators
  iterateOnSync();
  iterateOnAsync();
  
  // 5. Generics
  testGenerics();
}

void main(){
  
    chapter01();
    chapter02();
    chapter03();
    chapter04();
    chapter05();   
    chapter06();  
    chapter07();   
    chapter08();   
}