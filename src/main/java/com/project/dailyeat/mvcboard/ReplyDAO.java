package com.project.dailyeat.mvcboard;

import com.project.dailyeat.common.DBConnPool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDAO extends DBConnPool {


    //댓글 추가
    public int insertReply(ReplyDTO dto) {
        int result = 0;

        try {
        // SQL 쿼리 준비
            String query = "INSERT INTO project.reply (boardnum, id , content, rdate, replynum) " +
                    "VALUES (?, ?, ?, SYSDATE, SEQ_REPLY_BNUM.NEXTVAL)";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, dto.getBoardnum());
            psmt.setString(2, dto.getId());
            psmt.setString(3, dto.getContent());


            // 쿼리 실행 및 결과저장
            result = psmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;


    }
    // 댓글 목록 조회
    public List<ReplyDTO> selectReplies(int boardnum) {
        List<ReplyDTO> replyList = new ArrayList<>();

        try {
            // SQL 쿼리 준비
            String query = "SELECT * FROM project.reply WHERE boardnum = ? ORDER BY rdate DESC";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, boardnum);
            rs = psmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                ReplyDTO dto = new ReplyDTO();
                dto.setBoardnum(rs.getInt("boardnum"));
                dto.setId(rs.getString("id"));
                dto.setContent(rs.getString("content"));
                dto.setRdate(rs.getDate("rdate"));
                dto.setReplynum(rs.getInt("replynum"));
                replyList.add(dto);
            }

            // 디버깅: 댓글 리스트 크기 출력
            System.out.println("조회된 댓글 개수: " + replyList.size());

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return replyList;

    }
    // 댓글 삭제
    public int deleteReply(int boardnum, String id) {
        int result = 0;
        try {
            // SQL 쿼리 준비
            String query = "DELETE FROM project.reply WHERE boardnum = ? AND id = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, boardnum);
            psmt.setString(2, id);

            // 쿼리 실행 및 결과 저장
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}