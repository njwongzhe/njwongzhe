public class AnimalSound {
    public static void main(String[] args) {
        System.out.println("Test Animal Class.\n");

        Animal cat = new Animal();
        cat.name = "Tom";
        cat.setType("Cat");
        cat.playSound();
        food = "Mouse";
        eatFood();

        Animal mouse = new Animal();
        mouse.name = "Jerry";
        mouse.setType("Mouse");
        mouse.playSound();
        food = "Cheese";
        eatFood();
    }

    static String food;
    public static void eatFood() {
        System.out.println("I'm " + food + " eater");
    }
}

class Animal {
    public String name;
    private String type;
    private String sound;

    public void setType(String typ) {
        this.type = typ;
    }

    public void playSound() {
        if (this.type == "Cat")
            sound = "Meow";
        else if (this.type == "Mouse")
            sound = "???";
        else
            sound = "???";

        printSound();
    }

    private void printSound() {
        System.out.println("Hai I'm " + this.name + " - " + sound);
    }
}