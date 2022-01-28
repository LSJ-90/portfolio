package com.hoge.form;

public class CriteriaAdminQnA {

	private String answered;
	private String opt;
	private String value;
	private int beginIndex;
	private int endIndex;
	
	public CriteriaAdminQnA() {}


	public String getAnswered() {
		return answered;
	}


	public void setAnswered(String answered) {
		this.answered = answered;
	}


	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public int getBeginIndex() {
		return beginIndex;
	}
	
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
	
	public int getEndIndex() {
		return endIndex;
	}
	
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	@Override
	public String toString() {
		return "Criteria [opt=" + opt + ", value=" + value + ", beginIndex=" + beginIndex + ", endIndex=" + endIndex
				+ "]";
	}

	
}
