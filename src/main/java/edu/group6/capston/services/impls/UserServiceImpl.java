package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;

import edu.group6.capston.daos.UserDAO;
import edu.group6.capston.models.CustomUserDetails;
import edu.group6.capston.models.Users;
import edu.group6.capston.services.UserService;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {
	@Autowired
	private UserDAO UserDAO;
	
	@Autowired
    private UserService userRepository;
	
	@Override
    public UserDetails loadUserByUsername(String username) {
        // Kiểm tra xem user có tồn tại trong database không?
        Users user = userRepository.findByUsername(username);
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
	@Override
	public int add(User User) {
		return UserDAO.add(User);
	}

	@Override
	public int edit(UserDTO User, int cid) {
		return UserDAO.edit(User, cid);
	}

	@Override
	public int delete(int id) {
		return UserDAO.delete(id);
	}

	@Override
	public UserDTO findUserId(int cid) {
		return UserDAO.findUserId(cid);
	}

	@Override
	public List<Role> findRoleAll() {
		return UserDAO.findRoleAll();
	}

	@Override
	public int totalRow() {
		return UserDAO.totalRow();
	}
	*/

	@Override
	public List<Users> findByRoleName(String roleName) {
		// TODO Auto-generated method stub
		return UserDAO.findByRoleName(roleName);
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
	public boolean update(Users user) {
		// TODO Auto-generated method stub
		return UserDAO.update(user);
	}
}
