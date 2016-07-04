package dev.mvc.trash;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.trash.TrashDAO")
public class TrashDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public TrashDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public TrashMapperInter mapper() {
    TrashMapperInter mapper = sqlSession.getMapper(TrashMapperInter.class);

    return mapper;
  }

  /**
   * �ű� ȸ���� �����մϴ�.
   * 
   * @param vo
   * @return ��������
   */
  public int create(TrashVO vo) {
    return mapper().create(vo);
  }
}




