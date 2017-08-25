package com.usedmarket.web.service;

import java.util.List;

import com.usedmarket.web.dao.ItemDAOImpl;
import com.usedmarket.web.domain.ItemBean;

public class ItemServiceImpl implements ItemService{
	public static ItemServiceImpl getInstance(){return new ItemServiceImpl();}
	private ItemServiceImpl(){}
	
	@Override
	public String registItems(ItemBean bean) {
		return String.valueOf(ItemDAOImpl.getInstance().insertItem(bean));
	}
	@Override
	public String countItems() {
		return String.valueOf(ItemDAOImpl.getInstance().countItem());
	}
	@Override
	public List<ItemBean> list(String[] rows) {
		return ItemDAOImpl.getInstance().selectAll(rows);
	}
}
