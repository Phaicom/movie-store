/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class order_movie {

    private Movie movie;
    private int movie_id;
    private int user_id;
    private int order_id;
    private int qty;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    public Movie getMovie(order_movie om){
        return Movie.findById(om.getMovie_id());
    }
    
    public static order_movie findById(int order_id){
        order_movie om = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s  = "SELECT * FROM `order_movie` where order_id = ?" ;
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                om = new order_movie();
                om.setMovie_id(rs.getInt("movie_id"));
                om.setOrder_id(rs.getInt("order_id"));
                om.setQty(rs.getInt("qty"));
            }
            con.close();
        }catch(Exception ex){
            System.out.println("findById order_move error: "+ex);
        }
        return om;
    }
    
    public static List<order_movie> findByIdList(int order_id){
        List<order_movie> lom = null;
        order_movie om = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s  = "SELECT * FROM `order_movie` where order_id = ?" ;
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(lom ==null){
                    lom = new ArrayList<>();
                }
                om = new order_movie();
                om.setMovie_id(rs.getInt("movie_id"));
                om.setOrder_id(rs.getInt("order_id"));
                om.setQty(rs.getInt("qty"));
                lom.add(om);
            }
            con.close();
        }catch(Exception ex){
            System.out.println("findById order_move error: "+ex);
        }
        return lom;
    }

    public double getTotal() {
        double total = 0;
        try{
            total = movie.getPrice() * qty;
        }catch(Exception ex){
            System.out.println("getTotal error: " +ex);
        }
        return total;
    }

    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotal());
    }

    @Override
    public String toString() {
        return "order_movie{" + "movie=" + movie + ", movie_id=" + movie_id + ", user_id=" + user_id + ", order_id=" + order_id + ", qty=" + qty + '}';
    }
    
    public static void main(String[] args) {
        List<order_movie> lom = order_movie.findByIdList(3);
        for(order_movie om:lom){
            System.out.println(om.toString());
        }
    }
}
