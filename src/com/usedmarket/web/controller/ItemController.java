package com.usedmarket.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.usedmarket.web.domain.ItemBean;
import com.usedmarket.web.service.ItemService;
import com.usedmarket.web.service.ItemServiceImpl;


@WebServlet("/item.action")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("***Item Controller service ����");
    	RequestDispatcher rd= null;
    	String cmd=request.getParameter("cmd");
    	System.out.println("Controller�� ���� cmd ����? "+cmd);
    	ItemService service = ItemServiceImpl.getInstance();
    	ItemBean bean = new ItemBean();
    	switch(cmd){
    	case "add":
    		System.out.println("***Item Controller: add ����");
/*    		bean.setTitle(request.getParameter("title"));
    		bean.setWriter(request.getParameter("writer"));
    		bean.setContent(request.getParameter("content"));
    		String[] category = request.getParameterValues("category");*/
    		
    		Map<String,String[]> map = request.getParameterMap();
    		if(map==null){
    			System.out.println("���� ��");
    		}else{
    			System.out.println("���� ���� �ƴϴ�!");
    		}
    		
    		Map<String,String> result1 = new HashMap<>();
    		
    		Set<Entry<String,String[]>> set = map.entrySet();
    		Iterator<Map.Entry<String, String[]>> it = set.iterator();
   
    		String params[] = new String[set.size()];
    		System.out.println("set size:::"+ set.size());
    		
    		int i=0;
    		while (it.hasNext()) {
    			Map.Entry<String, String[]> e = it.next();
    			params[i] = e.getKey();
    			i++;
    		}
    		for(i=0 ; i < params.length ; i++){
    			if(map.get(params[i]).length == 1){
    				System.out.println("===="+map.get(params[i])[0]);
    				result1.put(params[i], map.get(params[i])[0]);
    			}else{
    				String temp="";
    				for(int j=0;j<map.get(params[i]).length;j++){
    					System.out.println("$$$$�߰� subject"+map.get(params[i])[j]);
    					temp+=map.get(params[i])[j]+",";
    				}
    				result1.put(params[i], temp);
    			}
    		}
    		
    		
    		String result=service.registItems(bean);
        	response.sendRedirect(request.getContextPath()+"/item.action?cmd=list");
    		break;
    	case "register":
    		System.out.println("***Item Controller: register ����");
    		rd = request.getRequestDispatcher("WEB-INF/view/item/register.jsp");
        	rd.forward(request, response);
    		break;
    	case "list":
        	System.out.println("***Item Controller: list ����");
        	String pageNumber= request.getParameter("pageNumber")==null?"1":request.getParameter("pageNumber");
    		System.out.println("***pageNumber��?: " + pageNumber);
    		
    		String startRow = String.valueOf(1+ (Integer.parseInt(pageNumber)-1)*5);
    		String endRow = String.valueOf(Integer.parseInt(pageNumber)*5);
    		System.out.println("startRow: "+ startRow +"/ endRow: "+ endRow);
    		String[] rows = new String[2];
  			rows[0] = startRow;
    		rows[1] = endRow;
    		
        	String count = service.countItems();
    		System.out.println("����� ��Ʈ�ѷ�: " + count);
    		List<ItemBean> list = service.list(rows);
    		System.out.println("db���� ������ list : "+list);
    		
    		int totalPages, startPage, endPage, prevBlock, nextBlock =0;
    		totalPages = Integer.parseInt(count) % 5 == 0 ? Integer.parseInt(count)/5:Integer.parseInt(count)/5+1;
    		System.out.println("��Ż �������� : "+ totalPages);
    		
    		startPage = Integer.parseInt(pageNumber)-(Integer.parseInt(pageNumber)-1) % 5;
    		System.out.println("��ŸƮ ������ : "+ startPage);
    		
    		endPage = startPage + 5 - 1 <= totalPages? startPage + 5 - 1 : totalPages;
    		System.out.println("���� ������ : "+ endPage);

    		prevBlock =startPage-totalPages/5;
    		System.out.println("prevBlock : " + prevBlock);
    		
    		nextBlock = startPage+totalPages/5;
    		System.out.println("nextBlock : " + nextBlock);
    		
    		request.setAttribute("count", count);
    		request.setAttribute("list", list);
    		request.setAttribute("startPage", startPage);
    		request.setAttribute("endPage", endPage);
    		request.setAttribute("totalPages", totalPages);
    		request.setAttribute("prevBlock", prevBlock);
    		request.setAttribute("nextBlock", nextBlock);
    		
    		rd = request.getRequestDispatcher("WEB-INF/view/common/list.jsp");
    		rd.forward(request, response);
    		break;
    	case "detail":
    		System.out.println("***Item Controller: detail ����");
        	rd = request.getRequestDispatcher("WEB-INF/view/item/detail.jsp");
        	rd.forward(request, response);
        	break;
    	case "update":
    		System.out.println("***Item Controller: update ����");
        	rd = request.getRequestDispatcher("WEB-INF/view/item/update.jsp");
        	rd.forward(request, response);
    		break;
    	case "delete":
    		System.out.println("***Item Controller: delete ����");
        	rd = request.getRequestDispatcher("WEB-INF/view/item/list.jsp");
        	rd.forward(request, response);
    		break;
    	}
    }
}
