package ecourts_java;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class test {
    public static void main(String[] args) throws ParseException {

        // Slot slot = new Slot();
        // List<Slot> slot_list = slot.getSlots(0, "",0,4);
        // System.out.print(slot_list.size());
        // Customer customer= new
        // Customer("konstantina","kzouni","zouni","koukou@gmail.com","6984811531","aristeiou","chalandri","8","15234","123","1/1/2021","9/5/2001");
        // customer.register();
        // User user=new User();
        // int i=0;
        // i=user.checkPassword("idnoq90", "6903281018");
        // System.out.print(i);

        // Slot slt = new Slot();
        // Court court=new Court();
        // court=court.getCourt_by_id(8);
        // if (court==null){
        // System.out.println("n");
        // }else{
        // System.out.println(court.getSurface());
        // }

        // for (Slot slt1 : slt_list){
        // System.out.println(slt1.getCourt().getClub().getName());
        // System.out.println(slt1.getCourt().getName());
        // }
        // Slot slt2 = slt_list.get(4);
        // System.out.println(slt2.getCourt().getClub().getName());

        // String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        // System.out.println(date);

        Slot slt = new Slot();
        try {
            slt.generateAllSlots("17:00:00", "20:00:00", "2022-01-26", "12", "22.2");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // slt.generateAllSlots("20:00:00", "23:00:00","2022-01-29",8,70.0);
        // slt.generateAllSlots("19:00:00", "22:00:00","2022-01-28",10,15.0);
        // slt.generateAllSlots("19:00:00", "21:00:00","2022-01-27",10,15.0);
        // slt.generateAllSlots("18:00:00", "21:00:00","2022-01-29",10,15.0);

        // FootballCourt fb = new FootballCourt();
        // Court tn = new Court();
        // Court crt = tn.getFootballCourtInfo(9);
        // System.out.println(crt.getSize());
        // System.out.println(crt.getName());
        // System.out.println(crt.getName());
        // Court cr = new Court();
        // cr.getCourtDetails(4);

        // Booking bk = new Booking();
        // Booking booking = bk.getBookingSlotDetails(16);
        // System.out.println(booking.getCustomer().getName());
        // Slot slt = new Slot();
        // List<Slot> slot_list = slt.getSlotsManaging(1);
        // for (Slot slt1: slot_list){
        // System.out.println(slt1.getStatus());
        // if (slt1.getStatus().equals("BOOKED")){
        // System.out.println(slt1.getBooking().getCustomer().getName());
        // }

        // }
        // Booking book=new Booking();
        // book.setNotAvailable(128);

        // Court crt = new Court();
        // List<Court> court_list = crt.getCourts_of_club_with_info(1);
        // for (Court court: court_list){
        // System.out.print(court.getCourt_id());
        // }

        Booking bk = new Booking();
        // bk.bookingsHistory(3);
        // Booking booking = bk.upcomingBooking(3);
        // if (booking == null){
        // System.out.println("NO BOOKING");
        // }else{
        // System.out.println(booking.getSlot().getSlot_id());
        // }
        // Slot slt = new Slot();
        // List<Slot> slot_list = slt.getSlotsCalendar(0, "", 0, 0, 1, 1, 0, "");
        // List<Booking> bookings_list = bk.BookingsCalendar(1, 1);
        // for (Booking booking: bookings_list){
        // System.out.println(booking.getCustomer().getName());
        // }
        //SportsClub spr = new SportsClub();
        //List<SportsClub> c = null;
        //try {
        //    c = spr.popularClubs();
        //} catch (Exception e) {
        //    // TODO Auto-generated catch block
        //    e.printStackTrace();
        //}
        // System.out.println(c.size());
        //slt.getSlots(1, "", 7, 0, 0, 0, 0, "", 0, 1);
        //Court crt = new Court();
        
        //System.out.println(crt.getTennisCourtInfo(11).getName());
        //Slot slt1 = new Slot();
        //System.out.println(slt1.isSlotAdded("09:00:00", "2021-12-27", 1,2));
        

    }
    
}