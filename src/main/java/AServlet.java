import jdk.nashorn.internal.parser.JSONParser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AServlet", urlPatterns = {"/AServlet"})
public class AServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, JSONException {
        System.out.println("A servlet");
        HttpSession session = req.getSession();
        req.setAttribute("user", session.getAttribute("userID"));

        JSONObject getFromServ = new JSONObject((req.getReader().readLine()));
        String sort = getFromServ.get("sort").toString();
        System.out.println(getFromServ.get("sort"));
        try {

            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
            Date d;
            String date;
            List<Item> list = null;
            List<Float> dates = null;
            if (sort.equals("day")) {
                String dateTo = sdf2.format(new Date());
                String dateFrom = sdf2.format(new Date());
                System.out.println(dateFrom + "! " + dateTo);
                list = SqlConnector.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateFrom);
                dates = DatesSums.getForDay(list);
            } else if (sort.equals("week")) {

                Date dd1 = new Date();
                dd1.setHours(dd1.getHours() - 168);
                String dateFrom = sdf2.format(dd1);
                String dateTo = sdf2.format(new Date());
                list = SqlConnector.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateTo);
                //dates = DatesSums.getForWeek(sdf2.parse(dateFrom),list);
            } else if (sort.equals("all")) {
                list = SqlConnector.getItems(req.getSession().getAttribute("userID").toString());
                //dates = DatesSums.getForAll(list);
            } else if (sort.equals("month")) {
                Date dd2 = new Date();
                dd2.setMonth(dd2.getMonth() - 1);
                String dateFrom = sdf2.format(dd2);
                String dateTo = sdf2.format(new Date());
                list = SqlConnector.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateTo);
                //dates = DatesSums.getForMonth(sdf2.parse(dateFrom),list);
            } else if (sort.equals("year")) {
                String dateTo = sdf2.format(new Date());
                Date dd = new Date();
                dd.setYear(new Date().getYear() - 1);
                String dateFrom = sdf2.format(dd);
                System.out.println(dateFrom + " ! " + dateTo);
                list = SqlConnector.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateTo);
                System.out.println(list.get(2).getSum());
                //dates = DatesSums.getForYear(sdf2.parse(dateFrom),list);
            }
            ////////////////////
            List<Float> sums = new ArrayList<Float>(5);
            for (int i = 0; i < 5; i++) {
                sums.add(0f);
            }
            System.out.println("sums created");
            for (Item i : list) {
                System.out.println(Float.parseFloat(i.getSum()) + " + " + sums.get(i.getCategory()-1) + "  category=" + i.getCategory());
                Float num = Float.parseFloat(i.getSum()) + sums.get(i.getCategory()-1);
                sums.set(i.getCategory()-1, num);
            }
            System.out.println("sums by category");
            System.out.println(sums);
            ///////////////////////
            System.out.println("Items by dates");
            System.out.println(dates);
//            List<Float> dates = new ArrayList<Float>();
//            for (int i = 0; i < 5; i++) {
//                sums.add(0f);
//            }
//            System.out.println("sums created");
//            for (Item i : list) {
//                System.out.println(Float.parseFloat(i.getSum()) + " + " + sums.get(i.getCategory()-1) + "  category=" + i.getCategory());
//                Float num = Float.parseFloat(i.getSum()) + sums.get(i.getCategory()-1);
//                sums.set(i.getCategory()-1, num);
//            }
//            System.out.println("sums by category");
//            System.out.println(sums);
            ////////////////////////////////
            resp.setCharacterEncoding("utf-8");
            //SqlConnector.getItemsByDate(req.getSession().getAttribute("userID").toString(),"2017-04-04","2017-04-10");
            //List<Item> list = SqlConnector.getItems(req.getSession().getAttribute("userID").toString());
            JSONObject jo = new JSONObject();
            String uName = SqlConnector.getUserName(req.getSession().getAttribute("userID").toString());
            jo.put("name", uName);
            String uuu = jo.get("name").toString();
            System.out.println("NNNNNNNaaaaaaammmmmmeeeee:" + uuu);
            jo.append("items", list);
            jo.append("sums", sums);
            System.out.println();
            System.out.println(jo);

            //req.setAttribute("data", list);
            resp.getWriter().write(jo.toString());
//            req.setAttribute("jo", jo);

        } catch (Exception e) {
        }


//        req.getRequestDispatcher("mypage.jsp").forward(req, resp);
        //resp.sendRedirect("/site");
        /*resp.setContentType("application/json");//Отправляем от сервера данные в JSON -формате
        resp.setCharacterEncoding("utf-8");//Кодировка отправляемых данных
        try {
            System.out.println("Inside of try");
            JSONObject jsonEnt = new JSONObject();
            System.out.println("created json");
            PrintWriter out = resp.getWriter();
            System.out.println("print writer");
            req.getSession().
            /System.out.println(req.getParameter("name"));
            if (req.getParameter("name").equals("aaa")) {
                System.out.println("true");
               jsonEnt.put("serverInfo", "Вы вошли!");
            } else {
                System.out.println("false");
               jsonEnt.put("serverInfo", "Введен неправильный логин или пароль!");
            }
            //out.print(jsonEnt.toString());
            System.out.println("closing");
            out.flush();
            out.close();
            System.out.println("closed");
        }catch (Exception e){
            System.out.println("excepton");
            e.printStackTrace();
        }*/
    }

}
