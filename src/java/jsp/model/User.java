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
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class User {

    private int user_id;
    private String fname;
    private String lname;
    private String addressline1;
    private String addressline2;
    private String phone;
    private String email;
    private String DOB;
    private String username;
    private String password;
    private String gender;
    private String city;
    private String state;
    private String zip;
    private int role;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAddressline1() {
        return addressline1;
    }

    public void setAddressline1(String addressline1) {
        this.addressline1 = addressline1;
    }

    public String getAddressline2() {
        return addressline2;
    }

    public void setAddressline2(String addressline2) {
        this.addressline2 = addressline2;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public static User findByOrderId(int order_id) {
        User u = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM user u join user_order o ON u.user_id = o.user_id WHERE o.order_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setAddressline1(rs.getString("addressline1"));
                u.setAddressline2(rs.getString("addressline2"));
                u.setCity(rs.getString("city"));
                u.setDOB(rs.getString("DOB"));
                u.setEmail(rs.getString("email"));
                u.setFname(rs.getString("fname"));
                u.setLname(rs.getString("lname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setState(rs.getString("state"));
                u.setUser_id(rs.getInt("user_id"));
                u.setZip(rs.getString("zip"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getInt("role"));
            }
        } catch (Exception ex) {
            System.out.println("findByUsername Error: " + ex);
        }
        return u;
    }

    public static User findByUsername(String uname) {
        User u = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from user where username like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, uname);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setAddressline1(rs.getString("addressline1"));
                u.setAddressline2(rs.getString("addressline2"));
                u.setCity(rs.getString("city"));
                u.setDOB(rs.getString("DOB"));
                u.setEmail(rs.getString("email"));
                u.setFname(rs.getString("fname"));
                u.setLname(rs.getString("lname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setState(rs.getString("state"));
                u.setUser_id(rs.getInt("user_id"));
                u.setZip(rs.getString("zip"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getInt("role"));
            }
        } catch (Exception ex) {
            System.out.println("findByUsername Error: " + ex);
        }
        return u;
    }

    public static List<User> findByName(String name) {
        List<User> lu = null;
        User u = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from user where lower(username) like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + name.toLowerCase() + "%");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lu == null) {
                    lu = new ArrayList<>();
                }
                u = new User();
                u.setAddressline1(rs.getString("addressline1"));
                u.setAddressline2(rs.getString("addressline2"));
                u.setCity(rs.getString("city"));
                u.setDOB(rs.getString("DOB"));
                u.setEmail(rs.getString("email"));
                u.setFname(rs.getString("fname"));
                u.setLname(rs.getString("lname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setState(rs.getString("state"));
                u.setUser_id(rs.getInt("user_id"));
                u.setZip(rs.getString("zip"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getInt("role"));
                lu.add(u);
            }
        } catch (Exception ex) {
            System.out.println("findById Error: " + ex);
        }
        return lu;
    }

    public static User findById(int id) {
        User u = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from user where user_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setAddressline1(rs.getString("addressline1"));
                u.setAddressline2(rs.getString("addressline2"));
                u.setCity(rs.getString("city"));
                u.setDOB(rs.getString("DOB"));
                u.setEmail(rs.getString("email"));
                u.setFname(rs.getString("fname"));
                u.setLname(rs.getString("lname"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setState(rs.getString("state"));
                u.setUser_id(rs.getInt("user_id"));
                u.setZip(rs.getString("zip"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getInt("role"));
            }
        } catch (Exception ex) {
            System.out.println("findById Error: " + ex);
        }
        return u;
    }

    public static void registerUser(String fname, String lname, String addressline1, String addressline2, String phone, String email, String DOB, String username, String password, String gender, String city, String state, String zip) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `user`(`fname`, `lname`, `gender`, `DOB`, `phone`, `email`, `addressline1`, `addressline2`, `city`, `state`, `zip`, `username`, `password`, `regdate`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, fname);
            pstm.setString(2, lname);
            pstm.setString(3, gender);
            /*
             java.text.SimpleDateFormat sdf
             = new java.text.SimpleDateFormat("yyyy-MM-dd");

             String storeDate = sdf.format(DOB);
             pstm.setString(4, storeDate);*/
            pstm.setString(4, DOB);
            pstm.setString(5, phone);
            pstm.setString(6, email);
            pstm.setString(7, addressline1);
            pstm.setString(8, addressline2);
            pstm.setString(9, city);
            pstm.setString(10, state);
            pstm.setString(11, zip);
            pstm.setString(12, username);
            pstm.setString(13, password);
            pstm.setDate(14, new java.sql.Date(new java.util.Date().getTime()));
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("registerUser error: " + ex);
        }
    }

    public static void updateUser(int id, String fname, String lname, String addressline1, String addressline2, String phone, String email, String DOB, String gender, String city, String state, String zip) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `user` SET `fname`=?,`lname`=?,`gender`=?,`DOB`=?,`phone`=?,`email`=?,`addressline1`=?,`addressline2`=?,`city`=?,`state`=?,`zip`=? WHERE user_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, fname);
            pstm.setString(2, lname);
            pstm.setString(3, gender);
            /*
             java.text.SimpleDateFormat sdf
             = new java.text.SimpleDateFormat("yyyy-MM-dd");

             String storeDate = sdf.format(DOB);
             pstm.setString(4, storeDate);*/
            pstm.setString(4, DOB);
            pstm.setString(5, phone);
            pstm.setString(6, email);
            pstm.setString(7, addressline1);
            pstm.setString(8, addressline2);
            pstm.setString(9, city);
            pstm.setString(10, state);
            pstm.setString(11, zip);
            pstm.setInt(12, id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("updateUser error: " + ex);
        }
    }

    public static void updatePassword(int id, String password) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `user` SET `password`=? WHERE user_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, password);
            pstm.setInt(2, id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("updatePassword error: " + ex);
        }
    }

    public static String[] userToStringArray(User u) {
        String[] s = new String[12];
        try {
            s[0] = u.getFname();
            s[1] = u.getLname();
            s[2] = u.getAddressline1();
            s[3] = u.getAddressline2();
            s[4] = u.getPhone();
            s[5] = u.getEmail();
            s[6] = u.getDOB();
            s[7] = u.getGender();
            s[8] = u.getCity();
            s[9] = u.getState();
            s[10] = u.getZip();
            s[11] = String.valueOf(u.getUser_id());
        } catch (Exception ex) {
            System.out.println("userToStringArray error: " + ex);
        }
        return s;
    }

    public static User stringArrayToUser(String[] s) {
        User u = null;
        try {
            u = new User();
            u.setFname(s[0]);
            u.setLname(s[1]);
            u.setAddressline1(s[2]);
            u.setAddressline2(s[3]);
            u.setPhone(s[4]);
            u.setEmail(s[5]);
            u.setDOB(s[6]);
            u.setGender(s[7]);
            u.setCity(s[8]);
            u.setState(s[9]);
            u.setZip(s[10]);
            u.setUser_id(Integer.parseInt(s[11]));
        } catch (Exception ex) {
            System.out.println("userToStringArray error: " + ex);
        }
        return u;
    }

    public static User checkFormUpdateProfile(int user_id, String fname, String lname, String addressline1, String addressline2, String phone, String email, String DOB, String gender, String city, String state, String zip) {
        User u = null;
        try {
            u = new User();
            u = User.findById(user_id);

            String inputArray[] = {fname, lname, addressline1,
                addressline2, phone, email, DOB, gender,
                city, state, zip, String.valueOf(user_id)};

            String getArrayUser[] = User.userToStringArray(u);
            for (int i = 0; i < inputArray.length; i++) {
                if (inputArray[i].equals("")) {
                    inputArray[i] = getArrayUser[i];
                }
            }
            u = User.stringArrayToUser(inputArray);
        } catch (Exception ex) {
            System.out.println("checkFormUpdateProfile error: " + ex);
        }
        return u;
    }

    public static boolean isBuy(int user_id, int movie_id) {
        boolean out = false;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT om.* FROM order_movie om JOIN user_order uo ON om.order_id = uo.order_id WHERE uo.user_id = ? AND uo.confirm_no = 1 AND om.movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setInt(2, movie_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                out = true;
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("isBuy error: " + ex);
        }
        return out;
    }

    public List<Movie> myMovie(int user_id) {
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT m.* FROM movie m JOIN order_movie om ON m.movie_id = om.movie_id JOIN user_order uo ON uo.order_id = om.order_id \n"
                    + "JOIN user u ON u.user_id = uo.user_id\n"
                    + "WHERE u.user_id = ? ORDER BY uo.date_create desc";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                m.setTrailer((rs.getString("trailer")));
                m.setCategory_id(rs.getInt("category_id"));
                lm.add(m);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("myMovie error: " + ex);
        }
        return lm;
    }

    public int[] totalUserByMonth(int count) {
        List<User> lu = null;
        User u = null;
        int[] out = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            PreparedStatement pstm;
            Calendar now = Calendar.getInstance();
            int month;
            int year;
            int loop = 0;
            for (int i = count; i >= 1; i--) {
                if (out == null) {
                    out = new int[count];
                }
                String s = "SELECT * FROM `user` WHERE MONTH(regdate) = ? and YEAR(regdate) = ?";
                pstm = con.prepareStatement(s);
                month = (now.get(Calendar.MONTH) + 2) - i;
                year = now.get(Calendar.YEAR) - 543;
                pstm.setInt(1, month);
                pstm.setInt(2, year);
                ResultSet rs = pstm.executeQuery();

                if (lu == null) {
                    lu = new ArrayList<>();
                }
                while (rs.next()) {
                    u = new User();
                    u.setAddressline1(rs.getString("addressline1"));
                    u.setAddressline2(rs.getString("addressline2"));
                    u.setCity(rs.getString("city"));
                    u.setDOB(rs.getString("DOB"));
                    u.setEmail(rs.getString("email"));
                    u.setFname(rs.getString("fname"));
                    u.setLname(rs.getString("lname"));
                    u.setGender(rs.getString("gender"));
                    u.setPhone(rs.getString("phone"));
                    u.setState(rs.getString("state"));
                    u.setUser_id(rs.getInt("user_id"));
                    u.setZip(rs.getString("zip"));
                    u.setUsername(rs.getString("username"));
                    u.setPassword(rs.getString("password"));
                    u.setRole(rs.getInt("role"));
                    lu.add(u);
                }
                out[loop] = lu.size();
                loop++;
                lu = new ArrayList<>();
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("totalUserByMonth error: " + ex);
        }
        return out;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", fname=" + fname + ", lname=" + lname + ", addressline1=" + addressline1 + ", addressline2=" + addressline2 + ", phone=" + phone + ", email=" + email + ", DOB=" + DOB + ", username=" + username + ", password=" + password + ", gender=" + gender + ", city=" + city + ", state=" + state + ", zip=" + zip + ", role=" + role + '}';
    }

    public static void main(String[] args) {
        System.out.println(wishlist.findByIdList(1).size());
    }

}
