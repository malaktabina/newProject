class Admin {
  String addCategory;
  String editCategory;
  String deleteCategory;
  Admin(this.addCategory, this.editCategory, this.deleteCategory);
}

class Event {
  String name;
  String description;
  String place;
  String time;
  int availableTickets;
  Event(this.name, this.description, this.place, this.time,
      this.availableTickets);

      bool AvailableTickets(){
        return availableTickets > 0;

      }

  Tickets() {
    //if(availableTickets=0,availableTickets>0,availableTickets--)
    if (AvailableTickets()) {
      availableTickets--;
      print("Ticket booked successfully");
    } else {
      print("No available tickets");
    }
  }
}

class Client {
  String name;
  int serialNumber;
  Client(this.name, this.serialNumber);
}

class Employee {
  void bookEventForClient(Client, Event) {
    print("Booking event for ${Client.name}.");
    Event.Tickets();
  }
}

void main() {
  Admin admin = Admin("cinderella play", "editCategory", "deleteCategory");
  
  print("Book a ticket for the ${admin.addCategory}");
  Event event = Event(
      "Cinderella Play",
      "A magical play about Cinderella and her adventures",
      "The Grand Opera House",
      "20:00 PM",10);
    print("play name: ${event.name} ,description: ${event.description},place: ${event.place},time: ${event.time}"); 


  Client client = Client("Alice", 123456);

  Employee employee = Employee();
  employee.bookEventForClient(client, event);
}
