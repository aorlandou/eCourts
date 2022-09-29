import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import ecourts_java.*;

public class SlotsServlet extends HttpServlet {
    




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
        List<Slot> slot_list =  slt.getSlots(0, "", 0, 0, clubid, courtid, 0, "",0,1);
        JSONArray list = new JSONArray();

        for (Slot slot: slot_list){
            
            JSONObject slt_obj = new JSONObject();
            String photo_path = "";
      
            photo_path= "photos/"+slot.getCourt().getClub().getName()+"/"+slot.getCourt().getName()+".jpg";
      
        
            if (photo_path != null){
                photo_path = photo_path.replaceAll("\\s", "");
            }


            slt_obj.put("id",slot.getSlot_id());
            slt_obj.put("sport_id", slot.getCourt().getSportid());
            slt_obj.put("sport", slot.getCourt().getSport());
            slt_obj.put("duration", slot.getDuration());
            slt_obj.put("date", slot.getDate());
            slt_obj.put("time", slot.getTime());
            slt_obj.put("court", slot.getCourt().getName());
            slt_obj.put("price", slot.getPrice());
            slt_obj.put("sportsclub", slot.getCourt().getClub().getName());
            slt_obj.put("munic_id", slot.getCourt().getClub().getMunic_id());
            slt_obj.put("street", slot.getCourt().getClub().getStreet());
            slt_obj.put("town", slot.getCourt().getClub().getTown());
            slt_obj.put("surface", slot.getCourt().getSurface());
            slt_obj.put("photopath", photo_path);


            list.put(slt_obj);

        }
        out.write(list.toString());

}
}