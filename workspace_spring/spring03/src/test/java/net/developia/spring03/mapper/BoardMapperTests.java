package net.developia.spring03.mapper;


import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.developia.spring03.domain.BoardVO;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:**/*-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper
			.getList()
			.forEach(board -> {
				log.info(board);
			});
		for(BoardVO boardVO:mapper.getList()) {
			log.info(boardVO.getContent());
		}
	}
	
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(5L);
		log.info(board);
	}
	
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("그대에게");
		board.setContent("숨가쁘게 살아가는 순간 속에도");
		board.setWriter("신해철신해철신해철신해철신해철신");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("난 알아요2");
		board.setContent("이 밤이 흐르고 흐르면2");
		board.setWriter("서태지2");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
	}

	@Test
	public void testDelete() {
		int count = mapper.delete(3L);
		log.info("DELETE COUNT : " + count);
		if (count == 0) fail("쿼리는 정상 수행되었으나 해당하는 게시물이 없음.");
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setTitle("수정된 제목입니다");
		board.setContent("수정된 내용입니다");
		board.setWriter("정현철");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	
	/*	



	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getBno()));
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("새로");
		cri.setType("W");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	*/
}
