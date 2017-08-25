package com.usedmarket.web.service;

import java.util.List;

import com.usedmarket.web.domain.ItemBean;

public interface ItemService {
	public String registItems(ItemBean bean);
	public String countItems();
	public List<ItemBean> list(String[] rows);
}
