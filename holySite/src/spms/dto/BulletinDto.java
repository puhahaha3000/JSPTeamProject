package spms.dto;

public class BulletinDto {
	private int no;
	private String title;
	private String text;
	private String createdDate;
	private String writer;
	
	
	public BulletinDto() {
		super();
	}


	public BulletinDto(int no, String title, String text, String createdDate, String writer) {
		super();
		this.no = no;
		this.title = title;
		this.text = text;
		this.createdDate = createdDate;
		this.writer = writer;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	@Override
	public String toString() {
		return "BulletinDto [no=" + no + ", title=" + title + ", text=" + text + ", createdDate=" + createdDate
				+ ", writer=" + writer + "]";
	}
	
	
}
