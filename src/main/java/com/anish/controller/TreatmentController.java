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

import com.anish.dao.ChildDAO;
import com.anish.dao.RescueRecordDAO;
import com.anish.dao.TreatmentRecordDAO;
import com.anish.dao.UserDAO;
import com.anish.pojo.Child;
import com.anish.pojo.Employee;
import com.anish.pojo.RescueRecord;
import com.anish.pojo.TreatmentRecord;

@Controller
public class TreatmentController {
    
	@Autowired
	@Qualifier("childDAO")
	ChildDAO childDAO;
	
	@Autowired
	@Qualifier("userDAO")
	UserDAO userDAO;
	
	@Autowired
	@Qualifier("rescueRecordDAO")
	RescueRecordDAO rescueRecordDAO;
	
	@Autowired
	@Qualifier("treatmentRecordDAO")
	TreatmentRecordDAO treatmentRecordDAO;
	
	@RequestMapping(value="/doctor/newTreat",method = RequestMethod.GET)
	public ModelAndView getTreat( HttpServletRequest request, @RequestParam ("childSelected") long childid) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			mv.setViewName("doctor_treat");
			Child child = childDAO.getChildById(childid);
			System.out.println("getTreat: " + child.getChildId());
			session.setAttribute("childTreated", child);
			mv.addObject("childTreated", child);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	@RequestMapping(value="/doctor/newTreat", method=RequestMethod.POST)
	public ModelAndView postTreat( HttpServletRequest request ) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			TreatmentRecord treat = new TreatmentRecord();
			Employee employee = (Employee) session.getAttribute("user");
			Child child = (Child) session.getAttribute("childTreated");
			treat.setDoctor(employee);
			treat.setChild(child);
			
			Calendar cal = Calendar.getInstance();
                        int year = cal.get(Calendar.YEAR); 
                        int month = cal.get(Calendar.MONTH); 
                        int date = cal.get(Calendar.DATE);
			treat.setDate(month+1, date, year);
			
			treat.setChildid(child.getChildId());
			treat.setDoctorid(employee.getEmployeeId());
			childDAO.updateChild(child.getChildId(), "treated");
			treatmentRecordDAO.addTreatmentRecord(treat);
			List<RescueRecord> recordList = rescueRecordDAO.getRescueRecordList();
			for(RescueRecord record: recordList) {
				record.setChild(childDAO.getChildById(record.getChildid()));
				record.setRegistrator(userDAO.getEmployeeByID(record.getRegistratorid()));
			}
			session.setAttribute("rescueRecordList", recordList);
			mv.setViewName("doctor_workarea");
			
			return mv;
		}
		catch (Exception e)	{
			System.out.println(e);
		}
		return mv;
		
	}
}
