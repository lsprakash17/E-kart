package com.prjct.emarket.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.prjct.emarket.dao.Merchantdao;
import com.prjct.emarket.dto.Merchant;
import com.prjct.emarket.dto.Product;
import com.prjct.emarket.helper.SendmailMerchant;
import com.prjct.emarket.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class MerchantService {

	@Autowired
	Merchantdao merchantdao;

	@Autowired
	SendmailMerchant mail;
	
	@Autowired
	ProductRepository productRepository;

	public String signup(ModelMap model, Merchant merchant, String date, MultipartFile picture) throws IOException {
		merchant.setDob(LocalDate.parse(date));
		byte[] pic = new byte[picture.getInputStream().available()];
		picture.getInputStream().read(pic);
		merchant.setPicture(pic);
		if (merchantdao.findByEmail(merchant.getEmail()) != null
				|| merchantdao.findByMobile(merchant.getMobile()) != null) {
			model.put("fail", "Email or Mobile Should not be repeated");
			return "MerchantSignup";
		}

		// logic for otp
		int otp = new Random().nextInt(100000, 999999);
		merchant.setOtp(otp);
		// Logic For Sending Mail

		if (mail.sendOtp(merchant)) {
			Merchant merchant1 = merchantdao.save(merchant);
			model.put("merchant", merchant1);
			return "SignupOtp";
		} else {
			model.put("fail", "something went wtrong");
			return "MerchantSignup";
		}

	}

//	public String verify(String email, int otp, ModelMap model) {
//		Merchant merchant = merchantdao.findByEmail(email);
//		if (merchant.getOtp() == otp) {
//			merchant.setStatus(true);
//			merchant.setOtp(0);
//			merchantdao.save(merchant);
//			model.put("pass", "Account Verified SuccessFully");
//			return "MerchantLogin";
//		} else {
//			model.put("fail", "Account not created otp entered invalid");
//			model.put("merchant", merchant);
//			return "SignupTtp";
//		}
//	}
	public String verifyOtp(String email, int otp, ModelMap model) {
		Merchant merchant = merchantdao.findByEmail(email);
		if (merchant.getOtp() == otp) {
			merchant.setStatus(true);
			merchant.setOtp(0);
			merchantdao.save(merchant);
			model.put("pass", "Account Verified SuccessFully");
			return "MerchantLogin";
		} else {
			model.put("fail", "Account not created otp entered invalid");
			model.put("merchant", merchant);
			return "SignupOtp";
		}
	}

	public String resendOtp(String email, ModelMap model) {
		Merchant merchant = merchantdao.findByEmail(email);
		// logic for otp
		int otp = new Random().nextInt(100000, 999999);
		merchant.setOtp(otp);
		if (mail.sendOtp(merchant)) {
			Merchant merchant1 = merchantdao.save(merchant);
			model.put("merchant", merchant1);
			return "SignupOtp";
		} else {
			model.put("fail", "something went wtrong");
			return "MerchantSignup";
		}

	}

	public String sendForgotPass(String email, ModelMap model) {

		Merchant merchant = merchantdao.findByEmail(email);
		if (merchant == null) {
			model.put("fail", "Email not exist pls SignUp");
			return "MerchantSignup";
		} else {
			int otp = new Random().nextInt(100000, 999999);
			merchant.setOtp(otp);
			if (mail.sendOtp(merchant)) {
				Merchant merchant1 = merchantdao.save(merchant);
				model.put("merchant", merchant1);
				model.put("pass", "Otp sent Success");
				return "ForgotPassword";
			} else {
				model.put("fail", "something went wtrong");
				return "MerchantForgotPassword";
			}
		}

	}

	public String verifyforgotpassotp(String email, int otp, ModelMap model) {
		Merchant merchant = merchantdao.findByEmail(email);
		if (merchant.getOtp() == otp) {
			merchant.setStatus(true);
			merchant.setOtp(0);
			merchantdao.save(merchant);
			model.put("merchant", merchant);
			model.put("pass", "Account Verified SuccessFully");
			return "MerchantNewPassword";
		} else {
			model.put("fail", "Incorrect OTP");
			model.put("extra", "Again");
			model.put("merchant", merchant);
			return "ForgotPassword";
		}
	}

	public String resendforgotOtp(String email, ModelMap model) {
		Merchant merchant = merchantdao.findByEmail(email);
		// logic for otp
		int otp = new Random().nextInt(100000, 999999);
		merchant.setOtp(otp);
		if (mail.sendOtp(merchant)) {
			Merchant merchant1 = merchantdao.save(merchant);
			model.put("merchant", merchant1);
			return "ForgotPassword";
		} else {
			model.put("fail", "something went wtrong");
			return "MerchantForgotPassword";
		}

	}

	public String setPassword(String email, String password, ModelMap model) {
		Merchant merchant = merchantdao.findByEmail(email);
		merchant.setPassword(password);
		merchantdao.save(merchant);
		model.put("pass", "Password Reset Success");
		return "MerchantLogin";
	}

	public String loginMerchant(String email, String password, ModelMap model, HttpSession session) {
		Merchant merchant = merchantdao.findByEmail(email);
		if (merchant == null) {
			model.put("fail", "Icorrect password");
			return "MerchantLogin";
		} else {
			if (merchant.getPassword().equals(password)) {
				session.setAttribute("merchant", merchant);
				model.put("pass", "Login Success");
				return "MerchantHome";
			} else {
				model.put("fail", "Icorrect password");
				return "MerchantLogin";
			}
		}

	}

	public void name() {

	}

	public String addProduct(Product product, ModelMap model, MultipartFile pic, HttpSession session)
			throws IOException {
		Merchant merchant = (Merchant) session.getAttribute("merchant");
		byte[] image = new byte[pic.getInputStream().available()];
		pic.getInputStream().read(image);
		product.setImage(image);
		product.setName(merchant.getName() + "-" + product.getName());
		Product product2 = merchantdao.findByName(product.getName());
		if (product2 != null) {
			product.setId(product2.getId());
			product.setStock(product.getStock() + product2.getStock());
		}
		List<Product> products = merchant.getProducts();
		if (products == null) {
			products = new ArrayList();
		}
		products.add(product);
		merchant.setProducts(products);
		session.setAttribute("merchant", merchantdao.save(merchant));
		model.put("pass", "Product Added Successfully");
		return "MerchantHome";
	}

	public String fetchAllProducts(HttpSession session, ModelMap model) {
		Merchant merchant = (Merchant) session.getAttribute("merchant");

		if (merchant.getProducts() == null || merchant.getProducts().equals("merchant")) {
			model.put("fail", "Products Not Found");
			return "MerchantHome";
		}

		else {
			model.put("products", merchant.getProducts());
			return "MerchantDisplayProduct";
		}
	}

	public String deleteProduct(int id, ModelMap model,HttpSession session)
	{
	 Product product=merchantdao.findById(id);
	 Merchant merchant=(Merchant) session.getAttribute("merchant");
	 merchant.getProducts().remove(product);
	 merchantdao.save(merchant);
	  merchantdao.removeProduct(product);
	  model.put("pass","Product Succefully deleted");
	  if (merchant.getProducts() == null || merchant.getProducts().equals("merchant")) {
			model.put("fail", "Products Not Found");
			return "MerchantHome";
		}

		else {
			model.put("products", merchant.getProducts());
			return "MerchantDisplayProduct";
		}
}

	public String updateProduct(int id, HttpSession session, ModelMap model) 
	{
		 Product product=merchantdao.findById(id);
		 Merchant merchant=(Merchant) session.getAttribute("merchant");
		 if (merchant.getProducts() == null || merchant.getProducts().equals("merchant"))
		 {
				model.put("fail", "Products Not Found");
				return "MerchantHome";
			}

			else {
				model.put("product", product);
				return "MerchantProductUpdate";
			}
	}
	public String updateProduct(ModelMap model, int id) 
	{
			Product product = merchantdao.findProductById(id);
			model.put("product", product);
			return "MerchantProductUpdate";
	}

	public String updateProduct(ModelMap model, Product product, HttpSession session) {
		product.setImage(merchantdao.findProductById(product.getId()).getImage());
		product.setStatus(merchantdao.findProductById(product.getId()).isStatus());
		productRepository.save(product);
		model.put("pass", "Product UpdatedSuccessfully");
		Merchant merchant1=(Merchant) session.getAttribute("merchant");
		Merchant merchant=merchantdao.findByEmail(merchant1.getEmail());
		session.setAttribute("merchant", merchant);
		if (merchant.getProducts() == null || merchant.getProducts().isEmpty()) {
			model.put("fail", "Products Not Found");
			return "MerchantHome";
		} else {
			model.put("products", merchant.getProducts());
			model.put("pass", "Updated Success");
			return "MerchantDisplayProduct";
		}
	}
	
}




