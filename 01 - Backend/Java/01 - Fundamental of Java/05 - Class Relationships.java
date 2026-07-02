// Class Relationships: Association, Aggregation, and Composition.

import java.util.ArrayList;

// 1. Aggregation (Has-A Relationship): Weak relationship. The child object can exist independently of the parent.
// E.g., Equipment in a room. If the room is destroyed, the equipment still exists.
class Equipment {
    private String name;
    private String type;

    public Equipment(String name, String type) {
        this.name = name;
        this.type = type;
    };

    @Override
    public String toString() {
        return "[ Equipment: " + name + " (Type: " + type + ") ]";
    };
}

// 2. Composition (Part-Of Relationship): Strong relationship. The child object cannot exist independently of the parent.
// E.g., Room inside a Building. If the building is destroyed, the rooms inside are also destroyed.
class Room {
    public String roomName;
    private ArrayList<Equipment> equipments; // Aggregation list.

    public Room(String roomName) {
        this.roomName = roomName;
        this.equipments = new ArrayList<>();
    };

    // Add equipment (Aggregation).
    public void addEquipment(Equipment eq) {
        this.equipments.add(eq);
    };

    public void displayRoomDetails() {
        System.out.println("  Room Name: " + roomName);
        System.out.println("  Equipments inside room:");
        if (equipments.isEmpty()) {
            System.out.println("    None.");
        } else {
            for (Equipment eq : equipments) {
                System.out.println("    " + eq.toString());
            }
        }
    };
}

class Building {
    private String name;
    private ArrayList<Room> rooms; // Composition list.

    public Building(String name) {
        this.name = name;
        this.rooms = new ArrayList<>();
    };

    // Creation of Room happens inside the Building (Composition).
    // The life cycle of Room is bound to the Building.
    public void createRoom(String roomName) {
        Room newRoom = new Room(roomName);
        rooms.add(newRoom);
    };

    public Room getRoom(int index) {
        return rooms.get(index);
    };

    public void displayBuilding() {
        System.out.println("Building: " + name);
        for (Room r : rooms) {
            r.displayRoomDetails();
        }
    };
}

// 3. Association (Uses-A Relationship): Bidirectional or unidirectional connection. Objects are independent.
// E.g., Person assigned to manage a Room.
class Person {
    private String name;
    private Room managedRoom; // Association.

    public Person(String name) {
        this.name = name;
    };

    public void assignRoom(Room room) {
        this.managedRoom = room;
    };

    public void viewAssignedRoom() {
        System.out.println("Manager Name: " + name);
        if (managedRoom != null) {
            System.out.println("Managing Room: " + managedRoom.roomName);
        } else {
            System.out.println("No room assigned.");
        }
    };
}

class RelationshipsDemo {
    public static void main(String[] args) {
        System.out.println("--- 1. Composition Demo ---");
        // Creating Building.
        Building fcBuilding = new Building("N28a Faculty Computing");
        
        // Rooms are created within the Building.
        fcBuilding.createRoom("MPK01");
        fcBuilding.createRoom("Dewan Kejora");
        fcBuilding.displayBuilding();
        System.out.println();

        System.out.println("--- 2. Aggregation Demo ---");
        // Create Equipment (independent lifecycle).
        Equipment projector = new Equipment("Projector", "Visual");
        Equipment computer = new Equipment("PC", "Electronics");

        // Aggregating Equipment into a Room of the Building.
        Room mpkRoom = fcBuilding.getRoom(0);
        mpkRoom.addEquipment(projector);
        mpkRoom.addEquipment(computer);
        fcBuilding.displayBuilding();
        System.out.println();

        System.out.println("--- 3. Association Demo ---");
        // Person and Room associated with each other.
        Person manager = new Person("Ahmad Zolkafli");
        manager.assignRoom(mpkRoom);
        manager.viewAssignedRoom();
    }
}
