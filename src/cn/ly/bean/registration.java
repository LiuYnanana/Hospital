package cn.ly.bean;

public class registration {
	  private String patientName;
	   private String departmentNumber;
	   private String doctorNumber;
	   private String registrationTime;
	   private String registrationFee;
	   
	   public String getPatientName() {
		   return patientName;
	   }
	   public String getDepartmentNumber() {
		   return departmentNumber;
	   }
	   public String getDoctorNumber() {
		   return doctorNumber;
	   }
	   public String getRegistrationTime() {
		   return registrationTime;
	   }
	   public String getRegistrationFee() {
		   return registrationFee;
	   }
	   
	   public void setPatientName(String patientName) {
		   this.patientName = patientName;
	   }
	   public void setDepartmentNumber(String departmentNumber) {
		   this.departmentNumber = departmentNumber;
	   }
	   public void setDoctorNumber(String doctorNumber) {
		   this.doctorNumber = doctorNumber;
	   }
	   public void setRegistrationTime(String registrationTime) {
		   this.registrationTime = registrationTime;
	   }
	   public void setRegistrationFee(String registrationFee) {
		   this.registrationFee = registrationFee;
	   }
}
