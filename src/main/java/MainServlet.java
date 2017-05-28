import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/s")
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        if (req.getAttribute("enter") != null) {
            System.out.println("Illegal " + req.getAttribute("enter"));
        }
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("------------");
        //JSONObject jo = new JSONObject(req.getReader().readLine());
        //System.out.println(jo.get("login").toString());
        String email = req.getParameter("email");
        System.out.println(email);
        String p = req.getParameter("pass");
        System.out.println(p);
        Integer pass = Integer.valueOf(req.getParameter("pass").hashCode());

        Integer pass1 = 0;
        try {
            pass1 = SqlConnector.getPass(email);
        } catch (Exception e) {

        }
        System.out.println(pass + "   " + pass1);
        HttpSession httpSession = req.getSession();
        if (pass.equals(pass1) && (!pass.equals(0))) {
            try {
                System.out.println(SqlConnector.getUserID(email));
                httpSession.setAttribute("userID", SqlConnector.getUserID(email));
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect("/site");
        } else {
            req.setAttribute("enter", "wrong");
            resp.sendRedirect("/s");
            System.out.println("Errrr");
            //resp.sendError(777);
        }
    }

    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        response.setContentType("application/json");//Отправляем от сервера данные в JSON -формате
        response.setCharacterEncoding("utf-8");//Кодировка отправляемых данных
        PrintWriter out = null;
        System.out.println("Processing request");
        HttpSession httpSession = request.getSession();
        try {
            out = response.getWriter();
            JSONObject jsonEnt = new JSONObject();
            String email = request.getParameter("email");
            Integer pass = Integer.valueOf(request.getParameter("pass").hashCode());

            Integer pass1 = 0;
            try {
                pass1 = SqlConnector.getPass(email);
            } catch (Exception e) {

            }

            if(pass.equals(pass1)&&(!pass.equals(0)))
            {
                try {
                    System.out.println(SqlConnector.getUserID(email));
                    httpSession.setAttribute("userID", SqlConnector.getUserID(email));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect("/site");
                System.out.println("Correct");
                jsonEnt.put("backgroundColor","#99CC66");
                jsonEnt.put("serverInfo", "Вы вошли!");

            }else
            {
                request.setAttribute("enter","wrong");
                response.sendRedirect("/s");
                System.out.println("Errrr");
                System.out.println("Uncorrect");
                jsonEnt.put("backgroundColor","#CC6666");
                jsonEnt.put("serverInfo", "Введен неправильный логин или пароль!");
            }
            out.print(jsonEnt.toString());
        }finally {
            out.flush();
            out.close();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("do get");
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            throw new IOException();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("do post");
        Logger logger = Logger.getLogger(MainServlet.class.getName());
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            logger.log(Level.SEVERE, "Main Servlet Do post json exception", ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }//*/

}