package ecourts_java;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class test {
    public static void main(String[] args) throws ParseException {
        
        //Slot slot = new Slot();
        //List<Slot> slot_list = slot.getSlots(0, "",0,4);
        //System.out.print(slot_list.size());
        //Customer customer= new Customer("konstantina","kzouni","zouni","koukou@gmail.com","6984811531","aristeiou","chalandri","8","15234","123","1/1/2021","9/5/2001");
        //customer.register();
        //User user=new User();
        //int i=0;
        //i=user.checkPassword("idnoq90", "6903281018");
        //System.out.print(i);

        Slot slt = new Slot();
        List<Slot> slt_list =  slt.getSlots(1, "", 0, 0, 0, 0, 0,"18:00");
        System.out.println(slt_list.size());
        //String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //System.out.println(date);
    }
    
}