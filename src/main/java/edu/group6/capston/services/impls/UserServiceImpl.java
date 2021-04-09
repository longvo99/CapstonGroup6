package edu.group6.capston.services.impls;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.UserDAO;
import edu.group6.capston.mail.CustomerNotFoundException;
import edu.group6.capston.models.CustomUserDetails;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.UserService;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

	public static final int MAX_FAILED_ATTEMPTS = 3;

	private static final long LOCK_TIME_DURATION = 60 * 1000; // 24 hours

	@Autowired
	private UserDAO UserDAO;

	@Override
	public void sendMailWarning(String mail) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MailSender mailSender = (MailSender) context.getBean("mailSender2");
		System.out.println("Sending text...");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("haintde130138@gmail.com");
		message.setTo(mail);
		message.setSubject("Cảnh báo");
		message.setText("Tài khoản bạn bị khóa do ai đó đăng nhập bất thường. Vui lòng đổi mật khẩu sau 1 phút tới!");
		// sending message
		try {
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("Error!");
			context.close();
		}
		System.out.println("Sending text done!");
		context.close();
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) {
		// Kiểm tra xem user có tồn tại trong database không?
		Users user = UserDAO.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException(username);
		}
		return new CustomUserDetails(user);
	}

	@Override
	public List<Users> findAll() {
		return UserDAO.findAll();
	}
	/*
	 * @Override public int add(User User) { return UserDAO.add(User); }
	 * 
	 * @Override public int edit(UserDTO User, int cid) { return UserDAO.edit(User,
	 * cid); }
	 * 
	 * @Override public int delete(int id) { return UserDAO.delete(id); }
	 * 
	 * @Override public UserDTO findUserId(int cid) { return
	 * UserDAO.findUserId(cid); }
	 * 
	 * @Override public List<Role> findRoleAll() { return UserDAO.findRoleAll(); }
	 * 
	 * @Override public int totalRow() { return UserDAO.totalRow(); }
	 */

	@Override
	public List<Users> findByRoleId(String roleId) {
		return UserDAO.findByRoleId(roleId);
	}

	@Override
	public Users getProfile(Users users) {
		return UserDAO.getProfile(users);
	}

	@Override
	public boolean save(Users user) {
		return UserDAO.save(user);
	}

	@Override
	public Users findByUsername(String username) {
		// TODO Auto-generated method stub
//		System.out.println(username);
//		Users user = UserDAO.findByUsername(username);
//		System.out.println("a" + user.getUsername());
//		user.setUsername("admin5");
//		user.setPassword("123456");
//		boolean a = save(user);
//		System.out.println("a" + a);
		return UserDAO.findByUsername(username);
	}

	@Override
	public Users findByUsersId(int i) {
		return UserDAO.findByUsersId(i);
	}

	@Override
	public Users findByEmail(String email) {
		return UserDAO.findByEmail(email);
	}

	@Override
	public Users findOneByUserId(Integer userId) {
		return UserDAO.findOneByUserId(userId);
	}

	public void increaseFailedAttempts(Users user) {
		int newFailAttempts = user.getFailedAttempt() + 1;
		UserDAO.updateFailedAttempts(newFailAttempts, user.getUsername());
	}

	public void resetFailedAttempts(String username) {
		UserDAO.updateFailedAttempts(0, username);
	}

	public void lock(Users user) {
		user.setBanned(true);
		user.setLockTime(new Date());
		UserDAO.updateBannedAndLockTime(user);
	}

	public boolean unlockWhenTimeExpired(Users user) {
		long lockTimeInMillis = user.getLockTime().getTime();
		long currentTimeInMillis = System.currentTimeMillis();

		if (lockTimeInMillis + LOCK_TIME_DURATION < currentTimeInMillis) {
			user.setBanned(false);
			user.setLockTime(null);
			user.setFailedAttempt(0);
			UserDAO.updateBannedAndTimeAndFailedAttempt(user);
			return true;
		}

		return false;
	}

	@Override
	public boolean checkUserExist(String username) {
		return UserDAO.checkUserExist(username);
	}

	@Override
	public void sendMailNewAccount(String mail, String username) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MailSender mailSender = (MailSender) context.getBean("mailSender2");
		System.out.println("Sending text...");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("haintde130138@gmail.com");
		message.setTo(mail);
		message.setSubject("Tài khoản mới");
		message.setText("Tài khoản:" + username + "\nPassword:123456\nVui lòng đăng nhập để đổi tài khoản!");
		// sending message
		try {
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("Error!");
			context.close();
		}
		System.out.println("Sending text done!");
		context.close();
	}
	
	public void sendMailResetPassword(String mail, String token) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MailSender mailSender = (MailSender) context.getBean("mailSender2");
		System.out.println("Sending text...");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("haintde130138@gmail.com");
		message.setTo(mail);
		message.setSubject("LINK RESET PASSWORD");
		message.setText(token);
		// sending message
		try {
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("Error!");
			context.close();
		}
		System.out.println("Sending text done!");
		context.close();
	}

	@Override
	public Users findByResetPasswordToken(String token) {
		return UserDAO.findByResetPasswordToken(token);
	}

	public void updateResetPasswordToken(String token, String email, String username) throws CustomerNotFoundException {
		Users users = UserDAO.findByEmailAndUserName(email, username);
        if (users != null) {
        	users.setResetPasswordToken(token);
            UserDAO.update(users);
        } else {
            throw new CustomerNotFoundException("Email và Tài khoản không hợp lệ!");
        }
	}

	public Users getByResetPasswordToken(String token) {
        return UserDAO.findByResetPasswordToken(token);
    }

	public void updatePassword(Users users, String newPassword) {
        users.setPassword(newPassword);
        users.setResetPasswordToken(null);
        UserDAO.update(users);
    }

	@Override
	public boolean setStatusByUserId(int id, Boolean status) {
		return UserDAO.setStatusByUserId(id, status);
	}

	@Override
	public boolean update(Users user) {
		// TODO Auto-generated method stub
		return UserDAO.update(user);
	}

}
