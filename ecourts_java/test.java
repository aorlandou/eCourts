package ecourts_java;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
        List<Slot> slt_list =  slt.getSlots(1, "", 0, 0, 0, 0, 0,"");
        System.out.println(slt_list.size());
        slt=slt.getSlot_by_id(8);
        if (slt==null){
            System.out.println("n");
        }
  
        //for (Slot slt1 : slt_list){
        //   System.out.println(slt1.getCourt().getClub().getName());
        //   System.out.println(slt1.getCourt().getName());
        //}   
        //Slot slt2 = slt_list.get(4);
        //System.out.println(slt2.getCourt().getClub().getName());

        //String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //System.out.println(date);

        //Slot slt = new Slot();
        //slt.generateAllSlots("10:00:00", "14:00:00","2021-12-28",11,70.0);
        //FootballCourt fb = new FootballCourt();
        //Court tn = new Court();
        //Court crt = tn.getFootballCourtInfo(9);
        //System.out.println(crt.getSize());
        //System.out.println(crt.getName());
        //System.out.println(crt.getName());
        //Court cr = new Court();
        //cr.getCourtDetails(4);

        
        
                

       
    
    }
    
}