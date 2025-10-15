package TEST;

import java.util.*;
import java.util.stream.*;
import java.lang.Math;
import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

public class Test {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        /* 
        Math test = () -> {
            double max = 0;
            double[] a = new double[4];
            for(int i = 0; i < a.length; i++) {
                System.out.print("Value " + i + ": ");
                a[i] = scn.nextDouble();
                if(a[i] > max) max = a[i];
            }
            return max;
        };
        */
        // System.out.println(test.max());
        /* 
        List.of(1, 2, 3, 4, 5).stream().forEach(System.out::println);
        
        List<Integer> list1 = List.of(1, 2, 3, 4, 5);
        List<String> list2 = Arrays.asList("Ali", "Akau");
        Stream<Integer> s1 = Stream.of(1, 2, 3, 4, 5);
        Stream<Integer> s2 = list1.stream();
        list1.stream().forEach(System.out::println);
        System.out.println();
        s2.forEach(System.out::println);
        IntStream int1 = IntStream.of(1, 2, 3, 4, 5);

        int1.forEach(System.out::println);
        */

        //IntStream.iterate(1, n -> n + 1).limit(5).forEach(stream -> System.out.println(stream));
        // IntStream.generate(() -> (int)(Math.random() * 100)).limit(5).forEach(System.out::println);

       Consumer<Integer> consumer = n -> System.out.println(n);
       BiFunction<Integer, Integer, Double> biFunction = (a, b) -> (double)(a + b);
       Supplier<Integer> supplier = () -> (int)(Math.random() * 100);
       Predicate<Integer> predicate = n -> n % 2 == 0;
       Function<Integer, String> function = n -> "Number: " + n;


        biFunction.apply(null, null);
        
        scn.close();

    }
}
/* 
@FunctionalInterface
interface Math {
    double max();
}
    */