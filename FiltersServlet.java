import javax.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import ecourts_java.*;

public class FiltersServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {


        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = new PrintWriter(response.getWriter(), true);
        
        JSONObject mainObj = new JSONObject();

        JSONArray mun_array = new JSONArray();
        JSONArray sport_array = new JSONArray();


        //call the methods
        Municipality mun_obj = new Municipality();
        List<Municipality> mun_list =  mun_obj.getMunicipalies_with_clubs();

        Sport sprt = new Sport();
        List<Sport> sports_list = sprt.getAll_sports();


        for (Municipality mun: mun_list){
            
            JSONObject municipality_obj = new JSONObject();
            
            municipality_obj.put("id", mun.getMunic_id());
            municipality_obj.put("name", mun.getMun_name());

            mun_array.put(municipality_obj);


        }
        
        for (Sport sport: sports_list){
            
            JSONObject sport_obj = new JSONObject();
            
            sport_obj.put("id", sport.getSport_id());
            sport_obj.put("name", sport.getSport_name());

            sport_array.put(sport_obj);


        }



        mainObj.put("municipalities", mun_array);
        mainObj.put("sports", sport_array);



        out.write(mainObj.toString());


}
 
}