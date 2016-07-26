package dev.mvc.faqcate;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.faqcate.FaqcateDAO")
public class FaqcateDAO implements FaqcateInter {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체
  
  public FaqcateDAO(){
    System.out.println("--> FaqcateDAO created.");
  }
  
  public FaqcateInter mapper(){
    FaqcateInter mapper = sqlSession.getMapper(FaqcateInter.class);    
    
    return mapper;
  }

  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="BlogcateVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  @Override
  public int create(FaqcateVO vo) {
    return mapper().create(vo);
  }

  /**
   * Code, Blogcategory 테이블을 구룹별로 분류하여 가져옵니다.
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
   * 한건의 레코드의 우선 순위를 높임입니다.
   * <update id="up" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return 변경된 레코드 갯수
   */
  @Override
  public int up(FaqcateVO vo) {
    return mapper().up(vo);
  }

  /**
   * 한건의 레코드의 우선 순위를 낮춥니다.
   * <update id="down" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return 변경된 레코드 갯수
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


