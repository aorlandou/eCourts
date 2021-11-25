package ecourts_java;

import java.util.List;

public class test {
    public static void main(String[] args) {
        Slot slot = new Slot();
        List<Slot> slot_list = slot.getSlots(1, null);
        System.out.print(slot_list.size());


    }
    
}