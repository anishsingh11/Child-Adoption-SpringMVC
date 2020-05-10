package com.anish.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.anish.dao.AdoptionRecordDAO;
import com.anish.dao.ChildDAO;
import com.anish.dao.UserDAO;
import com.anish.pojo.Adopter;
import com.anish.pojo.AdoptionRecord;
import com.anish.pojo.Child;

@Controller
//@RequestMapping("/adoption/*")

public class AdopterController {
	
	@Autowired
	@Qualifier("childDAO")
	ChildDAO childDAO;
	
	@Autowired
	@Qualifier("adoptionRecordDAO")
	AdoptionRecordDAO adoptionDAO;
	
	@Autowired
	@Qualifier("userDAO")
	UserDAO userDAO;
	
	@RequestMapping(value="/adopter/dashboard",method = RequestMethod.GET)
	public ModelAndView getAdoptionDashboard( ) throws Exception{
		return new ModelAndView("adopter_dashboard");
	}
	
	@RequestMapping(value="/adopter/adoptionList",method = RequestMethod.GET)
	public ModelAndView getAdoptionList( HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			mv.setViewName("adopter_adoptionlist");
			mv.addObject("adoptionList", childDAO.getAdopterChildAdoptionList());
			session.setAttribute("adoptionList", childDAO.getAdopterChildAdoptionList());
			
		}
		catch(Exception e){
			System.out.println("AdopterController - getAdoptionList");
		}
		return mv;
	}
	
	@RequestMapping(value="/adopter/adoptionList", method=RequestMethod.POST)
	public ModelAndView postAdoptionList( HttpServletRequest request, @RequestParam ("childSelected") String childIndex) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			
			List<Child> childList = childDAO.getAdopterChildAdoptionList();
			Child child = childList.get(Integer.parseInt(childIndex));
			session.setAttribute("childSelected", child);
			mv.addObject("childSelected", child);
			mv.setViewName("adopter_childDetail");
		}
		catch (Exception e)	{
			System.out.println("AdopterController - postAdoptionList");
		}
		return mv;
		
	}
	
	@RequestMapping(value="/adopter/childDetail", method = RequestMethod.GET)
	public ModelAndView getChildDetail( HttpServletRequest request, @RequestParam ("childViewed") long childid) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			mv.setViewName("adopter_childDetail");
			Child child = childDAO.getChildById(childid);
			System.out.println("getChildDetail: " + child.getChildId());
			session.setAttribute("childViewed", child);
			mv.addObject("childViewed", child);
		}
		catch(Exception e) {
			System.out.println(e);
			mv.setViewName("error");
		}
		return mv;
		
	}
	
	@RequestMapping(value="/adopter/childDetail", method = RequestMethod.POST)
	public ModelAndView postChildDetail( HttpServletRequest request ) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		
		try{
			Adopter adopter = (Adopter) session.getAttribute("user");
			Child child = (Child) session.getAttribute("childViewed");
			AdoptionRecord record = new AdoptionRecord();
			System.out.println(adopter.getEmail());
			
			record.setAdopter(adopter);
			record.setAdopterEmail(adopter.getEmail());
			record.setChild(child);
			record.setChildId(child.getChildId());
			System.out.println(record.getChildId());
			
			record.setStatus("pending");
			record.getChild().setStatus("pending");
			
			Calendar c = Calendar.getInstance();
                        int year = c.get(Calendar.YEAR); 
                        int month = c.get(Calendar.MONTH); 
                        int date = c.get(Calendar.DATE);
			record.setDate(month+1, date, year);
			
			adoptionDAO.addAdoptionRecord(record);
			
			record.getChild().setStatus("treated");
			childDAO.updateChild(record.getChild().getChildId(), "pending");
			
			mv.setViewName("adopter_myAdoptionHistory");
			List<AdoptionRecord> myAdoptions = adoptionDAO.getAdoptionRecordListByAdopter(adopter);
			
			for(AdoptionRecord ar: myAdoptions) {
				ar.setAdopter(adopter);
				ar.setChild(childDAO.getChildById(ar.getChildId()));
			}
			session.setAttribute("myAdoptions", myAdoptions);
			session.setAttribute("adoptionList", childDAO.getAdopterChildAdoptionList());
		}
		catch(Exception e){
			System.out.println("AdopterController - getAdoptionList");
			mv.setViewName("error");
		}
		return mv;
	}
	
	@RequestMapping(value="/adopter/myInfo",method = RequestMethod.GET)
	public ModelAndView getMyInfo(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		
		try{
			mv.setViewName("adopter_myInfo");
			Adopter adopter = (Adopter) session.getAttribute("user");
			mv.addObject("adopter", adopter);
		}
		catch(Exception e){
			System.out.println("AdopterController - getMyInfo");
		}
		return mv;
	}
	
	@RequestMapping(value="/adopter/myInfo", method = RequestMethod.POST)
	public ModelAndView postMyInfo( HttpServletRequest request, @RequestParam ("phone") String phone, @RequestParam ("address") String address) throws Exception{
		System.out.println("postMyInfo1");
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		
		try{
			List<Child> childList = childDAO.getAdopterChildAdoptionList();
			Adopter adopter = (Adopter) session.getAttribute("user");
			adopter.setPhone(phone);
			adopter.setAddress(address);
			String email = adopter.getEmail();
			
			
			System.out.println("postMyInfo2");
			userDAO.updateAdopter(email, phone, address);
			
			mv.setViewName("adopter_dashboard");
		}
		catch (Exception e)	{
			System.out.println("AdopterController - postMyInfo");
			mv.setViewName("error");
		}
		return mv;
		
	}
	
	@RequestMapping(value="/adopter/adoptionHistory",method = RequestMethod.GET)
	public ModelAndView getMyHistory(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		
		try{
			mv.setViewName("adopter_myAdoptionHistory");
			Adopter adopter = (Adopter) session.getAttribute("user");
			List<AdoptionRecord> myAdoptions = adoptionDAO.getAdoptionRecordListByAdopter(adopter);
			
			for(AdoptionRecord ar: myAdoptions) {
				ar.setAdopter(adopter);
				ar.setChild(childDAO.getChildById(ar.getChildId()));
			}
			session.setAttribute("myAdoptions", myAdoptions);
		}
		catch(Exception e){
			System.out.println("AdopterController - getMyInfo");
			mv.setViewName("error");
		}
		return mv;
	}
	
}
