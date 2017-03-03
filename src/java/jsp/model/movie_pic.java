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
public class movie_pic {
    private int pic_id;
    private String pic;
    private int movie_id;

    public int getPic_id() {
        return pic_id;
    }

    public void setPic_id(int pic_id) {
        this.pic_id = pic_id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }
    
    public static List<movie_pic> getAllImage(int id){
        List<movie_pic> mp_list = null;
        movie_pic mp = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s  = "SELECT mp.* FROM `movie_pic` mp JOIN movie m on m.movie_id = mp.movie_id WHERE m.movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(mp_list == null){
                    mp_list = new ArrayList<>();
                }
                mp = new movie_pic();
                mp.setMovie_id(rs.getInt("movie_id"));
                mp.setPic_id(rs.getInt("pic_id"));
                mp.setPic(rs.getString("pic"));
                mp_list.add(mp);
            }
            con.close();
        }catch(Exception ex){
            System.out.println("getAllImage error: "+ex);
        }
        return mp_list;
    }

    @Override
    public String toString() {
        return "movie_pic{" + "pic_id=" + pic_id + ", pic=" + pic + ", movie_id=" + movie_id + '}';
    }
    
    
    
}
