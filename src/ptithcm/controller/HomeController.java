package ptithcm.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.id.SequenceIdentityGenerator.Delegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Book1;
import ptithcm.entity.Login1;
import ptithcm.entity.NhaHang1;

@Transactional
@Controller
@RequestMapping("/home/")
public class HomeController {
	 @Autowired
	 SessionFactory factory;	 
	@RequestMapping("index")
	public String index(ModelMap model,HttpServletRequest request) {
		  Session session = factory.getCurrentSession(); 
		  String hql="FROM NhaHang1";
		  Query query = session.createQuery(hql); 
		  List<NhaHang1> list= query.list();
		  model.addAttribute("NhaHang", list);		 
		return "home/index";
	}	
	@RequestMapping(value="index",params = "btnlogout",method=RequestMethod.POST)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return"home/index";
	}
	//-----------------// Contact
	@RequestMapping(value="contact",method = RequestMethod.GET)
	public String contact() {
		
		return"home/contact";
	}
	//------------------// Login
	@RequestMapping(value="login",method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return"home/login";
	}
	@RequestMapping(value="login",params = "btnlogin",method = RequestMethod.POST)
	public String login(HttpServletRequest request,ModelMap model) {
		String uname= request.getParameter("uname");
		String psw = request.getParameter("psw");
		Session session = factory.getCurrentSession(); 
		  String hql="Select Users From Login1  WHERE Users= :uname And Password= :psw";
		  Query query = session.createQuery(hql); 
		  query.setParameter("uname", uname);
		  query.setParameter("psw", psw);
		  List<Login1> list= query.list();
		  if(list.isEmpty()==false) {
			  request.getSession().setAttribute("uname", uname);
			  return"redirect:/home/index.htm";
		  } else model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
		  return"home/login";  
	}	
	//-----------------// Create Login
	@RequestMapping(value="crlogin",method = RequestMethod.GET)
	public String crlogin() {
		return"home/crlogin";
	}
	@RequestMapping(value="crlogin",params = "btnCrlogin",method = RequestMethod.POST)
	public String crlogin(HttpServletRequest request,ModelMap model) {
		String uname= request.getParameter("uname");
		String psw = request.getParameter("psw");
		Session session = factory.getCurrentSession();
		String hql="Select Users From Login1  WHERE Users= :uname And Password= :psw";
		  Query query = session.createQuery(hql); 
		  query.setParameter("uname", uname);
		  query.setParameter("psw", psw);
		  List<Login1> list= query.list();
		  if(list.isEmpty()==false) {
			  model.addAttribute("message", "Tài khoản đã tồn tại!");
		  } else {
				Session session1 = factory.openSession();
				session1.beginTransaction();
				try {
					Login1 lg = new Login1(uname,psw);
					session1.save(lg);
					session1.getTransaction().commit();
					model.addAttribute("message", "Tạo tài khoản thành công!");
				}catch (Exception e) {
					session1.getTransaction().rollback();
					model.addAttribute("message", "Tạo tài khoản thất bại!");
				}
				finally {
					session1.close();
				}		
		  }
		return"home/crlogin";
	}
	//-----------------// Insert
	public boolean validate(ModelMap model,@ModelAttribute("NhaHang")NhaHang1 NhaHang,BindingResult errors ) {
		int dem=0;
		if(NhaHang.getTenNH().trim().length()==0) {
			errors.rejectValue("TenNH", "NhaHang", "Vui lòng nhập Tên Nhà Hàng!");
			dem++;
		}
		if(NhaHang.getDiachi().trim().length()==0) {
			errors.rejectValue("Diachi", "NhaHang", "Vui lòng nhập Địa Chỉ!");
			dem++;
		}
		if(NhaHang.getSDT().trim().length()==0) {
			errors.rejectValue("SDT", "NhaHang", "Vui lòng nhập SDT!");
			dem++;
		}
		if(NhaHang.getGia()==null || NhaHang.getGia() <=0 ) {
			errors.rejectValue("Gia", "NhaHang", "Vui lòng nhập Giá!");
			dem++;
		}
		if(NhaHang.getSoban()==null || NhaHang.getSoban() <=0) {
			errors.rejectValue("Soban", "NhaHang", "Vui lòng nhập Số bàn!");
			dem++;
		}
		if(dem>0) return false;
		return true;
	}
	@RequestMapping(value="insert",method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("NhaHang", new NhaHang1());
		return"home/insert";
	}
	ServletContext context;
	@RequestMapping(value="insert",params = "btnInsert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,ModelMap model,@RequestParam("Images") MultipartFile Images,@ModelAttribute("NhaHang")NhaHang1 NhaHang,BindingResult errors) {
		
		NhaHang.setImages("images/"+Images.getOriginalFilename());
		Session session =factory.openSession();
		Transaction t= session.beginTransaction();
		try {			
			if(Images.getContentType().equals("image/png") || Images.getContentType().equals("image/jpg") || Images.getContentType().equals("image/jpeg")) {
				if(validate(model, NhaHang,errors)==true) {
					File file = new File("D:/Data/DataInvi/Eclipse-Workspace/Booking/WebContent/images",Images.getOriginalFilename());
					Images.transferTo(file);
					session.save(NhaHang);
					t.commit();
					model.addAttribute("message", "Insert thành công!");
				}
			}else model.addAttribute("message", "Lỗi Upload Ảnh!");
		} catch (Exception e) {
			model.addAttribute("message", "Lỗi Insert!");
			t.rollback();
		}
		finally {
			session.close();
		}
		return"home/insert";
	}
	//-------------------// Update
	@RequestMapping(value="update/{MaNH}",method = RequestMethod.GET)
	public String update(ModelMap model,@PathVariable("MaNH") Integer MaNH) {
		Session session = factory.getCurrentSession();
		NhaHang1 NhaHang = (NhaHang1) session.get(NhaHang1.class, MaNH);
		model.addAttribute("NhaHang", NhaHang);
		return"home/update";
	}
	@RequestMapping(value="update/{MaNH}",method = RequestMethod.POST, params = "btnUpdate")
	public String update(ModelMap model, @ModelAttribute("NhaHang")NhaHang1 NhaHang,BindingResult errors,@RequestParam("Imagesfl") MultipartFile Imagesfl) {	
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(Imagesfl.getContentType().equals("image/png") || Imagesfl.getContentType().equals("image/jpg") || Imagesfl.getContentType().equals("image/jpeg")) {
				if(validate(model, NhaHang,errors)==true ) {
					if(NhaHang.getImages().trim().length()==0) {
						errors.rejectValue("Images", "NhaHang", "Vui lòng nhập Images!");
					}
					if(Imagesfl.getOriginalFilename().trim().length()!=0) {
						NhaHang.setImages("images/"+Imagesfl.getOriginalFilename());
						File file = new File("D:/Data/DataInvi/Eclipse-Workspace/Booking/WebContent/images",Imagesfl.getOriginalFilename());
						Imagesfl.transferTo(file);
					} 
					session.update(NhaHang);
					t.commit();
					model.addAttribute("message", "Update thành công!");
				}
			}else model.addAttribute("message", "Lỗi Upload Ảnh!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Lỗi Update!");
		}finally {
			session.close();
		}
		return"home/update";
	}
	//--------------------// Delete
	@RequestMapping(value="delete",method = RequestMethod.GET)
	public String delete(ModelMap model,HttpServletRequest request) {
		  Session session = factory.getCurrentSession(); 
		  String hql="FROM NhaHang1";
		  Query query = session.createQuery(hql); 
		  List<NhaHang1> list= query.list();
		  model.addAttribute("NhaHang", list);		 
		return "home/delete";
	}
	@SuppressWarnings("finally")
	@RequestMapping(value="delete/{MaNH}")
	public String delete(@PathVariable("MaNH") Integer MaNH,ModelMap model) {
		Session session= factory.openSession();
		Transaction t = session.beginTransaction();
		NhaHang1 nh = (NhaHang1) session.get(NhaHang1.class, MaNH);
		try {
			session.delete(nh);
			t.commit();
		} catch(Exception e) {
			
		} finally {
			session.close();
			return"redirect:/home/delete.htm";
		}
	}
	//-----------------// Reserve
	public boolean validatebk(ModelMap model,@ModelAttribute("Book")Book1 Book,BindingResult errors ) {
		int dem=0;
		if(Book.getHoTen().trim().length()==0) {
			errors.rejectValue("HoTen", "Book", "Vui lòng nhập Họ và Tên!");
			dem++;
		}
		if(Book.getSDT().trim().length()==0) {
			errors.rejectValue("SDT", "Book", "Vui lòng nhập SDT!");
			dem++;
		}
		if(Book.getEmail().trim().length()==0) {
			errors.rejectValue("SDT", "Book", "Vui lòng nhập Email!");
			dem++;
		}
		if(Book.getThoiGian()==null ) {
			errors.rejectValue("ThoiGian", "Book", "Vui lòng nhập Thời Gian!");
			dem++;
		}
		if(dem>0) return false;
		return true;
	}
	@RequestMapping(value="reserve/{MaNH}",method = RequestMethod.GET)
	public String reserve(ModelMap model,@PathVariable("MaNH") Integer MaNH) {
		Session session = factory.getCurrentSession();
		NhaHang1 NhaHang = (NhaHang1) session.get(NhaHang1.class, MaNH);
		model.addAttribute("NhaHang", NhaHang);
		model.addAttribute("Book", new Book1());
		return"home/reserve";
	}	
	 @Autowired 
	 JavaMailSender mailer;
	@RequestMapping(value="reserve/{MaNH}",method = RequestMethod.POST, params = "btnReserve")
	public String reserve(ModelMap model,@PathVariable("MaNH") Integer MaNH, @ModelAttribute("Book")Book1 Book,BindingResult errors) {	
		Session session1 = factory.getCurrentSession();
		NhaHang1 NhaHang = (NhaHang1) session1.get(NhaHang1.class, MaNH);
		model.addAttribute("NhaHang", NhaHang);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String from = "n17dccn097@student.ptithcm.edu.vn";
		String to = Book.getEmail().toString().trim();
		String subject = "Xác nhận đặt bàn thành công !";
		String body = " Bạn đã đặt bàn thành công ! \n"+ NhaHang.getTenNH().toString().trim() +" Thời Gian : " + Book.getThoiGian() ;
		try {
			if(validatebk(model, Book,errors)==true ) {	
				MimeMessage mail = mailer.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom(from, from);
				helper.setTo(to);
				helper.setReplyTo(from,from);
				helper.setSubject(subject);
				helper.setText(body,true);
				mailer.send(mail);
				Book.setMaNH(MaNH);
				session.save(Book);
				t.commit();
				model.addAttribute("message", "  Đặt Bàn Thành Công, Chúng tôi sẽ gửi mail xác nhận!");
			}
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "  Lỗi !");
		}finally {
			session.close();
		}
		return"home/reserve";
	}
}
