package model;

import model.WalletService;
import model.entity.Item;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static model.WalletService.getItemsByDate;

/**
 * Created by Анастасия on 25.05.2017.
 */
public class DatesService {
    public static ArrayList<Float> getForMonth(Date d0,String id) {
        System.out.println("Get for month");
        ArrayList<Float> res = new ArrayList<Float>(7);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = d0;
        dd.setDate(dd.getDate() + 1);
        Date dt = new Date();

        while (dd.getDate() != dt.getDate()) {
            date = sdf2.format(dd);
            float sum = 0;
            List<Item> list;
            try {
                list= getItemsByDate(id,date,date);
                for (Item ii : list){
                    sum += Float.parseFloat(ii.getSum());
                }
            } catch (ClassNotFoundException e){

            } catch( SQLException e){

            }catch(NamingException e){

            }


            res.add(sum);
            dd.setHours(dd.getHours() + 24);
        }
        return res;
    }

    public static ArrayList<Float> getForDay(List<Item> items) {
        ArrayList<Float> res = new ArrayList<Float>();
        for (Item i : items) {
            res.add(Float.parseFloat(i.getSum()));
        }
        return res;
    }

    public static List<Float> getForWeek(Date d0, String id) {
        System.out.println("Get for week");
        List<Float> res = new ArrayList<Float>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = d0;

        Date dt = new Date();

        while (dd.getDate() != dt.getDate()) {
            date = sdf2.format(dd);
            float sum = 0;
            List<Item> list;
            try {
                list= WalletService.getItemsByDate(id,date,date);
                for (Item ii : list){
                    sum += Float.parseFloat(ii.getSum());
                }
            } catch (ClassNotFoundException e){

            } catch( SQLException e){

            }catch(NamingException e){

            }


            res.add(sum);
            dd.setHours(dd.getHours() + 24);
        }
        date = sdf2.format(dd);
        float sum = 0;
        List<Item> list;
        try {
            list= WalletService.getItemsByDate(id,date,date);
            for (Item ii : list){
                sum += Float.parseFloat(ii.getSum());
            }
        } catch (ClassNotFoundException e){

        } catch( SQLException e){

        }catch(NamingException e){

        }


        res.add(sum);
        return res;
    }

    public static ArrayList<Float> getForYear(Date d0, String id) {
        System.out.println("Get for month");
        ArrayList<Float> res = new ArrayList<Float>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = d0;
        //dd.setMonth(dd.getMonth() + 1);
        Date dt = new Date();

        while (dd.getMonth() != dt.getMonth()) {
            date = sdf2.format(dd);

            float sum = 0;
            List<Item> list;
            try {
                Date dto = sdf2.parse(date);
                dto.setMonth(dto.getMonth()+1);
                String dateTo = sdf2.format(dto);
                System.out.println(date + " : "+dateTo);
                list= getItemsByDate(id,date,dateTo);
                for (Item ii : list){
                    sum += Float.parseFloat(ii.getSum());
                }
            } catch (ClassNotFoundException e){

            } catch( SQLException e){

            }catch(NamingException e){

            }catch(ParseException e){

            }


            res.add(sum);
            dd.setMonth(dd.getMonth() + 1);
        }
        date = sdf2.format(dd);

        float sum = 0;
        List<Item> list;
        try {
            Date dto = sdf2.parse(date);
            dto.setMonth(dto.getMonth()+1);
            String dateTo = sdf2.format(dto);
            System.out.println(date + " : "+dateTo);
            list=WalletService.getItemsByDate(id,date,dateTo);
            for (Item ii : list){
                sum += Float.parseFloat(ii.getSum());
            }
        } catch (ClassNotFoundException e){

        } catch( SQLException e){

        }catch(NamingException e){

        }catch(ParseException e){

        }


        res.add(sum);
        dd.setMonth(dd.getMonth() + 1);
        return res;
    }

    public static ArrayList<Float> getForAll(List<Item> items) {
        ArrayList<Float> res = new ArrayList<Float>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = null;
        Date dt = null;
        try {
            dt = sdf2.parse(items.get(items.size() - 1).getDate());
        } catch (ParseException e) {
        }

        Iterator<Item> ii = items.iterator();
        Item cur;
        Item rest = null;
        while (dd.getMonth() != dt.getMonth()) {
            float sum = 0;
            if (rest != null) {
                if (sdf2.format(dd).equals(rest.getDate())) {
                    sum += Float.parseFloat(rest.getSum());
                    rest = null;
                }
            }
            while (ii.hasNext()) {
                cur = ii.next();
                if (cur.getDate().equals(sdf2.format(dd))) {
                    sum += Float.parseFloat(cur.getSum());
                } else {
                    rest = cur;
                    break;
                }
            }
            res.add(sum);
            dd.setMonth(dd.getMonth() + 1);
        }
        return res;
    }
}
