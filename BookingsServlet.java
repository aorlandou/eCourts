import ecourts_java.*;

import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.*;
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class BookingsServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -436672359756500632L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int clubid;
        int courtid;
        int type_of_results;

        try {

            clubid = Integer.parseInt(request.getParameter("clubid"));
            courtid = Integer.parseInt(request.getParameter("courtid"));
            type_of_results = Integer.parseInt(request.getParameter("type"));
        } catch (NumberFormatException e) {
            clubid = 0;
            courtid = 0;
            type_of_results = 0;
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = new PrintWriter(response.getWriter(), true);
        JSONArray list = new JSONArray();

        if (type_of_results == 0) {

            Slot slt = new Slot();
            List<Slot> slot_list = slt.getSlotsCalendar(0, "", 0, 0, clubid, courtid, 0, "");

            for (Slot slot : slot_list) {

                JSONObject slt_obj = new JSONObject();

                SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
                java.util.Date d1 = null;
                try {
                    d1 = format.parse(slot.getTime());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Calendar cal = Calendar.getInstance();
                cal.setTime(d1);
                cal.add(Calendar.HOUR, slot.getDuration());
                String time_end = format.format(cal.getTime());

                // change the time format

                slt_obj.put("id", slot.getSlot_id());
                slt_obj.put("text", "pao");
                slt_obj.put("start", slot.getDate() + "T" + (String) slot.getTime());
                slt_obj.put("end", (String) slot.getDate() + "T" + time_end);

                list.put(slt_obj);

            }

        } else {

            Booking bk = new Booking();
            List<Booking> bookings_list = bk.BookingsCalendar(clubid, courtid);

            for (Booking booking : bookings_list) {

                JSONObject book_obj = new JSONObject();

                SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
                java.util.Date d1 = null;
                try {
                    d1 = format.parse(booking.getSlot().getTime() + ":00");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Calendar cal1 = Calendar.getInstance();
                cal1.setTime(d1);
                cal1.add(Calendar.HOUR, booking.getSlot().getDuration());
                String time_end = format.format(cal1.getTime());


                DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                Date date = null;
                try {
                    date = formatter.parse(booking.getSlot().getDate());
                } catch (ParseException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                    String pattern = "yyyy-MM-dd";
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                    String date_as_string = simpleDateFormat.format(date);



                    book_obj.put("id",booking.getBooking_id());
                    book_obj.put("text","pao");
                    book_obj.put("start",date_as_string +"T" + (String)booking.getSlot().getTime()+":00");
                    book_obj.put("end",date_as_string +"T"+ time_end );


                    list.put(book_obj);

                }


            }

    
        
        out.write(list.toString());


}
    
}