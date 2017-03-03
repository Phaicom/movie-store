/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class wishlist {
    private int user_id;
    private int movie_id;
    private Timestamp datepost;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }
    
    public Movie getMovie(int id){
        return Movie.findById(id);
    }

    public Timestamp getDatepost() {
        return datepost;
    }

    public void setDatepost(Timestamp datepost) {
        this.datepost = datepost;
    }
    
    public static wishlist findById(int movie_id){
        wishlist w = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from wishlist where movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                w = new wishlist();
                w.setMovie_id(rs.getInt("movie_id"));
                w.setUser_id(rs.getInt("user_id"));
                w.setDatepost(rs.getTimestamp("datepost"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("wishlist findById error: " + ex);
        }
        return w;
    }
    
    public static wishlist findById(int movie_id,int user_id){
        wishlist w = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from wishlist where movie_id = ? and user_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            pstm.setInt(2, user_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                w = new wishlist();
                w.setMovie_id(rs.getInt("movie_id"));
                w.setUser_id(rs.getInt("user_id"));
                w.setDatepost(rs.getTimestamp("datepost"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("wishlist findById error: " + ex);
        }
        return w;
    }
    
    public static List<wishlist> findByIdList(int id){
        List<wishlist> lw = null;
        wishlist w = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from wishlist where user_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lw == null) {
                    lw = new ArrayList<>();
                }
                w = new wishlist();
                w.setMovie_id(rs.getInt("movie_id"));
                w.setUser_id(rs.getInt("user_id"));
                w.setDatepost(rs.getTimestamp("datepost"));
                lw.add(w);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("wishlist findById error: " + ex);
        }
        return lw;
    }
    
    public static void addWishlist(int user_id,int movie_id){
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `wishlist`(`user_id`, `movie_id`) VALUES (?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setInt(2, movie_id);
            x = pstm.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("addWishlist error: " + ex);
        }
    }
    
    public static void deleteWishlist(int user_id,int movie_id){
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "DELETE FROM `wishlist` where user_id = ? and movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setInt(2, movie_id);
            x = pstm.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("deleteWishlist error: " + ex);
        }
    }

    @Override
    public String toString() {
        return "wishlist{" + "user_id=" + user_id + ", movie_id=" + movie_id + ", datepost=" + datepost + '}';
    }
    
    
    
    public static void main(String[] args) {
//        wishlist.addWishlist(1, 1);
//        wishlist.addWishlist(1, 20);
//        wishlist.addWishlist(1, 30);
//        if (wishlist.findById(1) == null) {
//            wishlist.addWishlist(1, 1);
//        }
//        List<wishlist> lw = wishlist.findByIdList(1);
//        for(wishlist w:lw){
//            System.out.println(w.toString());
//        }
        System.out.println(wishlist.findById(1).toString());
    }
        
}
