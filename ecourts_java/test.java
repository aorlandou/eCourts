package ecourts_java;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class test {
    public static void main(String[] args) throws ParseException {
        
        Slot slot = new Slot();
        List<Slot> slot_list = slot.getSlots(0, "",0,4);
        System.out.print(slot_list.size());
        
        

    }
    
}