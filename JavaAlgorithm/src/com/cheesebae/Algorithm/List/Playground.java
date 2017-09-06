package com.cheesebae.Algorithm.List;

/**
 * Created by feelaesth on 2017. 9. 6..
 */
public class Playground {

    public static void main(String[] args) {
        Playground self = new Playground();
        self.playSimpleLinkedList();
    }

    void playSimpleLinkedList() {
        LinkedList list = new LinkedList();
        list.append(1);
        list.append(2);
        System.out.println(list.findAll());
        list.append(3);
        System.out.println(list.findAll());
    }
}
