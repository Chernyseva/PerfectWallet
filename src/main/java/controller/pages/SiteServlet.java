package controller.pages;

import model.WalletService;
import model.entity.Item;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/site")
public class SiteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        System.out.println("sitesitesite with user " + session.getAttribute("userID"));
        if (session.getAttribute("userID") == null) {
            req.setAttribute("enter", "illegal");
            req.getRequestDispatcher("/s").forward(req, resp);
        }
        req.setAttribute("user", session.getAttribute("userID"));
        try {
            //model.WalletService.getItemsByDate(req.getSession().getAttribute("userID").toString(),"2017-04-04","2017-04-10");
            List<Item> list = WalletService.getItems(req.getSession().getAttribute("userID").toString());
            JSONObject jo = new JSONObject();
            String uName = WalletService.getUserName(req.getSession().getAttribute("userID").toString());
            jo.append("name", uName);
            String uuu = jo.get("name").toString();

            System.out.println("NNNNNNNaaaaaaammmmmmeeeee:" + uuu);
            jo.append("items", list);
            System.out.println(jo);
            req.setAttribute("data", list);
            req.setAttribute("jo", jo);
            List<Float> sums = sumByCat(list);
            for (Float f : sums) {
                System.out.println(f);
            }
            req.setAttribute("sums", sums);

        } catch (Exception e) {
        }

        req.getRequestDispatcher("mypage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        super.doPost(req, resp);
    }

    private List<Float> sumByCat(List<Item> e) {
        List<Float> list = new ArrayList<Float>(5);
        for (int i = 0; i < 5; i++) {
            list.add(0f);
        }
        for (Item i : e) {
            //System.out.println(list.get(i.getCategory()));
            list.set(i.getCategory() - 1, list.get(i.getCategory()) + Float.valueOf(i.getSum()));
        }
        return list;
    }

}
