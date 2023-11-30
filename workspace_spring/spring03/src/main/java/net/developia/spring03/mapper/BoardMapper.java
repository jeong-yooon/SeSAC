package net.developia.spring03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.developia.spring03.domain.BoardVO;
import net.developia.spring03.domain.Criteria;

public interface BoardMapper {
	//@Select("SELECT * FROM tbl_board WHERE bno > 0")
	public List<BoardVO> getList();

	//public List<BoardVO> getListWithPaging(Criteria cri);
	
	
	public BoardVO read(Long bno);
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public int delete(Long bno);
	public int update(BoardVO board);
	
	
	
	/*



	

	
	public int getTotalCount(Criteria cri);
	 */
	
}