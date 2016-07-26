package dev.mvc.faqcate;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.faqcate.FaqcateDAO")
public class FaqcateDAO implements FaqcateInter {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
  
  public FaqcateDAO(){
    System.out.println("--> FaqcateDAO created.");
  }
  
  public FaqcateInter mapper(){
    FaqcateInter mapper = sqlSession.getMapper(FaqcateInter.class);    
    
    return mapper;
  }

  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="BlogcateVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  @Override
  public int create(FaqcateVO vo) {
    return mapper().create(vo);
  }

  /**
   * Code, Blogcategory ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * <select id="code_blogcategory_list" resultType="Code_Blogcate_VO"> 
   * @return
   */
  @Override
  public ArrayList<Code_Faqcate_VO> code_faqcategory_list() {
    return mapper().code_faqcategory_list();
  }

  @Override
  public int countByCodeno(int codeno) {
    return mapper().countByCodeno(codeno);
  }

  @Override
  public ArrayList<Code_Faqcate_VO> list() {
    return mapper().list();
  }

  @Override
  public FaqcateVO read(int cateno) {
    return mapper().read(cateno);
  }

  @Override
  public int update(FaqcateVO vo) {
    return mapper().update(vo);
  }

  @Override
  public int delete(int cateno) {
    return mapper().delete(cateno);
  }
  
  /**
   * �Ѱ��� ���ڵ��� �켱 ������ �����Դϴ�.
   * <update id="up" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return ����� ���ڵ� ����
   */
  @Override
  public int up(FaqcateVO vo) {
    return mapper().up(vo);
  }

  /**
   * �Ѱ��� ���ڵ��� �켱 ������ ����ϴ�.
   * <update id="down" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return ����� ���ڵ� ����
   */
  @Override
  public int down(FaqcateVO vo) {
    return mapper().down(vo);
  }

  @Override
  public int increaseCnt(int cateno) {
    return mapper().increaseCnt(cateno);
  }

  @Override
  public int decreaseCnt(int cateno) {
    return mapper().decreaseCnt(cateno);
  }
}


