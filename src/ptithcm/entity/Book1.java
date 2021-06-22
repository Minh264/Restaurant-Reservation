package ptithcm.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name="DatBan")
public class Book1 {
	@Id
	@GeneratedValue
	private Integer MaBK;
	private String HoTen;
	private String SDT;
	private String Email;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(iso = ISO.DATE)
	private Date ThoiGian;
	private Integer MaNH;
	public Integer getMaBK() {
		return MaBK;
	}
	public void setMaBK(Integer maBK) {
		MaBK = maBK;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Date getThoiGian() {
		return ThoiGian;
	}
	public void setThoiGian(Date thoiGian) {
		ThoiGian = thoiGian;
	}
	public Integer getMaNH() {
		return MaNH;
	}
	public void setMaNH(Integer maNH) {
		MaNH = maNH;
	}
	
		

}
