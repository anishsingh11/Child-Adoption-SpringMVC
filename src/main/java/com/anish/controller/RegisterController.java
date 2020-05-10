package com.anish.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.anish.dao.ChildDAO;
import com.anish.dao.RescueRecordDAO;
import com.anish.dao.UserDAO;
import com.anish.exception.RescueRecordException;
import com.anish.pojo.Child;
import com.anish.pojo.Employee;
import com.anish.pojo.RescueRecord;

@Controller
//@RequestMapping("/registration/*")
public class RegisterController {
	
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
	ServletContext servletContext;
	
	@RequestMapping(value="/registration/registrator_workarea",method = RequestMethod.GET)
	public ModelAndView getRegisterWorkarea() throws RescueRecordException{
		ModelAndView mv = new ModelAndView();
		try {
			System.out.println("Inside getRegisterWorkarea()");
			mv.setViewName("registrator_workarea");
			mv.addObject("recordList", rescueRecordDAO.getRescueRecordList());
		}
		catch(Exception e) {
			System.out.println("getRegisterWorkarea() : " + e);
		}
		return mv;
	}
	
	@RequestMapping(value="/registration/newChild",method = RequestMethod.GET)
	public ModelAndView getRegisterNew() throws RescueRecordException{
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("registrator_addChild");
			mv.addObject("recordList", rescueRecordDAO.getRescueRecordList());
		}
		catch(Exception e) {
			System.out.println("getRegisterNew() : " + e);
		}
		return mv;
	}
	
	@RequestMapping(value="/registration/newChild", method=RequestMethod.POST)
	public ModelAndView postRegisterNew( HttpServletRequest request, @RequestParam("type") String type, @RequestParam("age") int age, @RequestParam("name") String name, @RequestParam("gender") String gender, @RequestParam("color") String color, @ModelAttribute("model") Child model) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
                
		try{
			if (model.getFile() != "" || model.getFile() != null) {
				File directory;
				String check = File.separator; 
												
				String path = null;
				if (check.equalsIgnoreCase("\\")) {
					path = servletContext.getRealPath("").replace("build\\", ""); 
					System.out.println("2 - " + path);						
				}
				
				System.out.println("3 - " + path);
			
				directory = new File(path + "\\" + model.getPhoto());
				System.out.println("4 - " + directory);
				boolean temp = directory.exists();
				if (!temp) {
					temp = directory.mkdir();
				}
				if (temp) {
					CommonsMultipartFile photoInMemory = model.getPhoto();

					String fileName = photoInMemory.getOriginalFilename();

					File localFile = new File(directory.getPath(), fileName);


					photoInMemory.transferTo(localFile);
					model.setFile(localFile.getPath());
					System.out.println("File is stored at " + localFile.getPath());
				}
			}
                        
                        //int ag = Integer.parseInt(age);
			model.setType(type);
			model.setGender(gender);
			model.setColor(color);
                        model.setAge(age);
                        model.setName(name);
			model.setStatus("untreated");
			childDAO.addChild(model);
			
			RescueRecord rr = new RescueRecord();
			Employee e = (Employee) session.getAttribute("user");
			//System.out.println(e.getEmployeeId());
			rr.setChild(model);
			rr.setChildid(model.getChildId());
			rr.setRegistrator(e);
			rr.setRegistratorid(e.getEmployeeId());
			Calendar c = Calendar.getInstance();
                        int year = c.get(Calendar.YEAR); 
                        int month = c.get(Calendar.MONTH); 
                        int date = c.get(Calendar.DATE);
			rr.setDate(month+1, date, year);
			rescueRecordDAO.addRescueRecord(rr);
			
			List<RescueRecord> recordList = rescueRecordDAO.getRescueRecordList();
			for(RescueRecord r: recordList) {
				r.setChild(childDAO.getChildById(r.getChildid()));
				r.setRegistrator(userDAO.getEmployeeByID(r.getRegistratorid()));
			}
			session.setAttribute("rescueRecordList", recordList);
			mv.setViewName("registrator_workarea");
			return mv;
		}
		catch (Exception e)	{
			System.out.println(e + ": " + e.getMessage() + ": " + e.getCause());
		}
		return mv;
		
	}
	
	
}
