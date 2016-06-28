package dev.mvc.trash;
 
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.member.MemberVO;
 
@Repository("dev.mvc.blog.BlogDAO")
public class BlogDAO implements BlogInter {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
  
  public BlogDAO(){
    System.out.println("--> BlogDAO created.");
  }
  
  public BlogInter mapper(){
    BlogInter mapper = sqlSession.getMapper(BlogInter.class);    
    
    return mapper;
  }
  
  /**
   * �� ����
   */
  @Override
  public int create(BlogVO blogVO) {
    return mapper().create(blogVO);
  }
  
  @Override
  public int create2(BlogVO blogVO) {
    // TODO Auto-generated method stub
    return mapper().create2(blogVO);
  }
  
  /**
   * list
   */
  @Override
  public ArrayList<BlogVO> list() {
    return mapper().list();
  }

  @Override
  public ArrayList<BlogVO> list2(int blogcategoryno) {
    // TODO Auto-generated method stub
    return mapper().list2(blogcategoryno);
  }
  
  /**
   * read
   */
  @Override
  public BlogVO read(int blogno) {
    return mapper().read(blogno);
  }

  /**
   * update
   */
  @Override
  public int update(BlogVO blogVO) {
    // TODO Auto-generated method stub
    return mapper().update(blogVO);
  }

  /**
   * delete
   */
  @Override
  public int delete(int blogno) {
    // TODO Auto-generated method stub
    return mapper().delete(blogno);
  }

  /**
   * �˻�
   */
  @Override
  public ArrayList<BlogVO> list3(HashMap hashMap) {
    // TODO Auto-generated method stub
    return mapper().list3(hashMap);
  }

  /**
   * �˻��� ���ڵ� ����
   */
  @Override
  public int count(HashMap hashMap) {
    // TODO Auto-generated method stub
    return mapper().count(hashMap);
  }
  
/**
 * �˻� + ����¡ ��� 
 */
  @Override
  public ArrayList<BlogVO> list4(HashMap hashMap) {
    // TODO Auto-generated method stub
    return mapper().list4(hashMap);
  }

  /**
   * �亯 ��� �˻� �� ����¡ ���
   */
@Override
public ArrayList<BlogVO> list5(HashMap hashMap) {
  // TODO Auto-generated method stub
  return mapper().list5(hashMap);
}

  @Override
  public int updateAnsnum(BlogVO blogVO) {
    // TODO Auto-generated method stub
   return mapper().updateAnsnum(blogVO);
  }

  @Override
  public int reply(BlogVO blogVO) {
    // TODO Auto-generated method stub
    return mapper().reply(blogVO);
  }

  public int login(MemberVO memberVO) {
    // TODO Auto-generated method stub
    return mapper().login(memberVO);
  }


  
}