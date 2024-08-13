package com.project.dailyeat.users;


import com.project.dailyeat.common.DBConnPool;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.ArrayList;

public class SignUpDAO extends DBConnPool {
    public SignUpDAO() {
        super();
    }

    //DB 연동코드, Connection Pool 사용
    public void getCon() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java/comp/env");
            DataSource dsc = (DataSource) envContext.lookup("jdbc/pool");
            conn = dsc.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //사용자가 입력한 데이터 DB에 추가
    public void insertUsers(SignUpDTO dto) {
        getCon();
        try {
            String query = "INSERT INTO project.users VALUES(?, ?, ?, ?)";

            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getId());
            psmt.setString(2, dto.getPassword());
            psmt.setString(3, dto.getNickname());
            psmt.setString(4, dto.getEmail());

            psmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
