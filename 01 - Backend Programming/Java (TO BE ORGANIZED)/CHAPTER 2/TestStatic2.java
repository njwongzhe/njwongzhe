public class TestStatic2 {
    public static void main(String[] args) {
        OtherStatic test1 = new OtherStatic();
        System.out.println(test1.num());             // Need to create object for OtherStatic when we want to use method num().
        System.out.println(OtherStatic.staticNum()); // No need to create object for OtherStatic when we want to use method staticNum() since it is static
                                                     // which is belong to the class but not object.

        System.out.println(staticNum()); // Can directly call if the static method is in the same class.
    }

    public static int staticNum() {
        return 1;
    }
}

class OtherStatic {
    public int num() {
        return 1;
    }

    public static int staticNum() {
        return 1;
    }
}