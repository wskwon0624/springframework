package com.mycompany.springframework.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mycompany.springframework.dto.Ch08CartItem;
import com.mycompany.springframework.dto.Ch08Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/ch08")
public class Ch08Controller {
	@RequestMapping("/productList")
	public String productList(Model model) {
		log.info("run");
		model.addAttribute("chNum", "ch08");
		List<Ch08Product> productList = new ArrayList<>();
		for(int i=1; i<=5; i++) {
			productList.add(new Ch08Product(i,"상품"+i, i*10000+"원"));
		}
		model.addAttribute("productList", productList);
		return "ch08/productList";
	}
	
	@RequestMapping("/productDetail")
	public String productDetail(Model model, int pno) {
		model.addAttribute("chNum", "ch08");
		Ch08Product product = new Ch08Product(pno, "상품"+pno, pno*10000 + "원");
		model.addAttribute("product", product);
		return "ch08/productDetail";
	}
	
	@RequestMapping("/cart")
	public String getcart(Model model, HttpSession session) {
		model.addAttribute("chNum", "ch08");
		List<Ch08CartItem> cartItemList = (List<Ch08CartItem>)session.getAttribute("cartItemList");
		if(cartItemList == null) {
			cartItemList = new ArrayList<Ch08CartItem>();
			session.setAttribute("cartItemList", cartItemList);
		}
		return "ch08/cart";
	}
	
	@RequestMapping("/addProduct")
	public String addProduct(int pno, int amount,HttpSession session) {
		List<Ch08CartItem> cartItemList = (List<Ch08CartItem>)session.getAttribute("cartItemList");
		if(cartItemList == null) {
			cartItemList = new ArrayList<Ch08CartItem>();
			session.setAttribute("cartItemList", cartItemList);
		}
		
		boolean isIn = false;
		for(Ch08CartItem item : cartItemList) {
			if(item.getProduct().getPno() == pno) {
				item.setAmount(item.getAmount()+amount);
				isIn = true;
			}
		}
		
		if(!isIn) {
			Ch08CartItem item =new Ch08CartItem(new Ch08Product(pno,"상품"+pno,pno*10000+"원"),amount);
			cartItemList.add(item);
		}
		
		
		return "redirect: cart";
	}
	
	
	@RequestMapping(value="/updateCartItem",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateCartItem(int pno, int amount, @SessionAttribute List<Ch08CartItem> cartItemList) {
		
		for(Ch08CartItem item : cartItemList) {
			if(item.getProduct().getPno() == pno) {
				item.setAmount(amount);
			}
		}
		
		JSONObject jo = new JSONObject();
		jo.put("result", "success");
		return jo.toString();
	}
	
	@RequestMapping("/removeCartItem")
	public String removeCartItem(@SessionAttribute List<Ch08CartItem> cartItemList, int pno) {
		Iterator<Ch08CartItem> iterator = cartItemList.iterator();
		while(iterator.hasNext()) {
			Ch08CartItem item = iterator.next();
			if(item.getProduct().getPno() == pno) {
				iterator.remove();
			}
		}
		return "redirect: cart";
	}
}
