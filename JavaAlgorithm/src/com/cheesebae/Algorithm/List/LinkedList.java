package com.cheesebae.Algorithm.List;

import javax.xml.soap.Node;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Collection;
import java.util.prefs.NodeChangeEvent;


public class LinkedList {

    int length = 0;
    SimpleNode start;
    SimpleNode end;

    void append(int value) {
        SimpleNode newNode = new SimpleNode(value);
        if (null == start && null == end) {
            start = newNode;
            end = newNode;
        }
        else {
            end.setNextNode(newNode);
            end = newNode;
        }
        length += 1;
    }

    String findAll() {
        String result = "";
        int count = 1;
        SimpleNode nowValue = start;
        while (count <= length) {
            result += String.valueOf(nowValue.getValue());
            if (count != length) {
                result += ", ";
            }
            nowValue = nowValue.getNextNode();
            count += 1;
        }
        return "[" + result + "]";
    }

}
