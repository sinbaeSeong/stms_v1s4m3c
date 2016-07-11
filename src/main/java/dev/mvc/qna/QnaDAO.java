package dev.mvc.qna;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.qna.QnaDAO")
public class QnaDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public QnaDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public QnaMapperInter mapper() {
    QnaMapperInter mapper = sqlSession.getMapper(QnaMapperInter.class);

    return mapper;
  }

  /**
   * trash type�� �����մϴ�.
   * 
   * @param vo
   * @return ��������
   */
  public int create(QnaVO vo) {
    return mapper().create(vo);
  }
 
  
   /**
   * �˻� + ����¡ ��� 
   */
/*    public ArrayList<TrashVO> list() {
       return mapper().list();
    }*/
    
    /**
     * READ
     * @param tno
     * @return
     */
    public QnaVO read(int qno){
      return mapper().read(qno);
    }
    
    /**
     * Update
     * @param vo
     * @return
     */
    public int update(QnaVO vo){
      return mapper().update(vo);
    }
  
    /**
     * Delete
     * @param tno
     * @return
     */
    public int delete(int qno){
      return mapper().delete(qno);
    }
    
    
    /** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<QnaVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
}




