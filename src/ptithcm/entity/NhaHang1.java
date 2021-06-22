package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="NhaHang")
public class NhaHang1 {
	@Id
	@GeneratedValue
	private Integer MaNH;
	private String TenNH;
	private String Diachi;
	private String SDT;
	private Integer Gia;
	private Integer Soban;
	private String Images;
	private String Loai;
	public Integer getMaNH() {
		return MaNH;
	}
	public void setMaNH(Integer maNH) {
		MaNH = maNH;
	}
	public String getTenNH() {
		return TenNH;
	}
	public void setTenNH(String tenNH) {
		TenNH = tenNH;
	}
	public String getDiachi() {
		return Diachi;
	}
	public void setDiachi(String diachi) {
		Diachi = diachi;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public Integer getGia() {
		return Gia;
	}
	public void setGia(Integer gia) {
		Gia = gia;
	}
	public Integer getSoban() {
		return Soban;
	}
	public void setSoban(Integer soban) {
		Soban = soban;
	}
	public String getImages() {
		return Images;
	}
	public void setImages(String images) {
		Images = images;
	}
	public String getLoai() {
		return Loai;
	}
	public void setLoai(String loai) {
		Loai = loai;
	}
	
}
