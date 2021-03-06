package controller;

import model.WalletService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Анастасия on 24.05.2017.
 */
@WebServlet(name = "StartServlet", urlPatterns = {"/StartServlet"})
public class StartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("B servlet starts");
        System.out.println(req.getReader().readLine());
    }

    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("B servlet starts");
        JSONObject jo = new JSONObject(req.getReader().readLine());
        System.out.println(jo.toString());
        String email = jo.get("login").toString();
        String p= jo.get("password").toString();
        Integer pass = Integer.valueOf(p.hashCode());

        Integer pass1 = 0;
        try {
            pass1 = WalletService.getPass(email);
        } catch (Exception e) {

        }
        System.out.println(pass + "   " + pass1);

        HttpSession httpSession = req.getSession();
        if (pass.equals(pass1) && (!pass.equals(0))) {
            System.out.println("b serblet sucess");
            try {
                System.out.println(WalletService.getUserID(email));
                httpSession.setAttribute("userID", WalletService.getUserID(email));
            } catch (Exception e) {
                e.printStackTrace();
            }
            JSONObject jo1 = new JSONObject();
            jo1.append("id","correct");
            System.out.println(jo1.toString());
            resp.getWriter().write(jo1.toString());
            //resp.sendRedirect("/site");
        } else {
            System.out.println("b servlet wrong");
            JSONObject jo1 = new JSONObject();
            jo1.append("id","uncorrect");
            System.out.println(jo1.toString());
            resp.getWriter().write(jo1.toString());
            //req.setAttribute("enter", "wrong");
            //resp.sendRedirect("/s");
            //System.out.println("Errrr");
            //resp.sendError(777);
        }

        //resp.getWriter().write("Hi!");
    }
}
