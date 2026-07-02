// BuildingManagementAppAns.java
// SKILL BASED TEST - Question 2
// SCSE1224 2024/2025-2
// Name: NG JAA WEI
// Matric No.: A24CS5046

import java.util.ArrayList;

class Person {
  private String name;
  private String contactNum;
  private Room roomAssigned;

  public Person(String name, String contactNum) {
    this.name = name;
    this.contactNum = contactNum;
  }

  public void assignRoom(Room roomAssigned) {
    this.roomAssigned = roomAssigned;
  }

  public void viewAssignedRoom() {
    System.out.println("--- Person In-Charge ----");
    System.out.println("Name :" + this.name);
    System.out.println("...room ....");
    if(roomAssigned instanceof ComputerLab) ((ComputerLab)(roomAssigned)).displayRoomDetails();
    else ((LectureHall)(roomAssigned)).displayRoomDetails();
  }

  public String toString() {
    return ("[ Name : " + this.name + " Contact Number : " + this.contactNum + " ]");
  }
}
class Room {
  public String roomName;
  public int capacity;
  private ArrayList<Equipment> equipmentList = new ArrayList<Equipment>();

  public Room(String name, int capacity) {
    this.roomName = name;
    this.capacity = capacity;
  }

  public void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  public void displayRoomDetails() {
    System.out.println("Name : " + this.roomName + " and Capacity : " + this.roomName);
  }
}
class ComputerLab extends Room {
  private int numberOfComputer;

  public ComputerLab(String roomName, int capacity, int numberOfComputer) {
    super(roomName, capacity);
    this.numberOfComputer = numberOfComputer;
  }

  public void displayRoomDetails() {
    System.out.println("Room Name :" + this.roomName); 
    System.out.println("Capacity :" + this.capacity);
    // super.displayRoomDetails();
    // System.out.println("Number of Computer: " + this.numberOfComputer);
  }
}
class LectureHall extends Room {
  private String seatingLayout;

  public LectureHall(String name, int capacity, String seatingLayout) {
    super(name, capacity);
    this.seatingLayout = seatingLayout;
  }

  public void displayRoomDetails() {
    System.out.println("Room Name :" + this.roomName); 
    System.out.println("Capacity :" + this.capacity);
    // super.displayRoomDetails();
    // System.out.println("Seating Layout: " + this.seatingLayout);
  }
}
class Equipment {
  private String name;
  private String type;

  public Equipment(String type, String name) {
    this.name = name;
    this.type = type;
  }

  public String toString() {
    return ("[ Name : " + this.name + " Type : " + this.type + "]");
  }

  public void displayEquipmentDetails() {
    System.out.println("Equipment Name: " + this.name);
    System.out.println("Equipment Type: " + this.type);
  }
}
class Building {
  private String buildingName;
  public ArrayList<Room> rooms = new ArrayList<Room>();

  public Building(String buildingName) {
    this.buildingName = buildingName;
  }

  public void addComputerLab(String name, int capacity, int numberOfComputers) {
    rooms.add(new ComputerLab(name, capacity, numberOfComputers));
  }

  public void addLectureHall(String name, int capacity, String seatingLayout) {
    rooms.add(new LectureHall(name, capacity, seatingLayout));
  }

  public void displayBuildingDetails() {
    System.out.println("Building name : " + this.buildingName);
    if(rooms.size() == 0) {
      System.out.println("No room in this building...");
    }
    else {
      System.out.println();
      for(int i = 0; i < rooms.size(); i++) {
        System.out.print("Room(" + i + ") : " + rooms.get(i).roomName);
        rooms.get(i).displayRoomDetails();
        rooms.get(i).roomName;
      }
    }
  }
}

// Main class to run the program
public class BuildingManagementApp {
  public static void main(String[] args) {
    System.out.println("---- FACULTY BUILDING MANAGEMENT APP --------");
    // Checkpoint #1
    System.out.println("\nCheckpoint #1");
    // CREATE 2 PERSON
    Person person1 = new Person("Ahmad Zolkafli", "017-7018088");
    Person person2 = new Person("Samad Abu", "013-9705090");
    System.out.println("using toString()");
    System.out.println(person1.toString());
    System.out.println(person2.toString());

    // Checkpoint #2
    System.out.println("\nCheckpoint #2");
    // CREATE 3 EQUIPMENTS
    Equipment computer1 = new Equipment("Computer for teacher in MPK1",
                                        "Electronics");
    Equipment projector = new Equipment("Projector in Dewan Kejora",
                                        "Visual");
    Equipment paSystem = new Equipment("Dewan Kejora PA Audio System",
                                       "Audio Equipment");
    System.out.println("using toString()");
    System.out.println(projector.toString());
    System.out.println(computer1.toString());
    System.out.println(paSystem.toString());
    System.out.println("using displayEquipmentDetails()");
    computer1.displayEquipmentDetails();
    projector.displayEquipmentDetails();
    paSystem.displayEquipmentDetails();

    // Checkpoint #3
    System.out.println("\nCheckpoint #3");
    // CREATE A BUILDING (N28a - Faculty Computing)
    Building fcBuilding = new Building("N28a Faculty Computing");
    System.out.println(fcBuilding.toString());
    // Display Building Details
    fcBuilding.displayBuildingDetails();//Print N28a with empty room

    // ADD 2 ROOMS: MPK1 & Dewan Kejora to fc building-(composition)
    fcBuilding.addComputerLab("MPK01", 50, 25);
    fcBuilding.addLectureHall("Dewan Kejora", 250, "U-shape");
    fcBuilding.displayBuildingDetails();

    // Checkpoint #4
    System.out.println("\nCheckpoint #4");
    // ASSIGN PERSON-IN-CHARGE TO ROOM (association)
    // Ahmad Zolkafli is in-charge of MPK1
    person1.assignRoom(fcBuilding.rooms.get(0));
    // Samad Abu is in-charge of Dewan Kejora
    person2.assignRoom(fcBuilding.rooms.get(1));
    person1.viewAssignedRoom();
    person2.viewAssignedRoom();

    // Checkpoint #5
    System.out.println("\nCheckpoint #5");
    // ADD EQUIPMENT TO ROOM (aggregation)
    // Add equipment to MPK1
    fcBuilding.rooms.get(0).addEquipment(computer1);
    // Add 2 equipments to Dewan Kejora
    fcBuilding.rooms.get(1).addEquipment(projector);
    fcBuilding.rooms.get(1).addEquipment(paSystem);
  }
}