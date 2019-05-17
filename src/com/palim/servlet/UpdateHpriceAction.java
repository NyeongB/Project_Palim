package com.palim.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.palim.dao.HopeDataDAO;

public class UpdateHpriceAction implements Action {

   @Override
   public String execute(HttpServletRequest request) throws ServletException, IOException {
      HttpSession session = request.getSession();
      String productID = request.getParameter("productID");
      int hopePrice = Integer.parseInt(request.getParameter("hopePrice"));
      int lprice = Integer.parseInt(request.getParameter("lprice"));
      String userID = (String)session.getAttribute("userID");
      String resultString="수정실패";
      if(hopePrice>=lprice) {
         resultString="최저가보다 낮은 가격을 넣어주세요";
      } else {
         boolean result = new HopeDataDAO().updateHopePrice(""+hopePrice, productID, userID);
         if(result)
            resultString="수정성공";
      }
      request.setAttribute("result", resultString);      
            
      return "results/updateHpriceResult.jsp";
   }

}