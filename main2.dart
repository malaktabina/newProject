import 'dart:io';

class Event {
  String name;
  String description;
  String place;
  String time;
  int availableTickets;

  Event(this.name, this.description, this.place, this.time,
      this.availableTickets);

  bool hasAvailableTickets() {
    return availableTickets > 0;
  }
}

abstract class User {
  String name;
  int serialNumber;
  String type;
  User(this.name, this.serialNumber, this.type);

  void information();
}

class Admin extends User {
  Admin(String name, int serialNumber, String type)
      : super(name, serialNumber, type);

  Event createEvent() {
    print("Enter event name: ");
    String? eventName = stdin.readLineSync();

    print("Enter event description: ");
    String? eventDescription = stdin.readLineSync();

    print("Enter event place: ");
    String? eventPlace = stdin.readLineSync();

    print("Enter event time: ");
    String? eventTime = stdin.readLineSync();

    print("Enter event available tickets: ");
    int eventAvailableTickets = int.parse(stdin.readLineSync()!);
    if (eventAvailableTickets > 0) {
      print("Available tickets: ${eventAvailableTickets}  ");
    } else {
      print("Error: Number of tickets must be positive.");
    }

    return Event(
        eventName ?? 'Unknown',
        eventDescription ?? 'No description',
        eventPlace ?? 'Unknown place',
        eventTime ?? 'Unknown time',
        eventAvailableTickets);
  }

  @override
  void information() {
    print("Admin: ${name}, Serial Number: ${serialNumber}, Type: ${type}");
  }
}

class Employee extends User {
  Employee(String name, int serialNumber, String type)
      : super(name, serialNumber, type);

  @override
  void information() {
    print("Employee: ${name}, Serial Number: ${serialNumber}, Type: ${type}");
  }
}

class Client extends User {
  Client(String name, int serialNumber, String type)
      : super(name, serialNumber, type);

  @override
  void information() {
    print("Client: ${name}, Serial Number: ${serialNumber}, Type: ${type}");
  }
}

void reserve(Event event) {
  if (event.availableTickets > 0) {
    event.availableTickets -= 1;
    print("Ticket reserve");
  } else {
    print("No tickets available");
  }
}

void main() {
  Admin admin = Admin("Rowaida", 123, "Admin");
  Employee emplopyee = Employee("Malak", 456, "employee");
  Client client = Client("Mahmoud", 789, "Client");

  print("Who Are You ?");
  String? answer;
  answer = stdin.readLineSync();

  if (answer == admin.type) {
    print("Type your serial number: ");
    String? input = stdin.readLineSync();
    int? serialNumber = int.tryParse(input ?? '');
    if (serialNumber == admin.serialNumber) {
      print("Welcome ${admin.name}");
      print("Do you want to create new event ?");
      String? newEvent;
      newEvent = stdin.readLineSync();
      if (newEvent == "yes") {
        admin.createEvent();
      }
    } else {
      print("Invalid password");
      return;
    }
  } else if (answer == emplopyee.type) {
    print("Welcome ${emplopyee.name}");
  } else if (answer == client.type) {
    print("Welcome ${client.name}");

    Event event = Event(
        "Cinderella Play",
        "A magical play about Cinderella and her adventures",
        "The Grand Opera House",
        "20:00 PM",
        5);
    print(
        "play name: ${event.name} ,description: ${event.description},place: ${event.place},time: ${event.time}");

    Event event2 = Event(
        "Programming",
        "A magical play about Cinderella and her adventures",
        "The Grand Opera House",
        "20:00 PM",
        10);

    print("Welcome to booking app");

    String? answer;

    while (event.availableTickets > 0) {
      print('Do You want to reserve ticket ?');
      answer = stdin.readLineSync();
      if (answer == "yes") {
        reserve(event);
        print("Your ticket has been reserved");
        print("Available tickets is ${event.availableTickets}");
      } else {
        print("Thank you for using our booking app");
        exit(0);
      }
    }
    print("No Available tickets");
  } else {
    print("User not found!!!");
  }
}
