import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Анастасия on 25.05.2017.
 */
public class DatesSums {
    public static ArrayList<Float> getForMonth(Date d0, List<Item> items) {
        ArrayList<Float> res = new ArrayList<Float>(7);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = null;
        Date dt = d0;
        dt.setMonth(d0.getMonth() + 1);
        Iterator<Item> ii = items.iterator();
        Item cur;
        Item rest = null;
        while (dd.getDay() != dt.getDay()) {
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

    public static ArrayList<Float> getForWeek(Date d0, List<Item> items) {
        ArrayList<Float> res = new ArrayList<Float>(7);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = null;
        Date dt = d0;
        dt.setHours(d0.getHours() + 168);
        Iterator<Item> ii = items.iterator();
        Item cur;
        Item rest = null;
        while (dd.getDay() != dt.getDay()) {
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
            dd.setHours(dd.getHours() + 24);
        }
        return res;
    }

    public static ArrayList<Float> getForYear(Date d0, List<Item> items) {
        ArrayList<Float> res = new ArrayList<Float>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = null;
        Date dt = d0;
        dt.setYear(d0.getYear() + 1);
        Iterator<Item> ii = items.iterator();
        Item cur;
        Item rest = null;
        while ((dd.getMonth() != dt.getMonth())&(dd.getYear() != dt.getYear())) {
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
    public static ArrayList<Float> getForAll( List<Item> items) {
        ArrayList<Float> res = new ArrayList<Float>();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
        Date d;
        String date;
        Date dd = null;
        Date dt = null;
        try{
            dt = sdf2.parse(items.get(items.size()-1).getDate());
        }catch (ParseException e){
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
