package cn.ly.bean;

public class patient {
	  private String patientName;
	   private String patientSex;
	   private String patientDescription;
	   private String medicinal;
	   private String time;
	   private String doctorNumber;
	   
	   public String getPatientName() {
		   return patientName;
	   }
	   public String getPatientSex() {
		   return patientSex;
	   }
	   public String getPatientDescription() {
		   return patientDescription;
	   }
	   public String getMedicinal() {
		   return medicinal;
	   }
	   public String getTime() {
		   return time;
	   }
	   public String getDoctorNumber() {
		   return doctorNumber;
	   }
	   
	   public void setPatientName(String patientName) {
		   this.patientName = patientName;
	   }
	   public void setPatientSex(String patientSex) {
		   this.patientSex = patientSex;
	   }
	   public void setPatientDescription(String patientDescription) {
		   this.patientDescription = patientDescription;
	   }
	   public void setMedicinal(String medicinal) {
		   this.medicinal = medicinal;
	   }
	   public void setTime(String time) {
		   this.time = time;
	   }
	   public void setDoctorNumber(String doctorNumber) {
		   this.doctorNumber = doctorNumber;
	   }
}
