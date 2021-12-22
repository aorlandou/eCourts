<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="ecourts_java.*"%>
<%@ page import ="java.util.*"%>
<%@ page import "java.io.FileWriter"%>
<%@ page import  "org.json.JSONArray"%>
<%@ page import "org.json.JSONObject"%>
<%

int courtid = request.getParameter("courtid");
Slot slt = new Slot();
List<Slot> slot_list =  slt.getSlots(0, "", 0, 0, 0, courtid, 0, "");
JSONArray list = new JSONArray();

for (Slot slot: slot_list){
    
    JSONObject slt_obj = new JSONObject();

    slt_obj.put("id",slot.getSlot_id());
    slt_obj.put("text","pao");
    slt_obj.put("start",slot.getDate());
    slt_obj.put("end",slot.getTime());

    list.put(slt_obj);


}

try (FileWriter file = new FileWriter("employees.json")) {
    //We can write any JSONArray or JSONObject instance to the file
    file.write(list.toString()); 
    file.flush();

} catch (Exception e) {
    e.printStackTrace();
}




















%>