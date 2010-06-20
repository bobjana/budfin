package za.co.zynafin;

public enum Bank {

	ABSA("ABSA"),
	FNB("FNB"),
	STANDARDBANK("StandardBank"),
	NEDBANK("Nedbank");
	
	Bank(String name){
		this.name = name;
	}
	
	private String name;

	public String getName() {
		return name;
	}
	
}
