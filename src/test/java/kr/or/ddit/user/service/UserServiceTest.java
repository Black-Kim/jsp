package kr.or.ddit.user.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.user.model.UserVo;

public class UserServiceTest {

	@Test
	public void selectAllUserTest() {
		/***Given***/
		UserServiceI userService = new UserService();

		/***When***/
		List<UserVo> userList = userService.selectAllUser();
		
		/***Then***/
		assertEquals(16, userList.size());
	}
	
	//사용자 아이디를 이용하여 특정 사용자 정보 조회
	@Test
	public void selectUserTest() {
		/***Given***/
		String userid = "brown";
		UserServiceI userService = new UserService();
		
		/***When***/
		UserVo user = userService.selectUser(userid);
		
		/***Then***/
		assertNotNull(user);
		assertEquals("브라운", user.getUsernm());
		
	}
	
	//사용자 아이디가 존재하지 않을 때 특정 사용자 조회
	@Test
	public void selectUserNotExsistTest() {
		/***Given***/
		String userid = "brownn";
		UserServiceI userService = new UserService();
		
		/***When***/
		UserVo user = userService.selectUser(userid);
		
		/***Then***/
		assertNull(user);
	}
	
//	@Test
//	public void PagingUserList() {
//		/***Given***/
//		UserServiceI userService = new UserService();
//		PageVo vo = new PageVo();
//		vo.setPage(1);
//		vo.setPageSize(5);
//		/***When***/
//		Map<String, Object>map = userService.selectPagingUser(vo);
//		List<UserVo> list = (List<UserVo>)map.get("userList");
//		
//		
//		/***Then***/
//		assertEquals(5, list.size());
//	}
	
	//사용자 페이징 조회 테스트
	@Test
	public void selectPagingUserTest() {
		/***Given***/
		UserServiceI userService = new UserService();
		PageVo vo = new PageVo(1,5);
		
		/***When***/
		//List<UserVo> pagingUser = userService.selectPagingUser(vo);
		Map<String, Object> map = userService.selectPagingUser(vo);
		List<UserVo> list = (List<UserVo>)map.get("userList");
		int userCnt = (int)map.get("userCnt");
		
		/***Then***/
		assertEquals(5, list.size());
		assertEquals(16, userCnt);
		
	}


}
