package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.FaqVO;


public interface FaqMapper {
	public int update(FaqVO faq);
	public int delete(Long faqno);
	public FaqVO read(Long faqno);
	public Integer insertSelectKey(FaqVO faq);
	public List<FaqVO> getList();
	public int getTotalCount(Criteria cri);
	public List<FaqVO> getListWithPaging(Criteria cri);
}
