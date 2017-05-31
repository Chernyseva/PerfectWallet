package controller;

import controller.utils.Labels;
import model.DatesService;
import model.WalletService;
import model.entity.Item;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, JSONException {
        System.out.println("A servlet");
        HttpSession session = req.getSession();
        req.setAttribute("user", session.getAttribute("userID"));

        JSONObject getFromServ = new JSONObject((req.getReader().readLine()));
        System.out.println("JJJSSSOOONNN");
        System.out.println(getFromServ.toString());
        String sort = getFromServ.get("sort").toString();
        System.out.println(getFromServ.get("sort"));
        try {

            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
            Date d;
            String date;
            List<Item> list = null;
            List<Float> dates = null;
            List<String> labels = null;
            if (sort.equals("day")) {
                String dateTo = sdf2.format(new Date());
                String dateFrom = sdf2.format(new Date());
                System.out.println(dateFrom + "! " + dateTo);
                list = WalletService.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateFrom);
                dates = DatesService.getForDay(list);
                labels = Labels.processLabelsForDay(list.size());
            } else if (sort.equals("week")) {

                Date dd1 = new Date();
                System.out.println(dd1);
                dd1.setHours(dd1.getHours() - 168);
                dd1.setDate(dd1.getDate() + 1);
                System.out.println(dd1);
                String dateFrom = sdf2.format(dd1);
                String dateTo = sdf2.format(new Date());
                list = WalletService.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateTo);
                //Map<String ,Float> map = model.DatesService.getForWeek(dd1, list);
                dates = DatesService.getForWeek(dd1,req.getSession().getAttribute("userID").toString());
                labels = Labels.processLabelsForWeek(sdf2.parse(dateFrom));

            } else if (sort.equals("all")) {
                list = WalletService.getItems(req.getSession().getAttribute("userID").toString());
                //dates = model.DatesService.getForAll(list);
            } else if (sort.equals("month")) {
                Date dd2 = new Date();
                int ddd = dd2.getDate();
                dd2.setMonth(dd2.getMonth() - 1);


                if (ddd == dd2.getDate()){
                    dd2.setDate(dd2.getDate() + 1);
                }

                String dateFrom = sdf2.format(dd2);
                String dateTo = sdf2.format(new Date());
                list = WalletService.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateTo);
                dates = DatesService.getForMonth(dd2, req.getSession().getAttribute("userID").toString());
                System.out.println(dd2);
                System.out.println("month");
                labels = Labels.processLabelsForMonth(sdf2.parse(dateFrom));
            } else if (sort.equals("year")) {
                String dateTo = sdf2.format(new Date());
                Date dd = new Date();
                dd.setYear(new Date().getYear() - 1);
                dd.setDate(dd.getDate() + 1);
                String dateFrom = sdf2.format(dd);
                System.out.println(dateFrom + " ! " + dateTo);
                list = WalletService.getItemsByDate(req.getSession().getAttribute("userID").toString(), dateFrom, dateTo);
                System.out.println(list.get(2).getSum());
                dates = DatesService.getForYear(sdf2.parse(dateFrom), req.getSession().getAttribute("userID").toString());
                labels = Labels.processLabelsForYear(dd);
            }
            ////////////////////
            List<Float> sums = new ArrayList<Float>(5);
            for (int i = 0; i < 5; i++) {
                sums.add(0f);
            }
            System.out.println("sums created");
            for (Item i : list) {
                System.out.println(Float.parseFloat(i.getSum()) + " + " + sums.get(i.getCategory() - 1) + "  category=" + i.getCategory());
                Float num = Float.parseFloat(i.getSum()) + sums.get(i.getCategory() - 1);
                sums.set(i.getCategory() - 1, num);
            }
            System.out.println("sums by category");
            System.out.println(sums);
            ///////////////////////
            System.out.println("Items by dates");
            System.out.println(dates);

            System.out.println("Labels");
            System.out.println(labels);
            resp.setCharacterEncoding("utf-8");

            JSONObject jo = new JSONObject();
            String uName = WalletService.getUserName(req.getSession().getAttribute("userID").toString());
            jo.put("name", uName);
            String uuu = jo.get("name").toString();
            System.out.println("NNNNNNNaaaaaaammmmmmeeeee:" + uuu);
            jo.append("items", list);
            jo.append("sums", sums);
            jo.append("dates", dates);
            jo.append("labels",labels);
            System.out.println("JJJJSSSOOONNN RESPONSE");
            System.out.println(jo);

            //req.setAttribute("data", list);
            resp.getWriter().write(jo.toString());
//            req.setAttribute("jo", jo);

        } catch (Exception e) {
        }

    }

}
