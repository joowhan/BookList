package edu.handong.csee.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import edu.handong.csee.bean.User;

public class UserDao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://db4free.net:3306/hgujoowhan", "joy9876", "bliss12**");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static int save(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into Book(title,writer,content) values(?,?,?)");
			ps.setString(1, u.getTitle());
			ps.setString(2, u.getWriter());
			ps.setString(3, u.getContent());
			//ps.setInt(4, u.getSeq());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update Book set title=?,writer=?,content=?, where seq=?");
			ps.setString(1, u.getTitle());
			ps.setString(2, u.getWriter());
			ps.setString(3, u.getContent());
			ps.setInt(4, u.getSeq());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from Book where seq=?");
			ps.setInt(1, u.getSeq());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public static List<User> getAllRecords() {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Book");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setSeq(rs.getInt("seq"));
				u.setTitle(rs.getString("title"));
				u.setWriter(rs.getString("writer"));
				u.setContent(rs.getString("content"));
				u.setCnt(rs.getInt("cnt"));
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static User getRecordById(int id) {
		User u = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Book where seq=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setSeq(rs.getInt("seq"));
				u.setTitle(rs.getString("title"));
				u.setWriter(rs.getString("writer"));
				u.setContent(rs.getString("content"));
				u.setCnt(rs.getInt("cnt"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	
}
