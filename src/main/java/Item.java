/**
 * Created by Анастасия on 15.04.2017.
 */
public class Item {
    String date;
    int category;
    public String note;
    String sum;

    public Item(String date, String note, String sum, int category) {
        this.date = date;
        this.category = category;
        this.note = note;
        this.sum = sum;
    }

    public String getNote() {
        return note;
    }

    public String getDate() {
        return date;
    }

    public String getSum() {
        return sum;
    }

    public int getCategory() {
        return category;
    }
}
