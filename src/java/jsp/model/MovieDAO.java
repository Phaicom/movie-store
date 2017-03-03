/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class MovieDAO {
    private int noOfRecords;
    
    public MovieDAO() { }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    public List<Movie> viewAllMovie(int offset,int noOfRecords){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie ORDER BY movie_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, offset);
            pstm.setInt(2, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                lm.add(m);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie viewAllMovie error: " + ex);
        }
        return lm;
    }
    
    public List<Movie> viewAllMovie(int user_id,int offset,int noOfRecords){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS m.* FROM movie m JOIN order_movie om ON m.movie_id = om.movie_id JOIN user_order uo ON uo.order_id = om.order_id \n" +
"JOIN user u ON u.user_id = uo.user_id\n" +
"WHERE u.user_id = ? AND uo.confirm_no = 1 ORDER BY uo.date_create desc limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                lm.add(m);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie viewAllMovie error: " + ex);
        }
        return lm;
    }
    
    public List<Movie> viewAllMovie(int user_id,String category,int offset,int noOfRecords){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * FROM movie m JOIN order_movie om ON m.movie_id = om.movie_id JOIN user_order uo ON uo.order_id = om.order_id\n" +
"JOIN user u ON u.user_id = uo.user_id JOIN categories c ON c.category_id = m.category_id\n" +
"WHERE u.user_id = ? AND c.name = ? AND uo.confirm_no = 1 ORDER BY uo.date_create desc limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setString(2, category);
            pstm.setInt(3, offset);
            pstm.setInt(4, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                lm.add(m);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie viewAllMovie error: " + ex);
        }
        return lm;
    }
    
    public List<Movie> viewAllMovie(String category,int offset,int noOfRecords){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie m join categories c on m.category_id = c.category_id where c.name = ? ORDER BY movie_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, category);
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                lm.add(m);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie viewAllMovie error: " + ex);
        }
        return lm;
    }
    
    public List<Movie> findByName(String name,int offset,int noOfRecords){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie WHERE lower(name) like ? ORDER BY movie_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + name.toLowerCase() + "%");
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                lm.add(m);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie findByName error: " + ex);
        }
        return lm;
    }
    
    public List<Movie> findByPrice(double p1,double p2,int offset,int noOfRecords){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie WHERE price between ? and ? ORDER BY movie_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setDouble(1, p1);
            pstm.setDouble(2, p2);
            pstm.setInt(3, offset);
            pstm.setInt(4, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                lm.add(m);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie findByPrice error: " + ex);
        }
        return lm;
    }
}
