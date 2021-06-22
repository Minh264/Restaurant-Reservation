package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Login")
public class Login1 {
	@Id
	private String Users;
	private String Password;
	public String getUsers() {
		return Users;
	}
	public void setUsers(String users) {
		Users = users;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public Login1(String users, String password) {
		Users = users;
		Password = password;
	}
	
}
