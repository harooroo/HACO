package kr.co.haco.Service;

import java.util.List;

import kr.co.haco.DAO.MemberDAO;
import kr.co.haco.VO.Member;
import kr.co.haco.VO.MemberOfAcademy;
import kr.co.haco.VO.OpenCourse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//자동으로 
@Component
public class MemberServiceImpl implements MemberService {

	@Autowired
	SqlSession sqlSession;
	
	//사이트 회원 목록
	@Override
	public List<Member> getMemberOfSiteList() {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		List<Member> memberList = memberDAO.getMemberOfSite();
		return memberList;
	}
	
	//수강중인 원생 목록
	@Override
	public List<MemberOfAcademy> getMemberOfAcademyList(int center_id,int open_course_id) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		System.out.println("MemberServiceImpl:getMemberOfAcademyList실행");
		List<MemberOfAcademy> memberList = memberDAO.getMember(center_id,open_course_id);
		System.out.println("MemberServiceImpl:getMemberOfAcademyList:memberDAO.getMember(center_id,open_course_id)실행완료");
		return memberList;
	}
	
	//개설과정 목록
	@Override
	public List<OpenCourse> getCourseList(int center_id) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		OpenCourse oc = new OpenCourse();
		oc.setCenter_id(center_id);
		List<OpenCourse> courseList = memberDAO.getCourseList(oc);
		return courseList;
	}
	
	
}