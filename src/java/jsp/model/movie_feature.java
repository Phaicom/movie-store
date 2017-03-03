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
public class movie_feature {
    private int movie_id;
    private String pic;
    private Timestamp datepost;

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDatepost() {
        return datepost;
    }

    public void setDatepost(Timestamp datepost) {
        this.datepost = datepost;
    }
    
    public Movie getMovie(int id){
        return Movie.findById(id);
    }
    
    public boolean isSameReview(int movie_id){
        boolean result ;
        if(review.findByMovieId(movie_id)!=null){
            result = true;
        }else{
            result = false;
        }
        return  result;
    }
    
    public static movie_feature findById(int movie_id){
        movie_feature m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from movie_feature where movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                m = new movie_feature();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setPic(rs.getString("pic"));
                m.setDatepost(rs.getTimestamp("datepost"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("movie_feature findById error: " + ex);
        }
        return m;
    }
    
    public static void saveFeature(int movie_id, String pic){
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `movie_feature`(`movie_id`, `pic`) VALUES (?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            pstm.setString(2, pic);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("saveFeature error: " + ex);
        }
    }
    
    public static List<movie_feature> getShowFeature(int NoPage){
        List<movie_feature> lmf = null;
        movie_feature lm = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `movie_feature` WHERE datepost < CURRENT_TIMESTAMP order by datepost desc LIMIT 0,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, NoPage);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lmf == null) {
                    lmf = new ArrayList<>();
                }
                lm = new movie_feature();
                lm.setMovie_id(rs.getInt("movie_id"));
                lm.setPic(rs.getString("pic"));
                lm.setDatepost(rs.getTimestamp("datepost"));
                lmf.add(lm);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie recenlyMovie error: " + ex);
        }
        return lmf;
    }
    
    public static void deleteFeature(int movie_id){
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "DELETE FROM `movie_feature` where movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            x = pstm.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("deleteWishlist error: " + ex);
        }
    }

    @Override
    public String toString() {
        return "movie_feature{" + "movie_id=" + movie_id + ", pic=" + pic + ", datepost=" + datepost + '}';
    }
    
    
    
    public static void main(String[] args) {
        System.out.println(movie_feature.findById(1).toString());
    }
}
