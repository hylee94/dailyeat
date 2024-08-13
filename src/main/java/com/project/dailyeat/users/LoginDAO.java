package com.project.dailyeat.users;

import com.project.dailyeat.common.DBConnPool;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDAO {
    private DBConnPool dbConnPool;

    public LoginDAO() {
        dbConnPool = new DBConnPool();
    }

    public boolean userLogin(LoginDTO dto) {
        boolean isChecked = false;
        String query = "SELECT * FROM PROJECT.USERS WHERE id=? AND password=?";

        try {
            PreparedStatement psmt = dbConnPool.conn.prepareStatement(query);
            psmt.setString(1, dto.getId());
            psmt.setString(2, dto.getPassword());

            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                isChecked = true;
            }
            rs.close();
            psmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            dbConnPool.close();
        }
        return isChecked;
    }
}
