package ecourts_java;

import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class json_file {

    public static void write_json(){

        Slot slt = new Slot();
        List<Slot> slot_list =  slt.getSlotsCalendar(0, "", 0, 0, 0, 2, 0, "");
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
        
        try (FileWriter file = new FileWriter("employees.json")) {
            //We can write any JSONArray or JSONObject instance to the file
            file.write(list.toString()); 
            file.flush();
        
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
}