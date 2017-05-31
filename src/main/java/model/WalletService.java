package model;

import model.entity.Item;

import javax.naming.NamingException;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Анастасия on 06.04.2017.
 */
public class WalletService {
    // JDBC URL, username and password of MySQL server
    private static final String url = "jdbc:mysql://localhost:3306/wallet";
    private static final String user = "root";
    private static final String password = "78018303";

    // JDBC variables for opening and managing connection
    private static Connection con;
    private static Statement stmt;
    private static ResultSet rs;

    public static void Conn() throws ClassNotFoundException, SQLException, NamingException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
    }

    public static void CloseDB() throws ClassNotFoundException, SQLException {
        con.close();
    }

    public static void addUser(String name, String email, int pass) throws ClassNotFoundException, SQLException {
        try {
            Conn();
            stmt = con.createStatement();
            PreparedStatement statement = con.prepareStatement("INSERT INTO user (name,email,password) VALUES (?,?,?)");
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setInt(3, Integer.valueOf(pass).hashCode());
            statement.execute();
            statement.close();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            stmt.close();
            CloseDB();
        }
    }

    public static void addItem(String date, String time, String sum, String userID, String note, String category) throws ClassNotFoundException, SQLException {
        try {
            Conn();
            stmt = con.createStatement();
            PreparedStatement statement = con.prepareStatement("INSERT INTO item (date,sum,userID,note,categoryID) VALUES (?,?,?,?,?)");
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf1.parse(date);
            date = sdf2.format(d);

            statement.setString(1, date);
            //statement.setString(2, time);
            statement.setInt(2, Integer.valueOf(sum));
            statement.setInt(3, Integer.valueOf(userID));
            statement.setString(4, note);
            statement.setString(5, category);
            statement.execute();
            statement.close();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            stmt.close();
            CloseDB();
        }
    }

    public static String getUserID(String email) throws ClassNotFoundException, SQLException, NamingException {

        Conn();
        stmt = con.createStatement();

        PreparedStatement statement = con.prepareStatement("select ID from user where email=?");
        statement.setString(1, email);
        ResultSet rs = statement.executeQuery();

        String userID = "";
        while (rs.next()) {
            userID = rs.getString("ID");
        }

        rs.close();
        statement.close();
        stmt.close();
        CloseDB();
        return userID;
    }

    public static String getUserName(String userID) throws ClassNotFoundException, SQLException, NamingException {

        System.out.println("get user name starts");
        Conn();
        stmt = con.createStatement();

        PreparedStatement statement = con.prepareStatement("select name from user where ID=?");
        statement.setString(1, userID);
        ResultSet rs = statement.executeQuery();

        System.out.println("start to search name");
        String userName = "";
        while (rs.next()) {
            userName = rs.getString("name");
        }
        System.out.println("find name "+userName);
        rs.close();
        statement.close();
        stmt.close();
        CloseDB();
        return userName;
    }

    public static int getPass(String email) throws ClassNotFoundException, SQLException, NamingException {
        int pass = 0;

        Conn();
        stmt = con.createStatement();
        PreparedStatement statement = con.prepareStatement("select password from user where email=?");

        statement.setString(1, email);

        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            pass = Integer.valueOf(rs.getString("password"));
        }

        rs.close();
        stmt.close();
        CloseDB();

        return pass;
    }

    public static List<Item> getItems(String userID) throws ClassNotFoundException, SQLException, NamingException {

        Conn();
        stmt = con.createStatement();

        PreparedStatement statement = con.prepareStatement("select * from item where userID=?");
        statement.setString(1, userID);
        ResultSet rs = statement.executeQuery();


        List<Item> list = new ArrayList<Item>();

        while (rs.next()) {
            Item a = new Item(rs.getString("date"), rs.getString("note"), rs.getString("sum"), rs.getInt("categoryID"));
            list.add(a);
        }
        rs.close();
        statement.close();
        stmt.close();
        CloseDB();
        return list;
    }

    public static List<Item> getItemsByDate(String userID, String dateFrom, String dateTo) throws ClassNotFoundException, SQLException, NamingException {

        System.out.println("Get items by date");
        Conn();
        stmt = con.createStatement();

        PreparedStatement statement = con.prepareStatement("select * from item where userID=? and date between ? and ? order by date");
        statement.setString(1, userID);
        statement.setString(2, dateFrom);
        statement.setString(3, dateTo);
        ResultSet rs = statement.executeQuery();

        System.out.println("middle");

        List<Item> list = new ArrayList<Item>();

        while (rs.next()) {
            Item a = new Item(rs.getString("date"), rs.getString("note"), rs.getString("sum"), rs.getInt("categoryID"));
            list.add(a);
        }

        for (Item i : list){
            System.out.println(i.getDate());
        }
        rs.close();
        statement.close();
        stmt.close();
        CloseDB();
        System.out.println("end get items by date");
        return list;
    }

}
