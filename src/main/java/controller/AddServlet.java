package controller;

import model.WalletService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Анастасия on 14.04.2017.
 */
@WebServlet("/add")
public class AddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String sum = req.getParameter("sum");
        String note = req.getParameter("note");
        String cat = req.getParameter("category");
        String userID = req.getSession().getAttribute("userID").toString();
        try {
            WalletService.addItem(date, time, sum, userID, note,cat);
        } catch (Exception e) {

        }

        resp.sendRedirect("/site");

    }

}
