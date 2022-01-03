import ecourts_java.*;


import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;


public class BookingsServlet extends HttpServlet{

    /**
     *
     */
    private static final long serialVersionUID = -436672359756500632L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

        int clubid;
        int courtid;

        try {
    
            clubid = Integer.parseInt(request.getParameter("clubid"));   
            courtid = Integer.parseInt(request.getParameter("courtid"));  
        }
        catch (NumberFormatException e)
        {
        clubid = 0 ;
        courtid = 0;
        }


        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = new PrintWriter(response.getWriter(), true);
    
        Slot slt = new Slot();
        List<Slot> slot_list =  slt.getSlotsCalendar(0, "", 0, 0, clubid, courtid, 0, "");
        JSONArray list = new JSONArray();

        for (Slot slot: slot_list){
            
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

            slt_obj.put("id",slot.getSlot_id());
            slt_obj.put("text","pao");
            slt_obj.put("start",slot.getDate() +"T" + (String)slot.getTime());

            //construct the new end time by adding the duration


            slt_obj.put("end",(String)slot.getDate() +"T"+ time_end );


            list.put(slt_obj);


        }
        out.write(list.toString());


}
    
}