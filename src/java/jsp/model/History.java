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
public class History {
    private int history_id;
    private int movie_id;
    private int user_id;
    private Timestamp dateview;

    public int getHistory_id() {
        return history_id;
    }

    public void setHistory_id(int history_id) {
        this.history_id = history_id;
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

    public Timestamp getDateview() {
        return dateview;
    }

    public void setDateview(Timestamp dateview) {
        this.dateview = dateview;
    }
    
    public Movie getMovie(int id){
        return Movie.findById(id);
    }
    
    public static History findById(int movie_id){
        History h = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `history` WHERE movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                h = new History();
                h.setHistory_id(rs.getInt("history_id"));
                h.setMovie_id(rs.getInt("movie_id"));
                h.setUser_id(rs.getInt("user_id"));
                h.setDateview(rs.getTimestamp("dateview"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("saveHistory error: " + ex);
        }
        return h;
    }
    
    public static List<History> findByIdList(int user_id){
        List<History> lh = null;
        History h = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `history` WHERE  user_id = ? order by history_id desc";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(lh == null){
                    lh = new ArrayList<>();
                }
                h = new History();
                h.setHistory_id(rs.getInt("history_id"));
                h.setMovie_id(rs.getInt("movie_id"));
                h.setUser_id(rs.getInt("user_id"));
                h.setDateview(rs.getTimestamp("dateview"));
                lh.add(h);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("saveHistory error: " + ex);
        }
        return lh;
    }
    
    public static void saveHistory(int movie_id, int user_id){
        int x;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `history`(`movie_id`, `user_id`, `dateview`) VALUES (?,?,?) ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            pstm.setInt(2, user_id);
            pstm.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("saveHistory error: " + ex);
        }
    }
    
    public static void deleteHistory(int user_id){
        int x;
        int max = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String max_query = "select max(history_id)-3 as history_id from history WHERE user_id = ? ";
            PreparedStatement pstm = con.prepareStatement(max_query);
            pstm.setInt(1, user_id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                max = rs.getInt("history_id");
            }
            rs.close();
            
            String s = "DELETE FROM `history` WHERE user_id = ? and history_id <= "+max;
            pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("deleteHistory error: " + ex);
        }
    }
    
    public static void deleteById(int history_id){
        int x;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "DELETE FROM `history` WHERE history_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, history_id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("deleteById error: " + ex);
        }
    }

    @Override
    public String toString() {
        return "History{" + "history_id=" + history_id + ", movie_id=" + movie_id + ", user_id=" + user_id + ", dateview=" + dateview + '}';
    }
    
    
    
    public static void main(String[] args) {
//        if(History.findById(1)==null){
//            History.saveHistory(1, 1);
//        }
//        History.deleteHistory(1);
        List<History> lh = History.findByIdList(1);
        for(History h: lh){
            System.out.println(h.toString());
        }
    }
}
