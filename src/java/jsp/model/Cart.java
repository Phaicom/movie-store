/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class Cart {

    private List<order_movie> list;

    public Cart() {
        this.list = new ArrayList<>();
    }

    public List<order_movie> getList() {
        return list;
    }

    public void setList(List<order_movie> list) {
        this.list = list;
    }

    public int getCount() {
        return list.size();
    }

    public double getTotalPrice() {
        double d = 0;
        try {
            for (int i = 0; i < list.size(); i++) {
                d += list.get(i).getTotal();
            }
        } catch (Exception ex) {

        }
        return d;
    }
    
    public String getCartCurrencyFormat(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotalPrice());
    }

    public void addMovie(order_movie order) {
        int movie_id = order.getMovie_id();
        int qty = order.getQty();
        try {
            for (int i = 0; i < list.size(); i++) {
                order_movie om = list.get(i);
                if (om.getMovie_id() == movie_id) {
                    om.setQty(qty);
                    return;
                }
            }
            list.add(order);
        } catch (Exception ex) {
            System.out.println("addMovie error: " + ex);
        }
    }

    public void removeItem(order_movie order) {
        int movie_id = order.getMovie_id();
        try {
            for (int i = 0; i < list.size(); i++) {
                order_movie om = list.get(i);
                if (om.getMovie_id() == movie_id) {
                    list.remove(i);
                    return;
                }
            }
        } catch (Exception ex) {
            System.out.println("removeItem error: " + ex);
        }
    }
    
    public boolean isOrder(int movie_id) {
        boolean out = false;
        try {
            for (int i = 0; i < list.size(); i++) {
                order_movie om = list.get(i);
                if (om.getMovie_id() == movie_id) {
                    out = true;
                }
            }
        } catch (Exception ex) {
            System.out.println("removeItem error: " + ex);
        }
        return out;
    }
    
//    public boolean isOrder(order_movie order) {
//        int movie_id = order.getMovie_id();
//        boolean out = false;
//        try {
//            for (int i = 0; i < list.size(); i++) {
//                order_movie om = list.get(i);
//                if (om.getMovie_id() == movie_id) {
//                    out = true;
//                }
//            }
//        } catch (Exception ex) {
//            System.out.println("removeItem error: " + ex);
//        }
//        return out;
//    }
    
//    public boolean isSame(Movie m){
//        boolean out = false;
//        try{
//            for (int i = 0; i < list.size(); i++) {
//                order_movie om = list.get(i);
//                if (om.getMovie_id() == m.getMovie_id()) {
//                    out = true;
//                }
//            }
//        }catch(Exception ex){
//            System.out.println("isSame error: "+ex);
//        }
//        return out;
//    }
}
