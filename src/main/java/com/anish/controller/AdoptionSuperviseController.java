package com.anish.controller;

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
import com.anish.exception.ChildException;
import com.anish.pojo.Adopter;
import com.anish.pojo.AdoptionRecord;
import com.anish.pojo.Child;

import java.io.*;
import java.net.InetAddress;
import java.util.Properties;
import java.util.Date;

import javax.mail.*;

import javax.mail.internet.*;

import com.sun.mail.smtp.*;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

@Controller
//@RequestMapping("/adoptionSupervise/*")

public class AdoptionSuperviseController {
	@Autowired
	@Qualifier("adoptionRecordDAO")
	AdoptionRecordDAO adoptionDAO;
	
	@Autowired
	@Qualifier("childDAO")
	ChildDAO childDAO;
	
	@Autowired
	@Qualifier("userDAO")
	UserDAO userDAO;
	
	@Autowired
	@Qualifier("adoptionRecordDAO")
	AdoptionRecordDAO adoptionRecordDAO;
	
	@RequestMapping(value="/adoptionSupervise/adoptionDashboard",method = RequestMethod.GET)
	public ModelAndView getAdoptionDashboard( HttpServletRequest request ) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			mv.setViewName("adoption_workarea");
			//mv.addObject("adoptionRecordList", adoptionDAO.getAdoptionRecordList());
			List<AdoptionRecord> recordList = adoptionRecordDAO.getAdoptionRecordListPending();
			for(AdoptionRecord r: recordList) {
				r.setChild(childDAO.getChildById(r.getChildId()));
				r.setAdopter(userDAO.getAdopterByEmail(r.getAdopterEmail()));
			}
			session.setAttribute("records", recordList);
			//session.setAttribute("records", adoptionDAO.getAdoptionRecordListPending());
		}
		catch(Exception e){
			System.out.println("AdoptionSuperviserController - getAdoptionDashboard");
			mv.setViewName("ERROR");
		}
		return mv;
	}
	
	@RequestMapping(value="/adoptionSupervise/superviseNew", method = RequestMethod.GET)
	public ModelAndView postAdoptionDashboard( HttpServletRequest request,@RequestParam ("recordSelected") long recordid) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		try{
			mv.setViewName("adoption_superviseNew");
			System.out.println("step 1");
			
			//mv.addObject("adoptionRecordList", adoptionDAO.getAdoptionRecordList());
			AdoptionRecord record = (AdoptionRecord) adoptionDAO.getAdoptionRecordByID(recordid);
			Child child = childDAO.getChildById(record.getChildId());
		
			
			
			Adopter adopter = (Adopter) userDAO.getAdopterByEmail(record.getAdopterEmail());
			session.setAttribute("recordSelected", record);
			session.setAttribute("childSupervised", child);
			session.setAttribute("adopterSupervised", adopter);
			//mv.addObject("childTreated", child);
                        
		}
		catch(Exception e){
			System.out.println("AdoptionSuperviserController - getAdoptionDashboard");
			mv.setViewName("error");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/adoptionSupervise/superviseNew", method=RequestMethod.POST)
	public ModelAndView postAdoptionApproved( HttpServletRequest request, @RequestParam ("statusSelected") String statusSelected) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = (HttpSession) request.getSession();
		System.out.println("inside postAdoptionApproved");
		try{
			AdoptionRecord ar = (AdoptionRecord)session.getAttribute("recordSelected");
			ar.setStatus(statusSelected);
			adoptionDAO.updateAdoptionRecord(ar.getId(), statusSelected);
			String email = ar.getAdopterEmail();
                        //String childName = ar.getChild().getName();
                        
			Child child = (Child)session.getAttribute("childSupervised");
                        System.out.println(child.getName());
			if(statusSelected.equals("approved")) {
                            
                                Properties props = System.getProperties();
                                props.put("mail.smtps.host","smtp.gmail.com");
                                props.put("mail.smtps.auth","true");
                                Session session1 = Session.getInstance(props, null);
                                Message msg = new MimeMessage(session1);
                                msg.setFrom(new InternetAddress("systemchildcare@gmail.com"));;
                                msg.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(email, false));
                                msg.setSubject("Regarding Child Adoption");
                                msg.setText("Hey,\nCongrats!! The request for adoption of the child "+ child.getName()+" is approved!!\nClick here to view your profile http://localhost:8080/servlet/ \n\nBest,\nChild Adoption System");
                                msg.setSentDate(new Date());
                                SMTPTransport t =
                                    (SMTPTransport)session1.getTransport("smtps");
                                t.connect("smtp.gmail.com", "systemchildcare@gmail.com", "childcaresystem123");
                                t.sendMessage(msg, msg.getAllRecipients());
                                System.out.println("Response: " + t.getLastServerResponse());
                                t.close();
                                
				child.setStatus("adopted");
				childDAO.updateChild(child.getChildId(), "adopted");           
			}
			else {
                                Properties props = System.getProperties();
                                props.put("mail.smtps.host","smtp.gmail.com");
                                props.put("mail.smtps.auth","true");
                                Session session1 = Session.getInstance(props, null);
                                Message msg = new MimeMessage(session1);
                                msg.setFrom(new InternetAddress("systemchildcare@gmail.com"));;
                                msg.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(email, false));
                                msg.setSubject("Regarding Child Adoption");
                                msg.setText("Hey,\nWe the Child Adoption System regret to inform you that your request to adopt the child "+ child.getName()+" has been denied!!\n\nBest,\nChild Adoption System");
                                msg.setSentDate(new Date());
                                SMTPTransport t =
                                    (SMTPTransport)session1.getTransport("smtps");
                                t.connect("smtp.gmail.com", "systemchildcare@gmail.com", "childcaresystem123");
                                t.sendMessage(msg, msg.getAllRecipients());
                                System.out.println("Response: " + t.getLastServerResponse());
                                t.close();
                                
				child.setStatus("treated");
				childDAO.updateChild(child.getChildId(), "treated");
			}
			mv.setViewName("adoption_workarea");
			session.setAttribute("records", adoptionDAO.getAdoptionRecordListPending());
                        
                        pieChart();
			
			boolean isEmpty = false;
			if( adoptionDAO.getAdoptionRecordListPending().size() == 0 ) {
				isEmpty = true;
			}
			mv.addObject("isEmpty", isEmpty);
			
			return mv;
		}
		catch (Exception e)	{
			System.out.println(e);
			mv.setViewName("error");
		}
		return mv;
		
	}
        
        public void pieChart() throws IOException, ChildException{
            int count = 0;
            for(int i = 0; i < childDAO.getChildList().size(); i++){
                if(childDAO.getChildList().get(i).getStatus().equals("adopted")){
                    count++;
                }
            }
            
            System.out.println(count);
            
            DefaultPieDataset dataset = new DefaultPieDataset( );
            dataset.setValue("Unadopted", childDAO.getTotalCount() - count);
            dataset.setValue("Adopted", count);

            JFreeChart chart = ChartFactory.createPieChart(
               "Adopted vs Non-adopted",   // chart title
               dataset,          // data
               true,             // include legend
               true,
               false);
            
            int width = 640;   /* Width of the image */
            int height = 480;  /* Height of the image */ 
            File file = new File("/Users/anish/Downloads/FinalProject/src/main/webapp/resources/theme/images/piechart.png");
            file.delete();
            File pieChart = new File( "/Users/anish/Downloads/FinalProject/src/main/webapp/resources/theme/images/piechart.png" ); 
            ChartUtilities.saveChartAsPNG( pieChart , chart , width , height );
        }
        
}
