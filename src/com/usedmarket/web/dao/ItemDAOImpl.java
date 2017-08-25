package com.usedmarket.web.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.usedmarket.web.domain.ItemBean;

public class ItemDAOImpl implements ItemDAO{
	public static ItemDAOImpl getInstance(){return new ItemDAOImpl();}
	private ItemDAOImpl(){try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}}
	Connection conn=null;
	
	@Override
	public String insertItem(ItemBean bean) {
		String result="";
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hanbit","hanbit");
			String sql = "INSERT INTO Item(item_seq,title,writer,content,photo,regdate) VALUES(item_seq.nextval,?,?,?,'default.jpg',SYSDATE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContent());
			System.out.println("DAO/Item Insert : "+ sql);
			result = String.valueOf(pstmt.executeUpdate());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public String countItem() {
		String result="";
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hanbit","hanbit");
			Statement stmt = conn.createStatement();
			String sql = "SELECT COUNT(*) AS count FROM Item";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				System.out.println("rs´Â ÂïÈú±î? true/false: "+rs);
				result = rs.getString("count");
			}else{
				System.out.println("rs´Â NULL! true/false"+rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("db¿¡¼­ ³Ñ¾î¿Â result : " + result);
		return result;
	}
	@Override
	public List<ItemBean> selectAll(String[] rows) {
		List<ItemBean> list = new ArrayList<>();
		ItemBean bean = null;
		try {
			conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hanbit","hanbit");
			String sql= "select t2.* from (select rownum rnum , t.* from (select * from item order by item_seq desc)t)t2 where t2.rnum between ? and ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rows[0]);
			pstmt.setString(2, rows[1]);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new ItemBean();
				bean.setItemSeq(rs.getString("item_seq"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setRegdate(rs.getString("regdate"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

