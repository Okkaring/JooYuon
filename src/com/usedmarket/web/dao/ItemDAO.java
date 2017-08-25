package com.usedmarket.web.dao;

import java.util.List;

import com.usedmarket.web.domain.ItemBean;

public interface ItemDAO {
	public String insertItem(ItemBean bean);
	public String countItem();		
	public List<ItemBean> selectAll(String[] rows);
}