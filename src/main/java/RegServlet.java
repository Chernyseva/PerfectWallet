import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/reg")
public class RegServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        int passT= pass.hashCode();
        System.out.println("hash "+passT);

        try {
            SqlConnector.addUser(name, email, passT);
        } catch (Exception e) {

        }

        resp.sendRedirect("/s");

    }

}
