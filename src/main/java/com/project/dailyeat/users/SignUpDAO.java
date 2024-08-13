package com.project.dailyeat.users;


import com.project.dailyeat.common.DBConnPool;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.PreparedStatement;

public class SignUpDAO extends DBConnPool {

    //사용자가 입력한 데이터 DB에 추가
    public int insertUsers(SignUpDTO dto) {
        int result = 0;
        String query = "INSERT INTO project.users VALUES(?, ?, ?, ?)";


        try (PreparedStatement psmt = conn.prepareStatement(query)){
            psmt.setString(1, dto.getId());
            psmt.setString(2, dto.getPassword());
            psmt.setString(3, dto.getNickname());
            psmt.setString(4, dto.getEmail());
            result = psmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
