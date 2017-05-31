package controller.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Анастасия on 31.05.2017.
 */
public class Labels {
    public static List<String> processLabelsForDay(int n) {
        List<String> res = new ArrayList<String>();
        for (int i = 0; i < n; i++) {
            res.add(Integer.valueOf(i + 1).toString());
        }
        return res;
    }

    public static List<String> processLabelsForWeek(Date from) {
        List<String> res = new ArrayList<String>();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
        String date = sdf2.format(from);
        for (int i = 0; i < 7; i++) {
            date = sdf2.format(from);
            res.add(date);
            from.setDate(from.getDate() + 1);
        }
        return res;
    }

    public static List<String> processLabelsForMonth(Date from) {
        System.out.println("start process");
        List<String> res = new ArrayList<String>();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
        Date to = new Date();
        String date = sdf2.format(from);
        System.out.println("labels month from " + from+" : "+to);
        while (from.getDate() != to.getDate()) {
            date = sdf2.format(from);
            res.add(date);
            from.setDate(from.getDate() + 1);
        }
        date = sdf2.format(from);
        res.add(date);

        return res;
    }

    public static List<String> processLabelsForYear(Date from) {
        List<String> res = new ArrayList<String>();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
        Date to = new Date();
        String date = sdf2.format(from);
        while (from.getMonth() != to.getMonth()) {
            date = from.toString().split(" ")[1];
            res.add(date);
            from.setMonth(from.getMonth() + 1);
        }
        date = from.toString().split(" ")[1];
        res.add(date);

        return res;
    }
}
